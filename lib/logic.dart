import 'dart:math';
class mainlogic {
  mainlogic(this.height, this.weight);
  final int height;
  final int weight;
  double _bmi=0;
  String calBMI(){
    _bmi=weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String condition(){
    if(_bmi>25){
      return 'OverWeight';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }

  }
  String inter(){
    if(_bmi>25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }
    else if(_bmi>18.5){
      return 'You have a normal weight. Good job!';
    }
    else{
      return 'Ypu have a lower than normal body weight. You can eat a bit more.';
    }

  }

}
