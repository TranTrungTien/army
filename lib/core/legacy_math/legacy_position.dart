class LegacyPosition {
  const LegacyPosition.xy(this.x, this.y) : xFrom = 0, yFrom = 0, xTo = 0, yTo = 0, frame = 0;
  const LegacyPosition.xyFrame(this.x, this.y, this.frame) : xFrom = 0, yFrom = 0, xTo = 0, yTo = 0;
  const LegacyPosition.transition(this.xFrom, this.yFrom, this.xTo, this.yTo) : x = 0, y = 0, frame = 0;
  final int x, y, xFrom, yFrom, xTo, yTo, frame;
}
