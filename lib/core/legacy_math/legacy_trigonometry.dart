import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';

abstract final class LegacyTrigonometry {
  static int _fixOnce(int angle) {
    var result = angle;
    if (result >= 360) result -= 360;
    if (result < 0) result += 360;
    return result;
  }

  static const List<int> _sinTable = <int>[0, 18, 36, 54, 71, 89, 107, 125, 143, 160, 178, 195, 213, 230, 248, 265, 282, 299, 316, 333, 350, 367, 384, 400, 416, 433, 449, 465, 481, 496, 512, 527, 543, 558, 573, 587, 602, 616, 630, 644, 658, 672, 685, 698, 711, 724, 737, 749, 761, 773, 784, 796, 807, 818, 828, 839, 849, 859, 868, 878, 887, 896, 904, 912, 920, 928, 935, 943, 949, 956, 962, 968, 974, 979, 984, 989, 994, 998, 1002, 1005, 1008, 1011, 1014, 1016, 1018, 1020, 1022, 1023, 1023, 1024, 1024];
  static final List<int> _cosTable = List<int>.generate(91, (i) => _sinTable[90 - i], growable: false);
  static final List<int> _tanTable = List<int>.generate(91, (i) {
    final cosine = _cosTable[i];
    return cosine == 0 ? JavaInt32.maxValue : JavaInt32.divide(JavaInt32.shiftLeft(_sinTable[i], 10), cosine);
  }, growable: false);

  static int sin(int angle) {
    final a = _fixOnce(angle);
    if (a >= 0 && a < 90) return _sinTable[a];
    if (a >= 90 && a < 180) return _sinTable[180 - a];
    if (a >= 180 && a < 270) return -_sinTable[a - 180];
    return -_sinTable[360 - a];
  }

  static int cos(int angle) {
    final a = _fixOnce(angle);
    if (a >= 0 && a < 90) return _cosTable[a];
    if (a >= 90 && a < 180) return -_cosTable[180 - a];
    if (a >= 180 && a < 270) return -_cosTable[a - 180];
    return _cosTable[360 - a];
  }

  static int tan(int angle) {
    final a = _fixOnce(angle);
    if (a >= 0 && a < 90) return _tanTable[a];
    if (a >= 90 && a < 180) return -_tanTable[180 - a];
    if (a >= 180 && a < 270) return _tanTable[a - 180];
    return -_tanTable[360 - a];
  }

  static int atan(int tangent) {
    for (var i = 0; i <= 90; i++) { if (_tanTable[i] >= tangent) return i; }
    return 0;
  }
}
