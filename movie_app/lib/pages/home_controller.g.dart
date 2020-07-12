// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$currentIndexAtom = Atom(name: '_HomeController.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$textFieldControllerAtom =
      Atom(name: '_HomeController.textFieldController');

  @override
  TextEditingController get textFieldController {
    _$textFieldControllerAtom.reportRead();
    return super.textFieldController;
  }

  @override
  set textFieldController(TextEditingController value) {
    _$textFieldControllerAtom.reportWrite(value, super.textFieldController, () {
      super.textFieldController = value;
    });
  }

  final _$movieAtom = Atom(name: '_HomeController.movie');

  @override
  Movie get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(Movie value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  final _$getMovieAsyncAction = AsyncAction('_HomeController.getMovie');

  @override
  Future getMovie({String idFilme}) {
    return _$getMovieAsyncAction.run(() => super.getMovie(idFilme: idFilme));
  }

  final _$getMoviesAsyncAction = AsyncAction('_HomeController.getMovies');

  @override
  Future getMovies({String nomeFilme = 'Avengers'}) {
    return _$getMoviesAsyncAction
        .run(() => super.getMovies(nomeFilme: nomeFilme));
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic changePage(int index) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
textFieldController: ${textFieldController},
movie: ${movie}
    ''';
  }
}
