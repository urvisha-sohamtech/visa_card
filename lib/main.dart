import 'package:flutter/material.dart';
import 'package:visa_card/card.dart';

void main() {
  runApp( Myapp());
}

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardScreen(),
    ); 
  }
}
