import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/app/app_module.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
    ),
  );
}
