import 'package:flutter/material.dart';
import 'dart:math';

Random rng = new Random();

void main() {
  runApp(MyApp());
}

enum dice { d4, d6, d8, d10, d12, d20 }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyDiceApp(title: 'D&D Dice Roller'),
    );
  }
}

class MyDiceApp extends StatefulWidget {
  MyDiceApp({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyDiceAppState createState() => _MyDiceAppState();
}

class _MyDiceAppState extends State<MyDiceApp> {
  dice _rolledDice = dice.d20;
  dice _selectedDice = dice.d20;
  int? _currentValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
        ),

        backgroundColor: Color(0xff7c0a02),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return buildBodyForPortrait();
    } else {
      return buildBodyForLandscape();
    }
  }

  Widget buildBodyForPortrait() {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildDiceSelector(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xff7c0a02), fixedSize: Size.fromWidth(150.0)),
          onPressed: () {
            setState(() {
              _rolledDice = _selectedDice;

              switch (_rolledDice) {
                case dice.d4:
                  _currentValue = rng.nextInt(4) + 1;
                  break;
                case dice.d6:
                  _currentValue = rng.nextInt(6) + 1;
                  break;
                case dice.d8:
                  _currentValue = rng.nextInt(8) + 1;
                  break;
                case dice.d10:
                  _currentValue = rng.nextInt(10) + 1;
                  break;
                case dice.d12:
                  _currentValue = rng.nextInt(12) + 1;
                  break;
                case dice.d20:
                  _currentValue = rng.nextInt(20) + 1;
                  break;
              }
            });
          },
          child: const Text('Roll!'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildRollText(),
      )
    ]));
  }

  Widget buildBodyForLandscape() {
    return Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildDiceSelector(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xff7c0a02), fixedSize: Size.fromWidth(150.0)),
          onPressed: () {
            setState(() {
              _rolledDice = _selectedDice;

              switch (_rolledDice) {
                case dice.d4:
                  _currentValue = rng.nextInt(4) + 1;
                  break;
                case dice.d6:
                  _currentValue = rng.nextInt(6) + 1;
                  break;
                case dice.d8:
                  _currentValue = rng.nextInt(8) + 1;
                  break;
                case dice.d10:
                  _currentValue = rng.nextInt(10) + 1;
                  break;
                case dice.d12:
                  _currentValue = rng.nextInt(12) + 1;
                  break;
                case dice.d20:
                  _currentValue = rng.nextInt(20) + 1;
                  break;
              }
            });
          },
          child: const Text('Roll!'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildRollText(),
      )
    ]));
  }

  Widget buildDiceSelector() {
    if (MediaQuery.of(context).size.width > 1000) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildPaddedDiceImage(dice.d4),
              buildPaddedDiceImage(dice.d6),
              buildPaddedDiceImage(dice.d8),
              buildPaddedDiceImage(dice.d10),
              buildPaddedDiceImage(dice.d12),
              buildPaddedDiceImage(dice.d20),
            ],
          ));
    } else if (MediaQuery.of(context).size.width > 600) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildPaddedDiceImage(dice.d4),
                  buildPaddedDiceImage(dice.d6),
                  buildPaddedDiceImage(dice.d8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildPaddedDiceImage(dice.d10),
                  buildPaddedDiceImage(dice.d12),
                  buildPaddedDiceImage(dice.d20),
                ],
              ),
            ],
          ));
    } else if (MediaQuery.of(context).size.width > 300) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildPaddedDiceImage(dice.d4),
                  buildPaddedDiceImage(dice.d6),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildPaddedDiceImage(dice.d8),
                  buildPaddedDiceImage(dice.d10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildPaddedDiceImage(dice.d12),
                  buildPaddedDiceImage(dice.d20),
                ],
              ),
            ],
          ));
    } else {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildPaddedDiceImage(dice.d4),
                  buildPaddedDiceImage(dice.d6),
                  buildPaddedDiceImage(dice.d8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildPaddedDiceImage(dice.d10),
                  buildPaddedDiceImage(dice.d12),
                  buildPaddedDiceImage(dice.d20),
                ],
              ),
            ],
          ));
    }
  }

  Widget buildPaddedDiceImage(dice requestedDice) {
    String imageName;

    switch (requestedDice) {
      case dice.d4:
        imageName = 'images/d4.png';
        break;
      case dice.d6:
        imageName = 'images/d6.png';
        break;
      case dice.d8:
        imageName = 'images/d8.png';
        break;
      case dice.d10:
        imageName = 'images/d10.png';
        break;
      case dice.d12:
        imageName = 'images/d12.png';
        break;
      case dice.d20:
        imageName = 'images/d20.png';
        break;
    }

    return Material(
        child: Container(
            height: 125,
            width: 125,
            child: Card(
              color: requestedDice == _selectedDice
                  ? Color(0xff7c0a02)
                  : Colors.white,
              semanticContainer: true,
              child: InkWell(
                  splashColor: Color(0xff7c0a02).withAlpha(127),
                  onTap: () {
                    setState(() {
                      _selectedDice = requestedDice;
                    });
                  },
                  child: Image.asset(imageName)),
            )));
  }

  Widget buildRollText() {
    String diceName;

    switch (_rolledDice) {
      case dice.d4:
        diceName = 'd4';
        break;
      case dice.d6:
        diceName = 'd6';
        break;
      case dice.d8:
        diceName = 'd8';
        break;
      case dice.d10:
        diceName = 'd10';
        break;
      case dice.d12:
        diceName = 'd12';
        break;
      case dice.d20:
        diceName = 'd20';
        break;
    }

    if (_currentValue == null) {
      return Text(
        "Unrolled!",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      );
    } else {
      return Text(
        diceName + ': ' + _currentValue.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      );
    }
  }
}
