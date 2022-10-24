import 'package:bmi_calculator/components/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reusable_card.dart';
import '../comp/icon_content.dart';
import '../../constants.dart';
import 'results_page.dart';
import '../comp/bottom_button.dart';
import '../comp/round_icon.dart';
import 'package:bmi_calculator/calc_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 27;

  Gender? sgender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: kTextColor,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        sgender = Gender.male;
                      });
                    },
                    colour: sgender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        sgender = Gender.female;
                      });
                    },
                    colour: sgender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Height',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: kNuTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: (FontAwesomeIcons.minus),
                                    onPressed: () {
                                      setState(() {
                                        height--;
                                      });
                                    }),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        height++;
                                      });
                                    }),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Weight',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: kNuTextStyle,
                                ),
                                Text(
                                  'kg',
                                  style: kLabelTextStyle,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    RoundIconButton(
                                        icon: (FontAwesomeIcons.plus),
                                        onPressed: () {
                                          setState(() {
                                            weight++;
                                          });
                                        })
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Age',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  age.toString(),
                                  style: kNuTextStyle,
                                ),
                                Text(
                                  'yrs',
                                  style: kLabelTextStyle,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: [
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPressed: () {
                                          setState(() {
                                            age++;
                                          });
                                        })
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalcBrain calc = CalcBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi_res: calc.calculateBMI(),
                    resText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
