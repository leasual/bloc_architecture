import 'package:bloc_architecture/model/gank_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentWidget extends StatelessWidget {
  final GankModel model;

  const CommentWidget({
    this.model,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            SvgPicture.asset("assets/images/heart-outline.svg"),
            Text(
              "${model.likeCounts}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            SvgPicture.asset("assets/images/eye-outline.svg"),
            Text(
              "${model.views}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}