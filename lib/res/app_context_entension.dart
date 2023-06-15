import 'package:flutter/material.dart';
import 'package:flutter_base_setup/res/resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}