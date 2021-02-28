import 'package:test/test.dart';

void main() {

  group('diff in ms to human-readable values', () {

    test('now', () {
      final time = DateTime.now().subtract(Duration(seconds: 1));
      expect(UpdatedTime(time), UpdatedTime.NOW);
    });

  });

}