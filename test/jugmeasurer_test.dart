import 'package:bucketapp/model/jugmeasurer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Jug Measurer', () {
    test('Measure success 3, 5, 4', () {
      final result = JugMeasurer(x: 3, y: 5, z: 4);
      expect(result.bestSolution.length, 6);
    });

    test('Measure success 2, 10, 4', () {
      final result = JugMeasurer(x: 2, y: 10, z: 4);
      expect(result.bestSolution.length, 4);
    });

    test('Measure success 2, 100, 96', () {
      final result = JugMeasurer(x: 2, y: 100, z: 96);
      expect(result.bestSolution.length, 4);
    });

    test('Measure fail 2, 6, 5', () {
      final result = JugMeasurer(x: 2, y: 6, z: 5);
      expect(result.bestSolution.length, 0);
    });

    test('Measure fail 2, 6, 8', () {
      final result = JugMeasurer(x: 2, y: 6, z: 8);
      expect(result.bestSolution.length, 0);
    });

    test('Measure fail 0, 2, 0', () {
      final result = JugMeasurer(x: 0, y: 2, z: 0);
      expect(result.bestSolution.length, 0);
    });
  });
}
