enum CharacterFacing { right, left }

enum CharacterAnimationKind { idle, walk, aim, fire, hurt, death }

class CharacterDefinition {
  const CharacterDefinition({
    required this.characterType,
    required this.bodyAtlasId,
    required this.frameCount,
    required this.anchorX,
    required this.anchorY,
  });
  final int characterType;
  final String bodyAtlasId;
  final int frameCount;
  final double anchorX;
  final double anchorY;
}
