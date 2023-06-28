import 'dart:async';
import 'package:bmicalculator/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image:
                  AssetImage("images/pngtree-android-vector-icon-png.jpeg"))),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  double bmi=0;
  double _currentSliderValue=120;
  double Weight=0;
  double Age=0;

  void calculate(){
    print('success');
    double w=double.parse(Weight.toString());
    print(w);
    double h1=double.parse(_currentSliderValue.toString())/100;
    print(h1);
    double heightSquare=h1*h1;
     bmi=w/heightSquare;
    print(bmi);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Center(
            child: Text(
          "BMI CALCULATOR",
        )),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        color: Colors.white,
                        size: 80,
                      ),
                      Text(
                        "MALE",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                      )
                    ],
                  ),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.female,
                      color: Colors.white,
                      size: 80,
                    ),
                    Text(
                      "FEMALE",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                    )
                  ],
                ),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text( "$_currentSliderValue",style: TextStyle(fontSize: 35,color: Colors.white),),
                  Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 200,
                      divisions: 100,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      })
                ],
              ),
              width: 345,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(50)
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(Weight.toString(),style: TextStyle(fontSize: 35,color: Colors.white),),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    Weight--;

                                  });
                                }, child: const Icon(Icons.remove)),
                          ),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  Weight++;

                                });
                              }, child: const Icon(Icons.add)),
                        ],
                      )
                    ],
                  ),
                  width: 150,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AGE",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(Age.toString(),style: TextStyle(fontSize: 35,color: Colors.white),),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  Age--;
                                });
                              }, child: const Icon(Icons.remove)),
                        ),
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                Age++;
                              });
                            }, child: const Icon(Icons.add)),
                      ],
                    )
                  ],
                ),
                width: 150,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child:
                    ElevatedButton(onPressed: () { calculate();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(  results: bmi,)) );
                    }, child: Text("CALCULATE"))),
          ),
        ],
      ),
    );
  }
}
