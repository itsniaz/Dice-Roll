import 'package:flutter/material.dart';
import 'dart:math' show Random;

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dice Roll'),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/appicon.png"),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: DiceWidget(),
      ),
    );
  }
}

class DiceWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiceState();
  }
}

class DiceState extends State<DiceWidget> {
  int diceCount = 4;

  int dice1 = getRandomNumber();
  int dice2 = getRandomNumber();
  int dice3 = getRandomNumber();
  int dice4 = getRandomNumber();

  static int getRandomNumber() => 1 + Random().nextInt(7 - 1);


  @override
  Widget build(BuildContext context) {
    final Dice1 = () {
      if (diceCount > 0) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: SizedBox(
            width: 160,
            height: 160,
            child: Image.asset("images/dice${dice1}.png"),
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    };

    final Dice2 = () {
      if (diceCount > 1) {

        return Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: SizedBox(
            width: 160,
            height: 160,
            child: Image.asset("images/dice${dice2}.png"),
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    };

    final Dice3 = () {
      if (diceCount > 2) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: SizedBox(
            width: 160,
            height: 160,
            child: Image.asset("images/dice${dice3}.png"),
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    };

    final Dice4 = () {
      if (diceCount > 3) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: SizedBox(
            width: 160,
            height: 160,
            child: Image.asset("images/dice${dice4}.png"),
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    };

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          dice1 = getRandomNumber();
          dice2 = getRandomNumber();
          dice3 = getRandomNumber();
          dice4 = getRandomNumber();
        });
      },
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: 160,
                height: 150,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          diceCount = 1;
                        });
                      },
                      elevation: 10,
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        "1",
                        style: TextStyle(fontFamily: "Acme", fontSize: 24),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          diceCount = 2;
                        });
                      },
                      elevation: 10,
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        "2",
                        style: TextStyle(fontFamily: "Acme", fontSize: 24),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          diceCount = 3;
                        });
                      },
                      elevation: 10,
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        "3",
                        style: TextStyle(fontFamily: "Acme", fontSize: 24),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          diceCount = 4;
                        });
                      },
                      elevation: 10,
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        "4",
                        style: TextStyle(fontFamily: "Acme", fontSize: 24),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[Dice1(),Dice2(),Dice3(),Dice4()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
