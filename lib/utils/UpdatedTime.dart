class UpdatedTime {

  static const NOW = "now";
  static const N_MINUTES = "min ago";
  static const N_HOURS = "h ago";
  static const N_DAYS = "d ago";
  static const N_WEEKS = "w ago";

  static String name(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);

    if (diff.compareTo(Duration(minutes: 1)) < 0) return NOW;
    return minutes(diff.inMinutes);
  }

  static String minutes(int n) => "$n$N_MINUTES";
  static String hours(int n) => "$n$N_HOURS";
  static String days(int n) => "$n$N_DAYS";
  static String weeks(int n) => "$n$N_WEEKS";

}