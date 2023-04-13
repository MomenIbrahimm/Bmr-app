import 'package:bmi/components.dart';
import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white38,
              width: double.infinity,
              child: Table(
                border: TableBorder.all(),
                children: [
                  buildRow(['Typ','Quantity','Calories',],color: Colors.black,size: 22.0),
                  buildRow(['apple','1','59',]),
                  buildRow(['banana','1','151',]),
                  buildRow(['strawberry','1','151',]),
                  buildRow(['grapes','cup','100']),
                  buildRow(['Broccoli','cup','45',]),
                  buildRow(['carrot','cup','50',]),
                  buildRow(['tomato','cup','22',]),
                  buildRow(['meat','2 pieces','142',]),
                  buildRow(['chicken','2 pieces','136',]),
                  buildRow(['egg','1','78',]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


