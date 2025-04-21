import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTimeFormatPattern = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime? {
  String format({
    String pattern = dateTimeFormatPattern,
    String? locale,
  }) {
    if (this == null) {
      return ''; // Or any default value you prefer
    }

    try {
      if (locale != null && locale.isNotEmpty) {
        initializeDateFormatting(locale);
      }

      // Cache DateFormat instance for better performance
      final dateFormat = DateFormat(pattern, locale);
      return dateFormat.format(this!);
    } catch (e) {
      print('Error formatting date: $e');
      return 'Invalid Date'; // Or any error message you prefer
    }
  }
}
