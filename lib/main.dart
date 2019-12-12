import 'package:flutter/material.dart';
import 'dart:math';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Guess Game Joshua Carpentier'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;
  String output = "";
  Guess fish2 = new Guess();
  void _incrementCounter() {
    setState(() {
      print("number = " + number.toString());
      output = fish2.guessCheck(number);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(output,
              style: TextStyle(color: Colors.deepOrange),),
            SizedBox(height: 8.0,),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter a number 1-100"),
              keyboardType: TextInputType.number,
              onChanged: (text){
                number = int.parse(text);
              },
            ),
            SizedBox(height: 8.0,),
            Container(
              child: FlatButton(onPressed: _incrementCounter,
                child: Text("Guess the secret number"),
              ),
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
              ),
            ),

            SizedBox(height: 8.0,),
            Container(
              child: FlatButton(onPressed: _incrementCounter,
                child: Text("Reset"),
              ),
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Guess{
  int number = 0, count = 0;
  int secret = Random().nextInt(101) + 1;
  String output="";
  Guess({this.number});

  String guessCheck(number){
    print("secret= " + secret.toString());
    count++;
    if(number > secret) output = "Too high, Try Again";
    else if(number < secret) output = "Too low, try again";
    else if(number == secret){
      output = "Congratulations, it took " + count.toString() + " attempts.";
    }
    return output;
  }

  void reset(){
    Guess();
  }
}