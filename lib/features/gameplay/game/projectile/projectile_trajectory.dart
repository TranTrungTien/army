class TrajectoryFrame {
  const TrajectoryFrame({required this.x, required this.y});

  final int x;
  final int y;
}

class ProjectileTrajectory {
  const ProjectileTrajectory({
    required this.bulletId,
    required this.frames,
    this.explosionRadius = 18,
  });

  final int bulletId;
  final List<TrajectoryFrame> frames;
  final int explosionRadius;
}
