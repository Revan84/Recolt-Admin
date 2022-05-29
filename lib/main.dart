import 'package:flutter/material.dart';
import 'home.dart';
import 'country/services/get_post.dart';
import 'store/services/get_post.dart';
import 'customisation/palette.dart'; 

void main() {
  runApp(const Strapi());
}

class Strapi extends StatelessWidget {
  const Strapi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recolt Admin',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomeScreen(),
       routes: <String, WidgetBuilder>{
      '/GetCountry': (BuildContext context) => const GetCountry(),
      '/GetStore': (BuildContext context) => const GetStore(),
    },
    );
  }
}
