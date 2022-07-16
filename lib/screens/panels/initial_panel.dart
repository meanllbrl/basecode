import 'package:basecodev2/screens/views/initial_view.dart';
import 'package:flutter/material.dart';
class InitialPanel extends StatelessWidget {
    static String id = "initial";
   const InitialPanel({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return InitialView();
}
}