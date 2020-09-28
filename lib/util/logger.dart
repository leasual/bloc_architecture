import 'dart:developer' as developer;


class Logger {

  bool isDebug = false;

  void d(String tag, String message) {
    if(!isDebug) {
      return;
    }
    developer.log( message, name: tag, level: 30);
  }

  void e(String tag, String message) {
    developer.log( message, name: tag, level: 50);
  }

  void w(String tag, String message) {
    if(!isDebug) {
      return;
    }
    developer.log( message, name: tag, level: 40);
  }

  void i(String tag, String message) {
    if(!isDebug) {
      return;
    }
    developer.log( message, name: tag, level: 20);
  }

  void v(String tag, String message) {
    if(!isDebug) {
      return;
    }
    developer.log( message, name: tag, level: 10);
  }

}
