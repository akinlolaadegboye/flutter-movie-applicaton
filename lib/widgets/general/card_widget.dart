import 'package:flutter/material.dart';

import '../../constant.dart';
import 'item_stack.dart';
class CardWidget extends StatelessWidget {
  final movie;
  CardWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return    Card(
          elevation: Constant.cardElevation,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.white70, width: Constant.borderSideWidth),
            borderRadius: BorderRadius.circular(Constant.borderRadius),
          ),
          child: Container(
            height: Constant.cardHeight,
            child: ItemStack(movie),
          ));
    }

}
