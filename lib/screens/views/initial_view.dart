import 'package:basecodev2/configurations/typography.dart';
import 'package:flutter/material.dart';

class InitialView extends StatelessWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("images/logo.png"),
        Text(
          "Meansoft Base Code",
          style: CustomTypography.BODY_STLE.copyWith(color: Colors.white),
        )
      ],
    ));
  }
}
