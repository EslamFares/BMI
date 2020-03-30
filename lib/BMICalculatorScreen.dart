import 'package:bmi_cal/BMIModel.dart';
import 'package:bmi_cal/main.dart';
import 'package:bmi_cal/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'ResultScreen.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightofUser = 170.0;
  double _weightofUser = 70.0;
  double _AgeofUser = 21.0;
  double _bmi = 0;
  BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(right: 3, top: 32, bottom: 10, left: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: SvgPicture.asset(
                'assets/images/Home_img.svg',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'BMI Calculator',
              style: TextStyle(
                  color: Colors.red[600],
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Eat to live, not live to eat',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                    height: 150,
                    padding: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w400),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
//              padding: EdgeInsets.only(left: 16, right: 16),
                          child: Slider(
                            min: 10.0,
                            max: 100.0,
                            onChanged: (Age) {
                              setState(() {
                                _AgeofUser = Age;
                              });
                            },
                            value: _AgeofUser,
                            divisions: 50,
                            activeColor: Colors.blueAccent,
//                inactiveColor: Colors.lightBlue,
                            label: "${_AgeofUser.toStringAsFixed(0)}",
                          ),
                        ),
                        Text(
                          '${_AgeofUser.toStringAsFixed(0)} Year',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ))),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Height',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w400),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
//              padding: EdgeInsets.only(left: 16, right: 16),
                          child: Slider(
                            min: 80.0,
                            max: 250.0,
                            onChanged: (height) {
                              setState(() {
                                _heightofUser = height;
                              });
                            },
                            value: _heightofUser,
                            divisions: 100,
                            activeColor: Colors.blueAccent,
                            label: "${_heightofUser.toStringAsFixed(0)}",
                          ),
                        ),
                        Text(
                          '${_heightofUser.toStringAsFixed(0)}cm',
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
                //..................
                SizedBox(
                  width: 10,
                ),
                //.............
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                        height: 150,
                        padding: EdgeInsets.all(0),
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Weight',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
//              padding: EdgeInsets.only(left: 16, right: 16),
                              child: Slider(
                                min: 40.0,
                                max: 150.0,
                                onChanged: (weight) {
                                  setState(() {
                                    _weightofUser = weight;
                                  });
                                },
                                value: _weightofUser,
                                divisions: 50,
                                activeColor: Colors.blueAccent,
//                inactiveColor: Colors.lightBlue,
                                label: "${_weightofUser.toStringAsFixed(1)}",
                              ),
                            ),
                            Text(
                              '${_weightofUser.toStringAsFixed(1)} kg',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: FlatButton.icon(
                  shape: StadiumBorder(),
                  onPressed: () {
                    _onpres();
                  },
                  icon: Icon(Icons.accessibility),
                  color: Colors.grey,
                  textColor: Colors.black,
                  label: Text(' BMI ')),
            ),
          ],
        ),
      )),
      floatingActionButton: SpeedDial(
          backgroundColor: Colors.teal,
          child: Icon(Icons.settings),
          children: [
            SpeedDialChild(
                labelBackgroundColor: Colors.grey,
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.accessibility,
                  color: Colors.grey,
                ),
                label: 'BMI',
                labelStyle: TextStyle(color: Colors.black),
                onTap: () {
                  _onpres();
                }),
            SpeedDialChild(
              labelBackgroundColor: Colors.black87,
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.brightness_3,
              ),
              label: 'Theme Dark',
              labelStyle: TextStyle(color: Colors.white),
              onTap: () => _themChanger.setTheme(ThemeData.dark()),
            ),
            SpeedDialChild(
              labelBackgroundColor: Colors.white70,
              child: Icon(
                Icons.brightness_7,
                color: Colors.white,
              ),
              label: 'Theme Light',
              backgroundColor: Colors.teal,
              labelStyle: TextStyle(color: Colors.black),
              onTap: () => _themChanger.setTheme(ThemeData.light()),
            ),
          ]),
    );
  }

  _onpres() {
    _bmi = _weightofUser / ((_heightofUser / 100) * (_heightofUser / 100));
    if (_bmi >= 18.5 && _bmi <= 25) {
      _bmiModel = BMIModel(
          bmi: _bmi, isNormal: 2, comments: "GREATE, You are Fit");
    } else if (_bmi < 18.5) {
      _bmiModel =
          BMIModel(bmi: _bmi, isNormal: 1, comments: "You are UnderWeight, You should eat well and do sports ");
    } else if (_bmi > 25 && _bmi <= 30) {
      _bmiModel = BMIModel(
          bmi: _bmi,
          isNormal: 3,
          comments: "You are Overweight, You should do sports");
    } else {
      _bmiModel = BMIModel(bmi: _bmi, isNormal: 4, comments: "You are Obesed , You should exercise daily");
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(
                  bmiModel: _bmiModel,
                )));
  }
}
