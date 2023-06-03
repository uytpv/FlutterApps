import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1F32),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 50,
                          color: Color(0xFFFFFFFF),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'MALE',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1F32),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 50,
                          color: Color(0xFF8D8E9C),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8D8E9C),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF1D1F32),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8D8E9C),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '168',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Text(' cm'),
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context),
                      child: Slider(
                        min: 120,
                        max: 300,
                        value: 168,
                        onChanged: (double value) {},
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1F32),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8D8E9C),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '65',
                          style: TextStyle(
                              fontSize: 50,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              elevation: 0.0,
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {},
                              constraints: BoxConstraints.tightFor(
                                width: 40.0,
                                height: 40.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                            ),
                            SizedBox(width: 10),
                            RawMaterialButton(
                              elevation: 0.0,
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {},
                              constraints: BoxConstraints.tightFor(
                                width: 40.0,
                                height: 40.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1F32),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8D8E9C),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '19',
                          style: TextStyle(
                              fontSize: 50,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              elevation: 0.0,
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {},
                              constraints: BoxConstraints.tightFor(
                                width: 40.0,
                                height: 40.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                            ),
                            SizedBox(width: 10),
                            RawMaterialButton(
                              elevation: 0.0,
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {},
                              constraints: BoxConstraints.tightFor(
                                width: 40.0,
                                height: 40.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.only(bottom: 20.0),
            width: double.infinity,
            height: 80,
          )
        ],
      ),
    );
  }
}
