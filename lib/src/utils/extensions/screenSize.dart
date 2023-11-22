import 'package:flutter/material.dart';

extension ScreenSize on double?{
  double getScreenWidth({ BuildContext? context }){
    var Screenwidth = MediaQuery.of(context!).size.width;
    return Screenwidth;
  }

    double getScreenheight({ BuildContext? context }){
    var Screenwidth = MediaQuery.of(context!).size.height;
    return Screenwidth;
  }
}


