import 'package:peliculas/src/models/pelicula_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PeliculasProvider {

  String _apikey   = 'f054f3c61f32df1d119247d1337a03c1';
  String _url      = 'api.themoviedb.org';
  String _languaje = 'es-Es';

  Future <List<Pelicula>> _procesarRrespuesta( Uri url) async {
    final resp= await http.get( url );
    final decodedData =  json.decode(resp.body);
    final peliculas =  new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key'  : _apikey,
      'language' : _languaje
    });

    return await _procesarRrespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key'  : _apikey,
      'language' : _languaje
    });

    return await _procesarRrespuesta(url);
  }
}