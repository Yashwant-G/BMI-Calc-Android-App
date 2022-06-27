import 'package:flutter/material.dart';
import 'package:bmi_calc/reusable.dart';
import 'constants.dart';
import 'input_page.dart';
import 'calculate.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(this.bmiResult, this.resultTxt, this.resultTip);

  final String bmiResult;
  final String resultTxt;
  final String resultTip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF0A0E35),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: const Center(
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reusable(
                darkSelected,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultTxt.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xff24D876),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        resultTip,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
                () {}),
          ),
          bottomBtn(() {
            Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return InputPage();
            //     },
            //   ),
            // );
          }, 'Re-Calculate')
        ],
      ),
    );
  }
}
