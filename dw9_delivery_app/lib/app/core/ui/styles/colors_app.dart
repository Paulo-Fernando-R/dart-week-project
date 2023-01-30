import 'package:flutter/material.dart';

class ColorApp {
  static ColorApp? _instance;

  ColorApp._();

  static ColorApp get i {
    _instance ??= ColorApp._();
    return _instance!;
  }

  Color get primary => const Color(0xff007D21);
  Color get secondary => const Color(0xffF88B0C);
}

extension CollorsAppExcentions on BuildContext {
  ColorApp get colors => ColorApp.i;
}
