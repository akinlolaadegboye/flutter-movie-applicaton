import 'package:flutter/material.dart';
import 'package:movieapp/constant.dart';
import 'package:movieapp/view_models/movie_list_view_model.dart';
import 'package:movieapp/widgets/main_page_widgets/card/movie_card.dart';
import 'package:movieapp/widgets/main_page_widgets/gridview/movie_gridview.dart';
import 'package:movieapp/widgets/main_page_widgets/list/movie_list.dart';
import 'package:provider/provider.dart';

class MovieContent extends StatefulWidget {
  final String layoutName;
  MovieContent(this.layoutName);

  @override
  _MovieContentState createState() => _MovieContentState();
}

class _MovieContentState extends State<MovieContent> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false)
        .fetchMovies("batman");
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);
    return Container(
          padding: EdgeInsets.all(Constant.padding),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: layoutWidget(widget.layoutName, vm),
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(Constant.borderRadius)),
        );
  }

  Widget layoutWidget(String layoutName, final vm) {
    if (layoutName == Constant.cardLowerCase)
      return MovieCard(movies: vm.movies);
    else if (layoutName == Constant.gridLowerCase)
      return MovieGridview(movies: vm.movies);
    else if (layoutName == Constant.listLowerCase)
      return MovieList(movies: vm.movies);
    return null;
  }
}
