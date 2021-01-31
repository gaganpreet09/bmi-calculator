import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input.dart';

class Result extends StatelessWidget {
  Widget person_condition(double bmi){
    if(bmi<15){
      return Center(
        child: Text('Very Severly Underweight',style: TextStyle(
            fontSize: 30.00,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,color: Colors.red),),
      );
    }
    else if(bmi>=15 && bmi<16){
      return Text('Severly Underweight',style: TextStyle(
          fontSize: 40.00,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,color: Colors.red));
    }
    else if(bmi>=16 && bmi<18.5){
      return Text('Underweight',style: TextStyle(
          fontSize: 40.00,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,color: Colors.red));
    }
    else if(bmi>=18.5 && bmi<25){
      return Text('You are Healthy :)',style: TextStyle(
          fontSize: 40.00,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,color: Colors.green));
    }
    else if(bmi>=25 && bmi<30){
      return Text('Overweight',style: TextStyle(
          fontSize: 40.00,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,color: Colors.red));
    }
    else if(bmi>=30 && bmi<35){
      return Text('Obese',style: TextStyle(
          fontSize: 40.00,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,color: Colors.red));
    }
    else if(bmi>=35 && bmi<40){
      return Text('Severly Obese',style: TextStyle(
          fontSize: 40.00,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,color: Colors.red));
    }
    else if(bmi>=40){
      return Text('Very Severly Obese',style: TextStyle(
          fontSize: 40.00,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,color: Colors.red));
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        backgroundColor: inactive_container_color,
        body: Container(alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(flex:8,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Your BMI',
                          style: TextStyle(
                              fontSize: 40.00,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2,color: Colors.amberAccent),
                        ),
                        Text('--------------------------------------------------',style: TextStyle(color: Colors.amberAccent),)
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text(bmi.toStringAsFixed(2),style:TextStyle(
                        fontSize: 40.00,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,color: Colors.white) ,),
                    SizedBox(height: 20,),
                    Container(child: person_condition(bmi),)



                  ],

                ),
              ),
              Expanded(flex: 1,
                child: GestureDetector(onTap: (){
                  Navigator.pop(context,);
                },child: Icon(Icons.home,size: 50.00,color: Colors.white,),),
              )

            ],
          ),
        ),
      ),
    );
  }
}
