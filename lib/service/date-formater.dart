import 'package:date_format/date_format.dart';

String dateFormater(DateTime time) =>
    formatDate(time, ["DD", ", ", "dd", " ", "MM", " ", "yyyy"]);

String dateFormater_2(DateTime time) =>
    formatDate(time, ["D", ", ", "dd", "/", "M", "/", "yyyy"]);

String timestampFormater(String time) => formatDate(
      DateTime.parse(time),
      ["yyyy", "-", "mm", "-", "dd", " ", "HH", ":", "nn", ":", "ss"],
    );

String dateId() =>
    formatDate(DateTime.now(), ["yy", "mm", "dd", ".", "HH", "nn", "ss"]);
