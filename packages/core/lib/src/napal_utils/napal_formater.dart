import 'package:intl/intl.dart';

class NapalFormater {
  static String shortDate(String? stringDate, {String countryCode = "SN"}) {
    if (stringDate == null || stringDate == '') {
      return '';
    }
    DateTime date = DateTime.tryParse(stringDate) ?? DateTime.now();
    if (countryCode == "SN") {
      Intl.defaultLocale = "fr_FR";
    } else {
      Intl.defaultLocale = "en_US";
    }
    final DateFormat formatter = DateFormat('EEEE, d MMMM y');
    return formatter.format(date);
  }

  static String longDate(String? stringDate, {String countryCode = "SN"}) {
    if (stringDate == null || stringDate == '') {
      return '';
    }
    DateTime date = DateTime.tryParse(stringDate) ?? DateTime.now();
    if (countryCode == "SN") {
      Intl.defaultLocale = "fr_FR";
    } else {
      Intl.defaultLocale = "en_US";
    }
    final DateFormat formatter = DateFormat('EEEE, d MMMM y');
    return formatter.format(date);
  }
}
