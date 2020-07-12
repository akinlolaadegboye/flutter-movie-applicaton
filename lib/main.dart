import 'package:flutter/material.dart';
import 'package:movieapp/constant.dart';
import 'package:movieapp/pages/main_page.dart';
import 'package:movieapp/pages/movie_detail.dart';
import 'package:movieapp/view_models/movie_list_view_model.dart';
import 'package:provider/provider.dart';


void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      title: Constant.movies,
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewModel(), 
        child: MoviePage(),
      )
    );
  }

}