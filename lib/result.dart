import 'package:bmicalculator/main.dart';
import 'package:flutter/material.dart';
class Result extends StatefulWidget {
  final double results;
  final String status="";

  Result({required this.results});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {



  //const Result( {Key? key, required result}) : super(key: key);
  String getText() {
    if (widget.results>= 25) {
      return 'OVERWEIGHT';
    } else if (widget.results > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Center(child: Text("BMI CALCULATOR")),
         leading: IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
         }, icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Text("Your Result",style: TextStyle(fontSize: 30,color: Colors.white),),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 500,
              color: Colors.black87,
              child:Column(
                children: [
                  Text(widget.results.toString(),style: TextStyle(fontSize: 30,color: Colors.white),),
                  Text(getText(),style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
                },style: ElevatedButton.styleFrom(primary: Colors.deepPurple), child: Text("RE-CALCULATE"))),
          ],
        ),
      ),

    );
  }
}
