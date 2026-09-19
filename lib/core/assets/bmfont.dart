import 'dart:ui' as ui;
import 'package:flutter/material.dart';

/// Anchor flags matching J2ME/LibGDX mGraphics.
abstract final class GraphicsAnchor {
  static const int hCenter = 1;
  static const int vCenter = 2;
  static const int left = 4;
  static const int right = 8;
  static const int top = 16;
  static const int bottom = 32;
}

class BmChar {
  BmChar(this.id, this.x, this.y, this.w, this.h, this.xOff, this.yOff, this.xAdv);
  final int id, x, y, w, h, xOff, yOff, xAdv;
}

/// Port of CLib/SysTemFont and mFont.
/// Supports AngelCode BMFont (.fnt text) and Java color palettes.
class BmFont {
  BmFont._(this.atlas, this.chars, this.lineHeight, this.charSpace);

  final ui.Image atlas;
  final Map<int, BmChar> chars;
  final int lineHeight;
  final double charSpace;

  /// Palette from mFont.java: colorJava[id + 1].
  /// Converted from 32-bit signed integers to Flutter Colors.
  static const List<Color> palette = [
    Color(0xFFFE9D1A), // -90838
    Color(0xFF72993F), // -9265665
    Color(0xFF131113), // -15527149
    Color(0xFFFDFF9B), // -197061
    Color(0xFFB472FF), // -4947201
    Color(0xFFFFFFFF), // -1
    Color(0xFF66E291), // -10035407
    Color(0xFF481230), // -12052464
    Color(0xFFFF0000), // -65536
    Color(0xFF131113), // -15527149
    Color(0xFFFFFFFF), // -1
    Color(0xFFFDFF9B), // -197061
    Color(0xFFFE9D1A), // -90838
    Color(0xFFFF0000), // -65536
    Color(0xFF72993F), // -9265665
    Color(0xFF66E291), // -10035407
    Color(0xFFB472FF), // -4947201
    Color(0xFFFDFF9B), // -197061
    Color(0xFFFF0000), // -65536
    Color(0xFF66E291), // -10035407
    Color(0xFFFFFFFF), // -1
    Color(0xFFFE9D1A), // -90838
    Color(0xFFFDFF9B), // -197061
    Color(0xFFB676B1), // -4819663
    Color(0xFF131113), // -15527149
    Color(0xFF676B67), // -10000537
  ];

  static Future<BmFont> load(
    String fntPath,
    Future<ui.Image> Function(String imagePath) loadAtlas,
    Future<String> Function(String path) loadString,
  ) async {
    final fntSource = await loadString(fntPath);
    return parse(fntSource, await loadAtlas(_imagePathOf(fntPath, fntSource)));
  }

  static String _imagePathOf(String fntPath, String source) {
    final m = RegExp(r'page id=\d+ file="([^"]+)"').firstMatch(source);
    final file = m?.group(1) ?? 'big.png';
    final lastSlash = fntPath.lastIndexOf('/');
    if (lastSlash == -1) return file;
    return '${fntPath.substring(0, lastSlash)}/$file';
  }

  static BmFont parse(String source, ui.Image atlas) {
    var lineHeight = 12;
    var charSpace = 1.0;
    final chars = <int, BmChar>{};
    for (final line in source.split('\n')) {
      final trimmed = line.trim();
      if (trimmed.startsWith('common ')) {
        final h = RegExp(r'lineHeight=(\d+)').firstMatch(trimmed);
        if (h != null) lineHeight = int.parse(h.group(1)!);
      } else if (trimmed.startsWith('char ')) {
        int? v(String k) {
          final m = RegExp('$k=(-?\\d+)').firstMatch(trimmed);
          return m != null ? int.parse(m.group(1)!) : null;
        }
        final id = v('id');
        if (id != null) {
          chars[id] = BmChar(
            id, v('x') ?? 0, v('y') ?? 0, v('width') ?? 0, v('height') ?? 0,
            v('xoffset') ?? 0, v('yoffset') ?? 0, v('xadvance') ?? 0,
          );
        }
      }
    }
    return BmFont._(atlas, chars, lineHeight, charSpace);
  }

  int getWidth(String s) {
    var w = 0.0;
    for (var i = 0; i < s.length; i++) {
      final code = s.codeUnitAt(i);
      final c = chars[code] ?? chars[32];
      if (c != null) w += c.xAdv + charSpace;
    }
    return w.round();
  }

  /// SysTemFont.drawString with bitwise anchors and optional tint index.
  void drawString(
    ui.Canvas canvas,
    String s,
    double x,
    double y,
    int anchor, {
    int colorIndex = -1,
  }) {
    var cx = x;
    var cy = y;
    final totalW = getWidth(s).toDouble();

    // Horizontal alignment
    if ((anchor & GraphicsAnchor.hCenter) != 0) {
      cx -= totalW / 2;
    } else if ((anchor & GraphicsAnchor.right) != 0) {
      cx -= totalW;
    }

    // Vertical alignment
    if ((anchor & GraphicsAnchor.vCenter) != 0) {
      cy -= lineHeight / 2;
    } else if ((anchor & GraphicsAnchor.bottom) != 0) {
      cy -= lineHeight;
    }

    final paint = ui.Paint()..filterQuality = ui.FilterQuality.none;
    if (colorIndex >= 0 && colorIndex < palette.length) {
      paint.colorFilter = ui.ColorFilter.mode(palette[colorIndex], ui.BlendMode.modulate);
    }

    for (var i = 0; i < s.length; i++) {
      final code = s.codeUnitAt(i);
      final c = chars[code] ?? chars[32];
      if (c != null && c.w > 0 && c.h > 0) {
        canvas.drawImageRect(
          atlas,
          ui.Rect.fromLTWH(c.x.toDouble(), c.y.toDouble(), c.w.toDouble(), c.h.toDouble()),
          ui.Rect.fromLTWH(cx + c.xOff, cy + c.yOff, c.w.toDouble(), c.h.toDouble()),
          paint,
        );
        cx += c.xAdv + charSpace;
      } else if (c != null) {
        cx += c.xAdv + charSpace;
      }
    }
  }

  /// Port of mFont.splitFontVector / SysTemFont.splitFontVector.
  /// Splits text into multiple lines based on maximum width.
  List<String> splitFontVector(String src, int lineWidth) {
    final lines = <String>[];
    final words = src.split(' ');
    var currentLine = '';

    for (final word in words) {
      final testLine = currentLine.isEmpty ? word : '$currentLine $word';
      if (getWidth(testLine) <= lineWidth) {
        currentLine = testLine;
      } else {
        if (currentLine.isNotEmpty) lines.add(currentLine);
        currentLine = word;
      }
    }
    if (currentLine.isNotEmpty) lines.add(currentLine);
    return lines;
  }
}
