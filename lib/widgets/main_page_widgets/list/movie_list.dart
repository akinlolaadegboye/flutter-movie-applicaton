
import 'package:flutter/material.dart';
import 'package:movieapp/constant.dart';
import 'package:movieapp/view_models/movie_view_model.dart';

import '../../../pages/movie_detail.dart';

class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;
  MovieList({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (context, index) {
        final movie = this.movies[index];
        return Card(
            elevation: Constant.cardElevation,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: Constant.borderSideWidth),
              borderRadius: BorderRadius.circular(Constant.borderRadius),
            ),
            child:GestureDetector(
              child:listTileWidget(movie),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieDetails(movie.title,movie.poster)),
                );
              },
            ));
      },
    );
  }

  Widget listTileWidget(movie){
    return  ListTile(
      contentPadding: EdgeInsets.all(Constant.padding),
      leading: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(movie.poster)
            ),
            borderRadius: BorderRadius.circular(Constant.borderRadius)
        ),
        width: Constant.listTileWidth,
        height: Constant.listTileHeight,
      ),
      title: Text(movie.title,style: TextStyle(fontSize: Constant.listTitleFontSize),),
    );
  }
}



