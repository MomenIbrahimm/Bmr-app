import 'package:bmi/bmi_result.dart';
import 'package:bmi/components.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double high = 100.0;
  double weight = 70.0;
  int age = 16;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60.0,
              ),
              Center(
                  child: defaultText(
                      text: 'GENDER', fontWeight: FontWeight.w500, size: 22.0)),
              Row(
                children: [
                  defaultContainer(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      text: 'Male',
                      color: isMale
                          ? Theme.of(context).primaryColor
                          : Colors.white54,
                      icon: Icons.male,
                      size: 25.0),
                  defaultContainer(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      text: 'Female',
                      color: isMale
                          ? Colors.white54
                          : Theme.of(context).primaryColor,
                      icon: Icons.female,
                      size: 25.0)
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Center(
                  child: Text(
                'Select your gender and enter your data',
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
              const SizedBox(
                height: 25.0,
              ),
              Center(
                  child: defaultText(
                      text: 'Height'.toUpperCase(),
                      fontWeight: FontWeight.w500,
                      size: 22.0)),
              const SizedBox(
                height: 20.0,
              ),
              Slider(
                  value: high,
                  label: 'Your height is ${(high).round()} cm',
                  activeColor: g,
                  inactiveColor: b,
                  min: 0,
                  max: 210,
                  divisions: 210,
                  onChanged: (value) {
                    setState(() {
                      high = value;
                    });
                  }),
              const SizedBox(
                height: 60.0,
              ),
              Center(
                  child: defaultText(
                      size: 22.0,
                      fontWeight: FontWeight.w500,
                      text: 'Weight'.toUpperCase())),
              const SizedBox(
                height: 20.0,
              ),
              Slider(
                  value: weight,
                  label: 'Your weight is ${(weight).round()} kg',
                  activeColor: g,
                  inactiveColor: b,
                  min: 0,
                  max: 210,
                  divisions: 210,
                  onChanged: (value) {
                    setState(() {
                      weight = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: defaultText(
                            size: 22.0,
                            fontWeight: FontWeight.w500,
                            text: 'AGE'),
                      ),
                      Text('$age years old',
                          style: const TextStyle(fontSize: 18.0)),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(Icons.minimize_sharp),
                            )
                          ]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  height: 125.0,
                  child: FloatingActionButton(
                      onPressed: () {
                        double result;
                        if (isMale) {
                          result = (10*weight)+(6.25*high)-(5*age)+5;
                        } else {
                          result = (10*weight)+(6.25*high)-(5*age)-16;
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BmiResultScreen(
                                      result: result,
                                      weight: weight,
                                      age: age,
                                      high: high,
                                      isMale: isMale,
                                    )));

                        //447.593 + (9.247 x weight in kg) + (3.098 x height in cm) – (4.330 x age in years
                        //88.362 + (13.397 x weight in kg) + (4.799 x height in cm) – (5.677 x age in years)
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Calculate',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Icon(
                            Icons.forward_outlined,
                            size: 30.0,
                          ),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
