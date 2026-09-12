import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';

/// Embedded subset of the server `equip` table (army.sql) for the offline
/// vertical slice. Each equip row carries 6 frame entries, matching the
/// client's 6 animation frames per equipment.
class SandboxEquipmentData {
  const SandboxEquipmentData._();

  static EquipmentDefinition _row({
    required int id,
    required EquipmentSlot slot,
    required int glassId,
    int bulletId = -1,
    required List<int> x,
    required List<int> y,
    required List<int> w,
    required List<int> h,
    required List<int> dx,
    required List<int> dy,
  }) {
    assert(
      x.length == y.length && y.length == w.length && w.length == h.length,
    );
    final frames = <EquipmentFrameGeometry>[
      for (var i = 0; i < x.length; i++)
        EquipmentFrameGeometry(
          sourceX: x[i],
          sourceY: y[i],
          width: w[i],
          height: h[i],
          offsetX: dx[i],
          offsetY: dy[i],
        ),
    ];
    return EquipmentDefinition(
      id: id,
      slot: slot,
      glassId: glassId,
      atlasId: 'placeholder',
      frames: frames,
      bulletId: bulletId,
    );
  }

  /// glassId 0 (Gunner) starter set: nón/áo/súng/kính cannon 1.
  static List<EquipmentDefinition> gunnerSet() => [
    _row(
      id: 3,
      slot: EquipmentSlot.hat,
      glassId: 0,
      x: [53, 53, 68, 55, 53, 53],
      y: [40, 40, 0, 0, 40, 40],
      w: [14, 14, 13, 13, 14, 14],
      h: [11, 11, 13, 14, 11, 11],
      dx: [-14, -13, -7, -7, -13, -13],
      dy: [-38, -38, -36, -36, -39, -38],
    ),
    _row(
      id: 4,
      slot: EquipmentSlot.armor,
      glassId: 0,
      x: [75, 80, 42, 81, 91, 29],
      y: [57, 28, 39, 13, 41, 14],
      w: [11, 11, 11, 13, 11, 11],
      h: [8, 10, 12, 15, 10, 9],
      dx: [-13, -12, -12, -12, -12, -12],
      dy: [-24, -26, -28, -31, -26, -25],
    ),
    _row(
      id: 5,
      slot: EquipmentSlot.gun,
      glassId: 0,
      bulletId: 1,
      x: [19, 18, 0, 40, 19, 19],
      y: [23, 63, 61, 14, 23, 23],
      w: [20, 25, 19, 13, 20, 20],
      h: [19, 13, 20, 25, 19, 19],
      dx: [-18, -20, -16, -18, -17, -17],
      dy: [-35, -31, -36, -42, -36, -35],
    ),
    _row(
      id: 11,
      slot: EquipmentSlot.glasses,
      glassId: 0,
      x: [0, 0, 13, 13, 0, 0],
      y: [81, 81, 81, 81, 81, 81],
      w: [7, 7, 6, 6, 7, 7],
      h: [5, 5, 6, 6, 5, 5],
      dx: [-14, -13, -7, -8, -13, -13],
      dy: [-30, -30, -33, -34, -31, -30],
    ),
  ];

  /// glassId 1 (Miss 6) starter set: ak series.
  static List<EquipmentDefinition> miss6Set() => [
    _row(
      id: 20,
      slot: EquipmentSlot.hat,
      glassId: 1,
      x: [14, 14, 34, 34, 14, 14],
      y: [23, 23, 43, 43, 23, 23],
      w: [19, 19, 17, 17, 19, 19],
      h: [18, 18, 20, 20, 18, 18],
      dx: [-15, -15, -12, -12, -15, -15],
      dy: [-38, -39, -40, -41, -40, -39],
    ),
    _row(
      id: 21,
      slot: EquipmentSlot.armor,
      glassId: 1,
      x: [120, 81, 81, 22, 81, 109],
      y: [57, 41, 41, 43, 32, 57],
      w: [11, 10, 10, 12, 10, 11],
      h: [9, 10, 10, 11, 9, 9],
      dx: [-13, -12, -11, -12, -12, -13],
      dy: [-25, -25, -25, -27, -25, -25],
    ),
    _row(
      id: 24,
      slot: EquipmentSlot.gun,
      glassId: 1,
      bulletId: 2,
      x: [0, 92, 114, 101, 0, 0],
      y: [62, 23, 0, 0, 62, 62],
      w: [22, 23, 18, 13, 22, 22],
      h: [18, 13, 22, 23, 18, 18],
      dx: [-22, -22, -17, -15, -21, -21],
      dy: [-34, -32, -43, -48, -35, -34],
    ),
  ];
}
