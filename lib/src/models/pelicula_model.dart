class Peliculas {
  List<Pelicula>items = new List();
  Peliculas();

  Peliculas.fromJsonList( List<dynamic> jsonList ) {
    if(jsonList==null) return;
    for (var item in jsonList){
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add ( pelicula );
    }
  }

}


class Pelicula {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });
  Pelicula.fromJsonMap(Map<String, dynamic> json){
    popularity=json['popularity']/1;
    voteCount=json['vote_count'];
    video=json['video'];
    posterPath=json['poster_path'];
    id=json['id'];
    adult=json['adult'];
    backdropPath=json['backdrop_path'];
    originalLanguage=json['original_languaje'];
    originalTitle=json['original_title'];
    genreIds=json['genre_ids'].cast<int>();
    title=json['title'];
    voteAverage=json['vote_average']/1;
    overview=json['overview'];
    releaseDate=json['release_date'];
  }


  getPosterImg() {
    if(posterPath == null){
      return 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.evisionstore.com%2Findex.php%3Fcategoria%3Darticle%26modelo%3D5274&psig=AOvVaw1zD9ziD9CGYAVM_sl1YfSM&ust=1604426289196000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJjWtOu35OwCFQAAAAAdAAAAABAJ';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

}
