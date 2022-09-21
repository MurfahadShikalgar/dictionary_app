import 'package:flutter/cupertino.dart';

class DictionaryProvider with ChangeNotifier {

  bool? outSideBool;  
  bool? isListen;

    

  bool updateThemeMode( bool themeMode){
    if(themeMode == false){
      themeMode = true;
      outSideBool = true;
      notifyListeners();
    } else{
      themeMode = false;
      outSideBool = false;
      notifyListeners();
    }
    return themeMode;
  }

  void updateListen(){
    if(isListen == false){
      isListen = true;
      notifyListeners();
    }else{
      isListen = false;
      notifyListeners();
    } 
  }

}