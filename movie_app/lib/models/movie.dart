class Movie {
  final String title;
  final int year;
  final String imdbID;
  final String posterUrl;

  String released;
  String genre;
  String plot;
  String imdbRating;
  String production;
  String runtime;
  String director;
  String actors;

  Movie(
      {this.title,
      this.year,
      this.imdbID,
      this.posterUrl,
      this.released,
      this.genre,
      this.plot,
      this.imdbRating,
      this.production,
      this.runtime,
      this.director,
      this.actors});

  factory Movie.fromJson(Map<String, dynamic> doc) {
    return Movie(
      title: doc['Title'],
      year: doc[int.parse(doc['Year'])],
      imdbID: doc['imdbID'],
      posterUrl: doc['Poster'],
    );
  }

  factory Movie.fromJsonFull(Map<String, dynamic> doc) {
    return Movie(
      title: doc['Title'],
      year: int.parse(doc['Year']),
      imdbID: doc['imdbID'],
      posterUrl: doc['Poster'],
      released: doc['Released'],
      genre: doc['Genre'],
      plot: doc['Plot'],
      imdbRating: doc['imdbRating'],
      production: doc['Production'],
      runtime: doc['Runtime'],
      director: doc['Director'],
      actors: doc['Actors'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['posterUrl'] = this.posterUrl;
    data['released'] = this.released;
    data['genre'] = this.genre;
    data['plot'] = this.plot;
    data['imdbRating'] = this.imdbRating;
    data['Production'] = this.production;
    data['Runtime'] = this.runtime;
    data['Director'] = this.director;
    data['Actors'] = this.actors;

    return data;
  }
}

class ListMovies {
  List<Movie> movies;

  ListMovies({this.movies});

  ListMovies.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      movies = new List<Movie>();
      json['Search'].forEach((v) {
        movies.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['Search'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
