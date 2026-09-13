/// Summary of a server area (Khu vực).
/// Parity with SessionHandler.java: loadRoomInfo (cmd 6).
class AreaSummary {
  const AreaSummary({
    required this.id,
    required this.status,
    required this.type,
  });

  final int id;
  final int status;
  final int type;

  @override
  String toString() => 'AreaSummary(id: $id, status: $status, type: $type)';
}
