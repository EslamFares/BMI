import 'package:bmi_cal/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;
  ResultScreen({this.bmiModel});
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI',
          style: TextStyle(color: Colors.amber, fontSize: 40),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: _themChanger.getTheme() == ThemeData.dark()
                ? Icon(Icons.brightness_3)
                : Icon(Icons.brightness_7),
            onPressed: () {
              if (_themChanger.getTheme() == ThemeData.dark()) {
                _themChanger.setTheme(ThemeData.light());
              } else {
                _themChanger.setTheme(ThemeData.dark());
              }
            },
          )
        ],
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 200, height: 200, child: contant()),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      child: Column(
                    children: <Widget>[
                      Text(
                        'Your BMI ',
                        style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700),
                      ),
                      Card(
                        child: Container(
                            width: 300,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${bmiModel.bmi.toStringAsFixed(1)}',
                                  style: TextStyle(
                                      color: Colors.red[700],
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )),
                      )
                    ],
                  )),
                  SizedBox(
                    height: 30,
                  ),

                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text(
                    '${bmiModel.comments}',
                          textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w400),
                  ),
                        ],
                      )),
//                  Text(
//                    '${bmiModel.comments}',
//                    style: TextStyle(
//                        color: Colors.grey,
//                        fontSize: 24.0,
//                        fontWeight: FontWeight.w400),
//                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.assessment,
                                  color: Colors.amber,
                                ),
                                Text('  BMI Range  '),
                                Icon(
                                  Icons.assessment,
                                  color: Colors.amber,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            child: Table(
                              border: TableBorder.all(
                                  color: Colors.amber, width: 2),
                              children: [
                                TableRow(children: [
                                  _contaner('Category', 35),
                                  _contaner("BMI range", 35),
                                ]),
                                TableRow(children: [
                                  _contaner('Severe Thinness', 30),
                                  _contaner('< 16', 30),
                                ]),
                                TableRow(children: [
                                  _contaner('Moderate Thinness', 30),
                                  _contaner('16 - 17', 30),
                                ]),
                                TableRow(children: [
                                  _contaner('Mild Thinness', 30),
                                  _contaner('17 - 18.5', 30),
                                ]),
                                TableRow(children: [
                                  _contaner('Normal', 30),
                                  _contaner('18.5 - 25', 30),
                                ]),
                                TableRow(children: [
                                  _contaner('Overweight', 30),
                                  _contaner('25 - 30', 30),
                                ]),
                                TableRow(children: [
                                  _contaner('Obese Class I', 30),
                                  _contaner('30 - 35', 30),
                                ]),
                                TableRow(children: [
                                  _contaner('Obese Class II', 30),
                                  _contaner('35 - 40', 30),
                                ]),
                                TableRow(children: [
                                  _contaner('Obese Class III', 30),
                                  _contaner('> 40I', 30),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    child: FlatButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      label: Text('Back'),
                      color: Colors.amber,
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }

  Widget contant() {
    Center centet;

    if (bmiModel.isNormal == 1) {
      centet = Center(
        child: SvgPicture.asset(
          'assets/images/lose-weight.svg',
          fit: BoxFit.contain,
        ),
      );
      return centet;
    } else if (bmiModel.isNormal == 2) {
      centet = Center(
          child: SvgPicture.asset(
        'assets/images/strong.svg',
        fit: BoxFit.contain,
      ));
      return centet;
    } else if (bmiModel.isNormal == 4) {
      centet = Center(
          child: SvgPicture.asset(
        'assets/images/overweight.svg',
        fit: BoxFit.contain,
      ));
      return centet;
    } else if (bmiModel.isNormal == 3) {
      centet = Center(
          child: SvgPicture.asset(
        'assets/images/oveer.svg',
        fit: BoxFit.contain,
      ));
      return centet;
    }
  }

  Widget _contaner(String txt, double hieght) {
    Container contan;
    contan = Container(
      child: Column(
        children: [Text(txt)],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      height: hieght,
    );
    return contan;
  }
}
