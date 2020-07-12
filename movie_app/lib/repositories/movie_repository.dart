import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movie_app/models/movie.dart';

class MovieRepository {
  final Dio dio = Dio();

  String url = 'http://www.omdbapi.com/';

  String apiKey = 'd12b4be8';

  Future<ListMovies> getMovies({String filmeBuscado, int page}) async {
    Response response = await dio.get('$url/?apikey=$apiKey&type=movie&s=$filmeBuscado&page=$page');

    return ListMovies.fromJson(response.data);

  }

  Future<Movie> getMovie({String idfilme}) async {
    Response response = await dio.get('$url/?apikey=$apiKey&type=movie&i=$idfilme');

    return Movie.fromJsonFull(response.data);

  }



  
}