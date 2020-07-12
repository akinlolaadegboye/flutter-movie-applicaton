import 'package:flutter/material.dart';
import 'package:movieapp/constant.dart';
import 'package:movieapp/widgets/general/item_stack.dart';

class MovieDetails extends StatelessWidget {
  final title,postalUrl;
  MovieDetails(this.title,this.postalUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: bodyWidget(title,postalUrl),

    );
  }

  Widget appBarWidget(BuildContext context){
    return AppBar(
      title: Text(Constant.movieDetail),
      leading: GestureDetector(
          child:Icon(Icons.arrow_back,
          ),
          onTap:(){
            Navigator.pop(context);
          }
      ),
    );
  }

  Widget bodyWidget(String title,String url){
    return Container(
      padding: EdgeInsets.all(Constant.padding),
      child: Stack(
        children: <Widget>[
          ItemStack.posterImage(url),
          ItemStack.titleLayout(title,Constant.fontSize)
        ],
      ),
    );
  }

}

