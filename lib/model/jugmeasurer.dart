import 'dart:math';

import 'package:bucketapp/model/jugaction.dart';
import 'package:bucketapp/model/jugstep.dart';

class JubMeasurer {
  int x;
  int y;
  int z;

  bool reverse = false;

  List<JugStep> bestSolution = [];
  List<JugStep> otherSolution = [];

  JubMeasurer({
    required this.x,
    required this.y,
    required this.z,
  }) {
    reverse = x > y;

    if (_isZTooHigh()) return;
    if (!reverse && (z % _gcd(x, y)) != 0) return;
    if (reverse && (z % _gcd(y, x)) != 0) return;

    List<JugStep> xToY = _calculateSteps(x, y, z, false);
    List<JugStep> yToX = _calculateSteps(y, x, z, true);

    if (yToX.length < xToY.length) {
      bestSolution = yToX;
      otherSolution = xToY;
    } else {
      otherSolution = yToX;
      bestSolution = xToY;
    }
  }

  _isZTooHigh() {
    return z > x && z > y;
  }

  _gcd(int a, int b) {
    return (b == 0) ? a : _gcd(b, a % b);
  }

  JugStep _addStep(from, to, JugAction action, bool reverse) {
    return reverse ? JugStep(to, from, action) : JugStep(from, to, action);
  }

  _calculateSteps(int fromCap, int toCap, int target, bool reverse) {
    int from = fromCap;
    int to = 0;

    List<JugStep> steps = [
      _addStep(from, to, JugAction.fill(reverse), reverse)
    ];

    while (from != target && to != target) {
      int temp = min(from, toCap - to);

      to += temp;
      from -= temp;

      steps.add(_addStep(from, to, JugAction.transfer(reverse), reverse));

      if (from == target || to == target) break;

      if (from == 0) {
        from = fromCap;
        steps.add(_addStep(from, to, JugAction.fill(reverse), reverse));
      }

      if (to == toCap) {
        to = 0;
        steps.add(_addStep(from, to, JugAction.empty(reverse), reverse));
      }
    }

    return steps;
  }
}
