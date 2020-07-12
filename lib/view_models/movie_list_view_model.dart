import 'package:flutter/material.dart';
import 'package:movieapp/services/webservice.dart';
import 'movie_view_model.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = List<MovieViewModel>();
  Future<void> fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners(); 
  }

}