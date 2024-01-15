import 'package:flutter/material.dart';
class CounterProvider extends ChangeNotifier{
  int counterValue = 0;
  Future<void> increment()async{
    counterValue++;
    notifyListeners();
  }
  Future<void> decrement()async{
    if(counterValue == 0){
      counterValue =0;
      notifyListeners();
    }else{
      counterValue--;
      notifyListeners();
    }
  }
}