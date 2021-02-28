import 'package:bots_tdd/utils/UpdatedTime.dart';
import 'package:test/test.dart';

void main() {

  group('diff in ms to human-readable values', () {

    test('now', () {
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(seconds: 1))
      ), UpdatedTime.NOW);
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(seconds: 10))
      ), UpdatedTime.NOW);
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(seconds: 59))
      ), UpdatedTime.NOW);
    });

    test('minutes', () {
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(seconds: 60))
      ), UpdatedTime.minutes(1));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(seconds: 65))
      ), UpdatedTime.minutes(1));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(seconds: 95))
      ), UpdatedTime.minutes(1));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(seconds: 119))
      ), UpdatedTime.minutes(1));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(seconds: 120))
      ), UpdatedTime.minutes(2));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(minutes: 3))
      ), UpdatedTime.minutes(3));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(minutes: 15))
      ), UpdatedTime.minutes(15));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(minutes: 59))
      ), UpdatedTime.minutes(59));
    });

    test('hours', () {
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(minutes: 60))
      ), UpdatedTime.hours(1));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(minutes: 119))
      ), UpdatedTime.hours(1));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(hours: 2))
      ), UpdatedTime.hours(2));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(hours: 12))
      ), UpdatedTime.hours(12));
      expect(UpdatedTime.name(
        DateTime.now().subtract(Duration(hours: 23, minutes: 59))
      ), UpdatedTime.hours(23));
    });

  });

}