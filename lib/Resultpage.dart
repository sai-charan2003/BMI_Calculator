import 'package:flutter/material.dart';
class Resultpage extends StatelessWidget {
  Resultpage (this.BMI,this.result,this.inter);
  final String BMI;
  final String result;
  final String inter;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          appBar: AppBar(backgroundColor: Color(0xff0A0E21),title: Center(child: Text('BMI Calculator',style: TextStyle(fontWeight: FontWeight.bold),)
          ),
      ),
        body:
            
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 50.0),),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(


                //color: Color(0xff1D1E33),
                height: 200.0,
                //width: 170.0,
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Color(0xff1D1E33)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  Text(result,style: TextStyle(fontWeight: FontWeight.w800,color: Colors.greenAccent,fontSize: 20.0),),
                    Text(BMI,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 100.0),),
                    Text(inter,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),),



                 ],),
              ),
            ),
            GestureDetector(
              onTap: (){
                   Navigator.pop(context);
                  },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.pink,),
                width: double.infinity,
                height: 50.0,
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                child: Center(child: Text('RE-CALCULATE',style: TextStyle(fontWeight: FontWeight.w900)))),
            ),

          ],
        ),
        
        ),
    );

  }
}
