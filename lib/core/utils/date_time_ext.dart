import 'package:intl/intl.dart';

extension DateTimeUtil on DateTime {
  String get chatDateTime {
    if (this == DateTime.now() || (DateTime.now().minute - minute) == 0) {
      return 'Baru Saja';
    }

    if ((DateTime.now().minute - minute) < 60) {
      return '${(DateTime.now().minute - minute)} menit yang lalu';
    }

    final dateFormat = DateFormat('dd MMM yyyy, HH:mm');
    return dateFormat.format(this);
  }
}
