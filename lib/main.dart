import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Resultpage.dart';
import 'logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

const inactive=Color(0xff1D1E33);
const active=Color(0xff111328);
class _MyAppState extends State<MyApp> {

  Color malecolor=inactive ;
  Color femalecolor=inactive ;
  int height=180;
  int weight=60;
  int age=10;

  void colorchange(int gender){
    if(gender==1){
      if(malecolor==inactive){
        malecolor=active;
        femalecolor=inactive;
      }
      else{
        malecolor=inactive;
      }
    }
    else{
      if(femalecolor==inactive){
        femalecolor=active;
        malecolor=inactive;
      }
      else{
        femalecolor=inactive;
      }

    }
  }
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      //theme: ThemeData.dark(),
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          //accentColor: Colors.purple,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))

      ),
      home: SafeArea(
        child: Scaffold(
          
          appBar: AppBar(backgroundColor: Color(0xff0A0E21),title: Center(child: Text('BMI Calculator',style: TextStyle(fontWeight: FontWeight.bold),)),
          ),
          body:

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children:  <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          colorchange(1);
                        });



                      },
                      child: Reuseablecard(malecolor,
                        childcard: const iconwidget(icon: FontAwesomeIcons.mars,label: 'Male',),

                      ),
                    ),

                  ),
                  Expanded(child: GestureDetector(
                    onTap: () {
                      setState(() {
                        colorchange(2);
                      });
                    },
                      child: Reuseablecard(femalecolor,childcard: const iconwidget(icon:FontAwesomeIcons.venus,label: 'Female',))),),

                ],
              ),
              Expanded(child:Reuseablecard(const Color(0xff1D1E33), childcard: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,


                  children:  <Widget>[
                  Text('Height',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,color: Color(0xff8D8E98)),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children:  <Widget>[
                        Text(height.toString(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
                        Text('CM',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),),

                      ],
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Colors.pink,
                        overlayColor: Color(0x29EB1555)

                      ),
                      child: Slider(value: height.toDouble(),


                           min: 120.0,
                           max: 220.0,
                          //activeColor: Colors.white,
                           inactiveColor: Colors.grey,

                           onChanged : (double newvalue){
                             setState(() {
                               height=newvalue.round();


                             });

                          }),
                    )
                    
                ],)
                ,),),
              Row(


                children: <Widget>[
                  Expanded(child: Reuseablecard(Color(0xff1D1E33),childcard:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text('Weight',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,color: Color(0xff8D8E98)),),
                        Text(weight.toString(),style:TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  <Widget>[
                            RoundIconButton(icon:FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                weight--;

                              });

                            }),
                            SizedBox(width: 20.0),
                            RoundIconButton(icon:FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                weight++;

                              });

                            }),
                          ],
                        ),



                      ],
                    ),

                  ),
                  ),
                  Expanded(child: Reuseablecard(Color(0xff1D1E33),
                    childcard:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text('Age',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,color: Color(0xff8D8E98)),),
                        Text(age.toString(),style:TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  <Widget>[
                            RoundIconButton(icon:FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                age--;

                              });

                            }),
                            SizedBox(width: 20.0),
                            RoundIconButton(icon:FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                age++;

                              });

                            }),
                          ],
                        ),



                      ],
                    ),
                  ),)

                ],
              ),
              Builder(
                builder: (context)=> GestureDetector(
                  onTap: (){
                    mainlogic results=mainlogic(height, weight);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Resultpage(results.calBMI(),results.condition(),results.inter()



                )));
                },
                  child: Container(

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.pink,),
                    width: double.infinity,
                    height: 50.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),

                    child: Center(child:  Text('CALCULATE',style: TextStyle(fontWeight: FontWeight.w900)),
                    ),
                  ),
                ),
              )

              
            ],


          )


        ),
      ),
    );
  }
}

class iconwidget extends StatelessWidget {
  const iconwidget({required this.icon,required this.label});
final IconData icon;
final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children:  <Widget>[

      Icon(icon,size: 80.0,),
      const SizedBox(
        height: 15.0,
      ),
      Text(label,style: TextStyle(fontSize: 18.0,color: Color(0xff8D8E98)),),

    ],);
  }
}

class Reuseablecard extends StatelessWidget {
   Reuseablecard( this.color,{this.childcard} );
  Color color;
  final childcard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childcard,
      //color: Color(0xff1D1E33),
      height: 200.0,
      //width: 170.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: color),

    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}



