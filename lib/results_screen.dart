import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_content.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen(this.height, this.weight);

  final int height;
  final int weight;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  double bmi;
  String health;
  String healthText;

  @override
  Widget build(BuildContext context) {
    calculateBMI();
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(25, 25, 25, 10),
              child: Text(
                'Your Results',
                style: kTextStyleTitle,
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kCardBackgroundColor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(health, style: kTextStyleSubtitle),
                      Text(bmi.toStringAsFixed(1), style: kTextStyleResults),
                      Text(healthText, style: kTextStyle),
                    ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'RE-CALCULATE',
                    style: kTextStyleButton,
                  ),
                  color: kBottomContainerColor,
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 15.0),
                  height: kBottomContainerHeight),
            ),
          ]),
    );
  }

  void calculateBMI() {
    setState(() {
      bmi = (10000 * widget.weight / (widget.height * widget.height));
      if (bmi < 18.5) {
        health = 'UNDERWEIGHT';
        healthText = 'Your need to gain weight';
      } else if ((bmi >= 18.5) && (bmi < 25.0)) {
        health = 'HEALTHY';
        healthText = 'You are okay';
      } else if ((bmi >= 25.0) && (bmi < 30.0)) {
        health = 'OVERWEIGHT';
        healthText = 'Your body weight is heavier than normal';
      } else if ((bmi >= 30.0)) {
        health = 'OBESE';
        healthText = 'You need to lose weight';
      }
    });
  }
}
