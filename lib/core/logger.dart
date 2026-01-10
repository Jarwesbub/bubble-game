import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger(
  level: kReleaseMode ? Level.warning : Level.debug,
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 5,
    lineLength: 100,
    colors: true,
    printEmojis: false,
  ),
);
