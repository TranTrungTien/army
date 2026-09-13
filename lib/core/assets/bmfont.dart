import 'dart:ui' as ui;

/// Port cua CLib/SysTemFont: font BitmapFont chuan AngelCode (.fnt TEXT).
/// Bản gốc load: res/FontSys/x{zoom}/{big|mini}.fnt + .png
/// (LibSysTem.font = "FontSys/x", SysTemFont chọn big/mini theo ID).
///
/// Chi can parser duoc BMFont text format la render duoc dung giao dien,
/// dung bang mau colorJava[] trong mFont.java (id + 1).
class BmChar {
  BmChar(this.id, this.x, this.y, this.w, this.h, this.xOff, this.yOff, this.xAdv);
  final int id, x, y, w, h, xOff, yOff, xAdv;
}

class BmFont {
  BmFont._(this.atlas, this.chars, this.lineHeight, this.charSpace);
  final ui.Image atlas;
  final Map<int, BmChar> chars;
  final int lineHeight;
  final double charSpace; // tuong duong charSpace trong SysTemFont

  /// Parse .fnt dang TEXT (AngelCode BMFont). Ho tro common + char blocks.
  static Future<BmFont> load(
    String fntPath,
    Future<ui.Image> Function(String imagePath) loadAtlas,
  ) async {
    final fntSource = await _readAssetString(fntPath);
    return parse(fntSource, await loadAtlas(_imagePathOf(fntPath, fntSource)));
  }

  static Future<String> _readAssetString(String path) async =>
      throw UnimplementedError('inject AssetBundle: rootBundle.loadString(path)');

  static String _imagePathOf(String fntPath, String source) {
    final m = RegExp(r'^page id=\d+ file="([^"]+)"', multiLine: true).firstMatch(source);
    final file = m?.group(1) ?? 'big.png';
    final dir = fntPath.substring(0, fntPath.lastIndexOf('/'));
    return '$dir/$file';
  }

  static BmFont parse(String source, ui.Image atlas) {
    var lineHeight = 12;
    var charSpace = 2.0;
    final chars = <int, BmChar>{};
    for (final line in source.split('\n')) {
      if (line.startsWith('common ')) {
        final h = RegExp(r'lineHeight=(\d+)').firstMatch(line);
        if (h != null) lineHeight = int.parse(h.group(1)!);
      } else if (line.startsWith('char ')) {
        int v(String k) => int.parse(RegExp('$k=(-?\\d+)').firstMatch(line)!.group(1)!);
        final c = BmChar(v('id'), v('x'), v('y'), v('width'), v('height'),
            v('xoffset'), v('yoffset'), v('xadvance'));
        chars[c.id] = c;
      }
    }
    return BmFont._(atlas, chars, lineHeight, charSpace);
  }

  /// SysTemFont.getWidth: cong xadvance tung ky tu + charSpace.
  int getWidth(String s) {
    var w = 0.0;
    for (final ch in s.codeUnits) {
      w += (chars[ch]?.xAdv ?? chars[32]?.xAdv ?? 4) + charSpace;
    }
    return w.round();
  }

  /// SysTemFont.drawString voi align LEFT(0)/CENTER(2 tuong ung anchor giua).
  void drawString(ui.Canvas canvas, String s, double x, double y, int align) {
    var cx = x;
    if (align == 2) cx -= getWidth(s) / 2;
    if (align == 1) cx -= getWidth(s).toDouble(); // RIGHT
    for (final ch in s.codeUnits) {
      final c = chars[ch];
      if (c != null && c.w > 0 && c.h > 0) {
        canvas.drawImageRect(
          atlas,
          ui.Rect.fromLTWH(c.x.toDouble(), c.y.toDouble(), c.w.toDouble(), c.h.toDouble()),
          ui.Rect.fromLTWH(cx + c.xOff, y + c.yOff, c.w.toDouble(), c.h.toDouble()),
          ui.Paint(),
        );
        cx += c.xAdv + charSpace;
      } else {
        cx += (chars[32]?.xAdv ?? 4) + charSpace;
      }
    }
  }
}