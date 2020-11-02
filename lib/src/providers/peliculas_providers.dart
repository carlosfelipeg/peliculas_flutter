import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {

  String _apikey   = 'f054f3c61f32df1d119247d1337a03c1';
  String _url      = 'api.themoviedb.org';
  String _languaje = 'es-Es';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_paying',{
      'api_key'  : _apikey,
      'language' : _languaje
    });
  }
}