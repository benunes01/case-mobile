import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_controller.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/movie_details_page.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MovieRepository()),
        Bind((i) => HomeController()),
      ];

  // rotas do módulo
  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => HomePage()),
    Router("/moviedetails", child: (_, args) => MovieDetailsPage())
  ];



  //widget principal
  @override
  Widget get bootstrap => AppWidget();
}
