import 'dart:math';
import 'package:flutter/material.dart';

class VisaCard extends StatelessWidget {
  VisaCard({required this.color,required this.cardNumber,required this.value,required this.cardExpir});
  final Color color;
  final String cardNumber;
  final String cardExpir;
  final String value;

List icon = [
  'images/master.png',
  'images/visa.png',
];

randomicon() {
  return icon [Random().nextInt(2)];
}
  List<Widget> newcard = [];

  @override
  Widget build(BuildContext context) {
    return Dismissible(
              key:UniqueKey(),
              direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete,color: Colors.white,),
            ),
              child:Card(
                  color: color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 20,top: 10,left: 20,right: 20),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(randomicon(),height: 80,width: 80),
                      Text(
                        '$cardExpir',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$value',
                    style: TextStyle(
                      fontSize: 20,
                      color:Colors.white,
                    ),
                  ),
                  Text(
                    '$cardNumber',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
      ),
          );
  }
}