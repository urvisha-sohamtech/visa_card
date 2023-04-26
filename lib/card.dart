import 'dart:math';
import 'package:flutter/material.dart';
import 'package:visa_card/visaCard.dart';

class CardScreen extends StatefulWidget {
  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  ScrollController scrollController = ScrollController();
  List<Widget> newcard = [];
  List<Color> colors = [
    Colors.black54,
    Colors.teal.shade200,
    Colors.red.shade200,
    Colors.lightGreen.shade300,
    Colors.purple.shade200,
  ];
  List value = ['\$1.0', '\$2.0', '\$3.0', '\$4.0', '\$5.0', '\$6.0'];
  List number = [
    '* * * *     * * * *     * * * *     7 5 1 2',
    '* * * *     * * * *     * * * *     6 7 9 3',
    '* * * *     * * * *     * * * *     2 8 7 5',
  ];
  List date = [
    '01/99','02/99','03/99','04/99','05/99','06/99','07/99','08/99','09/99','10/99','11/99','12/99',
  ];
  randomdate(){
    return date[Random().nextInt(12)];
  }
  randomnumber() {
    return number[Random().nextInt(3)];
  }

  randomvalue() {
    return value[Random().nextInt(6)];
  }

  Color randomcolor() {
    return colors[Random().nextInt(5)];
  }

  void AddCard() {
    setState(() {
      print('card');
      newcard.add(
        VisaCard(
          color: randomcolor(),
          cardNumber: randomnumber(),
          value: randomvalue(),
          cardExpir: randomdate(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Super Card',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: newcard.toList(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    AddCard();
                    scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(milliseconds:100 ), curve: Curves.easeOut);
                  },
                  child: Text(
                    '+ Add Card',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.blueGrey),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(left: 120, right: 120, top: 10, bottom: 10),
                    ),

                  ),
                ),
              ),
            ],
          ),

      ),
    );
  }
}