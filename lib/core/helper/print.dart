import 'package:logger/logger.dart';

abstract class Print {
  Print._();

  static final Logger logger = Logger();

  static debug(String message) => logger.d(message);

  static error(String message) => logger.e(message);

  static warning(String message) => logger.w(message);

  static info(String message) => logger.i(message);
}

