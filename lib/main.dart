import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/provider/custom_provider.dart';
import 'package:video_player_app/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [ChangeNotifierProvider(create: (_)=> CustomProvider())],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
     
      
    );
  }
}


  