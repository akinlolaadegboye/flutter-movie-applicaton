import 'package:flutter/material.dart';
import 'package:movieapp/constant.dart';
import 'package:movieapp/view_models/movie_view_model.dart';
class ItemStack extends StatelessWidget {
  final MovieViewModel movie;
  ItemStack(this.movie);

  static Widget posterImage(String url){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                url,
              ))),
    );
  }
  static Widget titleLayout(String title,double fontSize){
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(Constant.padding),
          width: double.infinity,
          color: Colors.blueAccent.withOpacity(Constant.opacity),
          child: Text(
            title,
            style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        posterImage(movie.poster),
        titleLayout(movie.title, Constant.fontSize)
      ],
    );
  }
}
