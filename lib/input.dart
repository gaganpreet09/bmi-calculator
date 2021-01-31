import 'package:bmi_app/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'repeated_container.dart';
import 'dart:math';
import 'result_screen.dart';

const active_container_color = Color(0xFF27289F);
const inactive_container_color = Color(0xFF27287F);
const male_img = 'ss.png';
const female_img = 'cc.png';
enum Gender { male, female }
int height = 180;
int weight = 60;
int age = 20;
double bmi;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color male_card_color = inactive_container_color;
  Color female_card_color = inactive_container_color;
  void update_color(Gender selected_gender) {
    if (selected_gender == Gender.male) {
      if (female_card_color == inactive_container_color ||
          female_card_color == active_container_color) {
        male_card_color = active_container_color;
        female_card_color = inactive_container_color;
      }
    } else if (selected_gender == Gender.female) {
      if (male_card_color == inactive_container_color ||
          male_card_color == active_container_color) {
        female_card_color = active_container_color;
        male_card_color = inactive_container_color;
      }
    }
  }
  double calculate_bmi(int weight,int height){
    bmi = weight / (pow((height / 100), 2));
    return bmi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),backgroundColor: Color(0xFF27286F),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          update_color(Gender.male);
                        });
                      },
                      child: repeated_container(
                        colour: male_card_color,
                        chd: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            'images/$male_img',
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          update_color(Gender.female);
                        });
                      },
                      child: repeated_container(
                        colour: female_card_color,
                        chd: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            'images/$female_img',
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: repeated_container(
              colour: inactive_container_color,
              chd: Expanded(
                flex: 1,
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: TextStyle(fontSize: 21.00, letterSpacing: 3),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 30),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ' cm',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          activeColor: Colors.blue,
                          max: 250,
                          min: 100,
                          onChanged: (double newValue) {
                            print(newValue);
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        )
                      ],
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: repeated_container(
                    colour: inactive_container_color,
                    chd: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style:
                              TextStyle(fontSize: 21.00, letterSpacing: 3),
                            ),
                            Text(' (in Kg)')
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(onTap: (){
                              setState(() {
                                if (weight - 1 >= 0) {
                                  weight = weight - 1;
                                }
                              });
                            },child: Icon(Icons.remove_circle,size: 50,color: Colors.white,)),

//                            RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
//                              onPressed: () {
//                                setState(() {
//                                  if (weight - 1 >= 0) {
//                                    weight = weight - 1;
//                                  }
//                                });
//                              },
//                      //        backgroundColor: Colors.blueGrey,
//                              child: Icon(
//                                Icons.remove,
//                              ),
//                            ),
                            SizedBox(
                              width: 25,
                            ),
                            GestureDetector(onTap: (){
                              setState(() {
                                if (weight + 1 <= 600) {
                                  weight = weight + 1;
                                }
                              });
                            },child: Icon(Icons.add_circle,size: 50,color: Colors.white,),),

//                            RaisedButton(
//                              onPressed: () {
//                                setState(() {
//                                  if (weight + 1 <= 600) {
//                                    weight = weight + 1;
//                                  }
//                                });
//                              },
//                      //        backgroundColor: Colors.blueGrey,
//                              child: Icon(
//                                Icons.add,
//                              ),
//                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: repeated_container(
                    colour: inactive_container_color,
                    chd: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 21.00, letterSpacing: 3),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(onTap: (){
                              setState(() {
                                if (age - 1 >= 0) {
                                  age = age - 1;
                                }
                              });
                            },child: Icon(Icons.remove_circle,color: Colors.white,size: 50,)),
//                            RaisedButton(
//                              onPressed: () {
//                                setState(() {
//                                  if (age - 1 >= 0) {
//                                    age = age - 1;
//                                  }
//                                });
//                              },
//                              //backgroundColor: Colors.blueGrey,
//                              child: Icon(
//                                Icons.remove,
//                              ),
//                            ),
                            SizedBox(
                              width: 25,
                            ),
                            GestureDetector(onTap: (){
                              setState(() {
                                if (age + 1 <= 121) {
                                  age = age + 1;
                                }
                              });
                            },child: Icon(Icons.add_circle,color: Colors.white,size: 50,)),
//                            RaisedButton(
//                              onPressed: () {
//                                setState(() {
//                                  if (age + 1 <= 121) {
//                                    age = age + 1;
//                                  }
//                                });
//                              },
//                           //   backgroundColor: Colors.blueGrey,
//                              child: Icon(
//                                Icons.add,
//                              ),
//                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calculate_bmi(weight,height);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Result()));
            },
            child: Container(
                height: 65,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.black45,
                ),
                child: Center(
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: 25, letterSpacing: 2),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
