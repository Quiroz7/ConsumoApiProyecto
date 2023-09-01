import 'package:flutter/material.dart';
import 'package:flutter_application_1/consumirAPIS/proyectoMENU.dart';

import 'package:flutter_application_1/theme/appTheme.dart';


void main(){
  runApp(const MainApp() );
}

class MainApp extends StatelessWidget{
  const MainApp ({super.key});

 @override
 Widget build(BuildContext context){ 
  return MaterialApp(

    debugShowCheckedModeBanner: false,
    home:   const MenuProyecto(),
    theme: AppTheme.lightTheme,


  );
 }
}