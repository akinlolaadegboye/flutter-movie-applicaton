import 'package:http/http.dart' as http;
import 'package:movieapp/constant.dart';
import 'package:movieapp/models/movie.dart';
import 'dart:convert';

class Webservice {

  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = Constant.baseUrl+keyword+Constant.apiKey;
    final response = await http.get(url);
    if(response.statusCode == 200) {
       final body = jsonDecode(response.body); 
       final Iterable json = body["Search"];
       return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception(Constant.exceptionError);
    }
  }
}