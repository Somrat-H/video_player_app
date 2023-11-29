import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player_app/model/video%20_model.dart';
import 'package:video_player_app/provider/custom_provider.dart';
import 'package:http/http.dart' as http;
import 'package:video_player_app/screen/widget/custom_video_card.dart';
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
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            Text("Trending Video", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            FutureBuilder(
              future: CustomProvider().getVide(1), 
            
            builder: (context, snapshot){
              if(snapshot.hasData){
                   return Expanded(
                     child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.results!.length,
                      itemBuilder: (_, index)=> 
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomVideoCard(
                        channelImage: snapshot.data!.results![index].channelImage.toString(), 
                        title: snapshot.data!.results![index].title.toString(), 
                        date: snapshot.data!.results![index].dateAndTime.toString(), 
                        image: snapshot.data!.results![index].thumbnail.toString(), 
                        views: snapshot.data!.results![index].viewers.toString()),
                      )
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
