import 'package:flutter/material.dart';
import 'package:movieapp/constant.dart';
import 'package:movieapp/view_models/movie_view_model.dart';
import 'package:movieapp/widgets/general/card_widget.dart';
import 'package:movieapp/widgets/general/item_stack.dart';

import '../../../pages/movie_detail.dart';

class MovieGridview extends StatelessWidget {
  final List<MovieViewModel> movies;
  MovieGridview({this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: this.movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final movie = this.movies[index];
        return  GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieDetails(movie.title,movie.poster)),
            );
          },
          child: CardWidget(movie),
        );
      },
    );
  }
}

