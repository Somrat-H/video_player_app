import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player_app/model/video%20_model.dart';
import 'package:video_player_app/provider/custom_provider.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                    children: [
            Text("Trending Video", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            FutureBuilder(
              future: CustomProvider().getVide(1), 
            
            builder: (context, snapshot){
              if(snapshot.hasData){
                   return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(snapshot.data!.results![1].thumbnail.toString(), scale: 1.0, ),
                      )
                    ),
                  )
                ],
              ),
            );
              }
              else {
                return Text("No data");
              }
             
            }
            
            )
            
                    ],
                  ),
          )),
    );
  }
}
