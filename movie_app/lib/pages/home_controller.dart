import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/repositories/movie_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {

  final api = Modular.get<MovieRepository>();



  @observable
  int currentIndex = 0;

  @observable
  TextEditingController textFieldController = TextEditingController();

  @observable
  Movie movie;


  @action
  getMovie({String idFilme}) async {
    movie =  await api.getMovie(idfilme: idFilme);
    print(movie);

  }

  ListMovies listMovies;

  List<ListMovies> list;

  @action
  getMovies({String nomeFilme = 'Avengers',}) async {
    listMovies =  await api.getMovies(filmeBuscado: nomeFilme, page: 1);
    print(listMovies);

    // list = [listMovies,  listMovies];

  }

  @action
  changePage(int index) {
    currentIndex = index;
  }

}