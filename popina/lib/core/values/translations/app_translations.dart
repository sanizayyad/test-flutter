import 'en_US/en_US_translation.dart';
import 'ru_RU/ru_RU_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US' : enUs,
    'ru_RU' : ruRU
  };

}