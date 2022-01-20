import 'package:fluro/fluro.dart';
import 'package:schedule/pages/courses.dart';
import 'package:schedule/pages/settings.dart';

class AppRouter {
  static final Map<String, HandlerFunc> _routes = {
    '/': (context, params) => const CoursePage(),
    '/settings': (context, params) => const SettingPage(),
  };

  static FluroRouter _init() {
    final _ret = FluroRouter();
    for (var kv in _routes.entries) {
      _ret.define(kv.key, handler: Handler(handlerFunc: kv.value));
    }
    return _ret;
  }

  static final _router = _init();

  static FluroRouter get instance => _router;
}
