import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable.dart';
import 'constants.dart';
import 'result.dart';
import 'calculate.dart';

enum Gender { male, female, nul }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected = Gender.nul;
  int hth = 180;
  int wth = 60;
  int age = 18;
  // Color MaleCardColor = Inclr;
  // Color FemaleCardColor = Inclr;
  // //1=m 2=f
  // void updateColour(Gender select) {
  //   if (select == Gender.male) {
  //     if (MaleCardColor == Inclr) {
  //       MaleCardColor = clr;
  //       FemaleCardColor = Inclr;
  //     } else {
  //       MaleCardColor = Inclr;
  //     }
  //   } else if (select == Gender.female) {
  //     if (FemaleCardColor == Inclr) {
  //       FemaleCardColor = clr;
  //       MaleCardColor = Inclr;
  //     } else {
  //       FemaleCardColor = Inclr;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
        backgroundColor: const Color(0xFF0A0E35),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusable(
                    selected == Gender.male ? lightNotselected : darkSelected,
                    IconContent(
                      FontAwesomeIcons.mars,
                      'MALE',
                    ),
                    () {
                      setState(() {
                        selected = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: reusable(
                    selected == Gender.female ? lightNotselected : darkSelected,
                    IconContent(
                      FontAwesomeIcons.venus,
                      'FEMALE',
                    ),
                    () {
                      setState(() {
                        selected = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusable(
              darkSelected,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGTH',
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        hth.toString(),
                        style: const TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text(
                        'cm',
                        style: textStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: hth.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // activeColor: Colors.white,
                      // inactiveColor: Colors.black,
                      onChanged: (double value) {
                        setState(() {
                          hth = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              () {
                setState(() {
                  selected = Gender.nul;
                });
              },
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusable(
                    darkSelected,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: textStyle,
                        ),
                        Text(
                          wth.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                wth--;
                              });
                            }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                wth++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                    () {
                      setState(() {
                        selected = Gender.nul;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: reusable(
                    darkSelected,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: textStyle,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                    () {
                      setState(() {
                        selected = Gender.nul;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomBtn(() {
            Calculate obj = Calculate(hth, wth);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ResultsPage(
                    obj.calculateBMI(),
                    obj.getResults(),
                    obj.getTips(),
                  );
                },
              ),
            );
          }, 'Calculate'),
        ],
      ),
    );
  }
}

class bottomBtn extends StatelessWidget {
  bottomBtn(this.onTap, this.btnTitle);

  final VoidCallback onTap;
  final String btnTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(0xffEB1555),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bh,
        child: Center(
          child: Text(
            btnTitle,
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.child, this.onPres);

  final IconData child;
  final VoidCallback onPres;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        child,
      ),
      // elevation: 6.0,
      onPressed: onPres,
      shape: CircleBorder(),
      fillColor: Color(0xff4C4F5E),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
