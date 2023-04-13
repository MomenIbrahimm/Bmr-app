import 'package:bmi/bmi_screen.dart';
import 'package:bmi/components.dart';
import 'package:bmi/information.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final bool isMale;

  final double high;

  final double weight;

  final int age;

  final double result;

  const BmiResultScreen(
      {super.key,
      required this.isMale,
      required this.high,
      required this.weight,
      required this.result,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const BmiScreen()));
          },
          child: const Text(
            'Back',
            style: TextStyle(fontSize: 20.5),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultText(
                  text: 'Gender: ${isMale? 'Male':'Female'}',
                  size: 27.5,
                  fontWeight: FontWeight.w400),
              const SizedBox(
                height: 10.0,
              ),
              defaultText(
                  text: 'Weight: ${weight.round()} km',
                  size: 27.5,
                  fontWeight: FontWeight.w400),
              const SizedBox(
                height: 10.0,
              ),
              defaultText(
                  text: 'Height: ${high.round()} cm',
                  size: 27.5,
                  fontWeight: FontWeight.w400),
              const SizedBox(
                height: 10.0,
              ),
              defaultText(
                  text: 'Age: $age years old',
                  size: 27.5,
                  fontWeight: FontWeight.w400),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: defaultText(
                      text: 'You need ${result.round()} calories every day!',
                      size: 27.5,
                      fontWeight: FontWeight.bold,color: Colors.white),
                ),
                
              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const InformationScreen()));
              }, child:  const Text('Press to read information of interest to your health',style: TextStyle(color: Colors.white,fontSize: 30.0),))
            ],
          ),
        ),
      ),
    );
  }
}
