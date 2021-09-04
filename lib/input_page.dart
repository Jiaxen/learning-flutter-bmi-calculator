import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'results_screen.dart';
import 'reusable_content.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender chosenGender;
  int height = 170;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onTap: () {
                        setState(() {
                          chosenGender = Gender.male;
                        });
                      },
                      colour: chosenGender == Gender.male
                          ? kCardBackgroundColor
                          : kCardDeactivatedColor,
                      child: IconContent(
                          iconData: FontAwesomeIcons.mars, text: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTap: () {
                        setState(() {
                          chosenGender = Gender.female;
                        });
                      },
                      colour: chosenGender == Gender.female
                          ? kCardBackgroundColor
                          : kCardDeactivatedColor,
                      child: IconContent(
                          iconData: FontAwesomeIcons.venus, text: 'FEMALE'),
                    ),
                  ),
                ]),
              ),
              Expanded(
                  child: ReusableCard(
                      colour: kCardBackgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('HEIGHT', style: kTextStyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: kTextStyleNumbers,
                                ),
                                SizedBox(width: 3),
                                Text('cm', style: kTextStyle)
                              ]),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x29EB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 10.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 20.0)),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              },
                            ),
                          )
                        ],
                      ))),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: ReusableCard(
                        colour: kCardBackgroundColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: kTextStyle),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    weight.toString(),
                                    style: kTextStyleNumbers,
                                  ),
                                  SizedBox(width: 3),
                                  Text('kg', style: kTextStyle)
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  iconData: Icons.remove,
                                  onTap: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                RoundIconButton(
                                  iconData: Icons.add,
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: ReusableCard(
                        colour: kCardBackgroundColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: kTextStyle),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    age.toString(),
                                    style: kTextStyleNumbers,
                                  ),
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  iconData: Icons.remove,
                                  onTap: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                RoundIconButton(
                                  iconData: Icons.add,
                                  onTap: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                    ]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsScreen(height, weight)),
                  );
                },
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'CALCULATE',
                      style: kTextStyleButton,
                    ),
                    color: kBottomContainerColor,
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 15.0),
                    height: kBottomContainerHeight),
              )
            ]));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({this.iconData, this.onTap});

  final IconData iconData;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      child: Icon(iconData),
      elevation: 1.0,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}
