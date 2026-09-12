import 'dart:convert';

class AssetManifestFormatException implements FormatException {
  const AssetManifestFormatException(this.message, [this.source, this.offset]);
  @override
  final String message;
  @override
  final dynamic source;
  @override
  final int? offset;
}

enum GameAssetKind { image, tile, map, font, audio }

class GameAssetEntry {
  const GameAssetEntry({
    required this.id,
    required this.kind,
    required this.path,
    required this.available,
  });
  final String id;
  final GameAssetKind kind;
  final String path;
  final bool available;
}

class AtlasFrame {
  const AtlasFrame({
    required this.name,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });
  final String name;
  final int x, y, width, height;
}

class AtlasDefinition {
  const AtlasDefinition({
    required this.id,
    required this.imagePath,
    required this.width,
    required this.height,
    required this.frames,
  });
  final String id, imagePath;
  final int width, height;
  final List<AtlasFrame> frames;
}

class GameAssetManifest {
  const GameAssetManifest({required this.assets, required this.atlases});
  final Map<String, GameAssetEntry> assets;
  final Map<String, AtlasDefinition> atlases;

  factory GameAssetManifest.fromJsonString(String source) {
    final value = jsonDecode(source);
    if (value is! Map<String, dynamic> || value['schemaVersion'] != 1) {
      throw const AssetManifestFormatException(
        'Unsupported asset manifest schema',
      );
    }
    final assets = <String, GameAssetEntry>{};
    for (final raw in (value['assets'] as List<dynamic>? ?? const [])) {
      final m = raw as Map<String, dynamic>;
      final id = m['id'] as String;
      if (assets.containsKey(id)) {
        throw AssetManifestFormatException('Duplicate asset id: $id');
      }
      assets[id] = GameAssetEntry(
        id: id,
        kind: GameAssetKind.values.byName(m['kind'] as String),
        path: m['path'] as String,
        available: m['available'] as bool? ?? true,
      );
    }
    final atlases = <String, AtlasDefinition>{};
    for (final raw in (value['atlases'] as List<dynamic>? ?? const [])) {
      final m = raw as Map<String, dynamic>;
      final id = m['id'] as String;
      if (atlases.containsKey(id)) {
        throw AssetManifestFormatException('Duplicate atlas id: $id');
      }
      final width = m['width'] as int, height = m['height'] as int;
      final names = <String>{};
      final frames = <AtlasFrame>[];
      for (final frameRaw in m['frames'] as List<dynamic>) {
        final f = frameRaw as Map<String, dynamic>;
        final name = f['name'] as String;
        if (!names.add(name)) {
          throw AssetManifestFormatException('Duplicate frame: $id/$name');
        }
        final frame = AtlasFrame(
          name: name,
          x: f['x'] as int,
          y: f['y'] as int,
          width: f['width'] as int,
          height: f['height'] as int,
        );
        if (frame.x < 0 ||
            frame.y < 0 ||
            frame.width <= 0 ||
            frame.height <= 0 ||
            frame.x + frame.width > width ||
            frame.y + frame.height > height) {
          throw AssetManifestFormatException(
            'Atlas frame out of bounds: $id/$name',
          );
        }
        frames.add(frame);
      }
      atlases[id] = AtlasDefinition(
        id: id,
        imagePath: m['imagePath'] as String,
        width: width,
        height: height,
        frames: List.unmodifiable(frames),
      );
    }
    return GameAssetManifest(
      assets: Map.unmodifiable(assets),
      atlases: Map.unmodifiable(atlases),
    );
  }
}
