class CommonUtils {
  static String emptyString() => '';

  static bool isToday(int milliseconds) {
    // Create a DateTime object from the milliseconds.
    final dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

    // Get the current date at midnight (00:00:00).
    final now = DateTime.now();
    final midnightToday = DateTime(now.year, now.month, now.day);

    // Compare the day, month, and year of both DateTime objects.
    return dateTime.day == midnightToday.day &&
        dateTime.month == midnightToday.month &&
        dateTime.year == midnightToday.year;
  }
}
