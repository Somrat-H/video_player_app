

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/model/video%20_model.dart';
import 'package:video_player_app/provider/custom_provider.dart';

import 'package:video_player_app/screen/video_play.dart';
import 'package:video_player_app/screen/widget/custom_video_card.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
 
  final int _page = 1;
  int _offset = 2;
  bool isLoad = false;

  void update(){

  }
 
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {

            isLoad = true;
            setState(() {
              
              _offset = _offset + _page;
              CustomProvider().getOffSetData(_page,_offset);
            });
            isLoad = false;
        
      }
    });
   
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<CustomProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            const Text("Trending Video", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            FutureBuilder<List<Results>>(
              future: cart.getVide(_page, _offset), 
            
            builder: (context, snapshot){
              if(snapshot.hasData){
                   return Expanded(
                     child: ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index)=> 
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomVideoCard(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoPlay(
                              thumbnail: snapshot.data![index].thumbnail.toString(),
                              channelImage: snapshot.data![index].channelImage.toString(),
                              channelName: snapshot.data![index].channelName.toString(), 
                              days: snapshot.data![index].dateAndTime.toString(), 
                              channelSubscriber: snapshot.data![index].channelSubscriber.toString(), 
                              title: snapshot.data![index].title.toString(), 
                              views: snapshot.data![index].viewers.toString(), 
                              manifest: snapshot.data![index].manifest.toString())));
                          },
                        channelImage: snapshot.data![index].channelImage.toString(), 
                        title: snapshot.data![index].title.toString(), 
                        date: snapshot.data![index].dateAndTime, 
                        image: snapshot.data![index].thumbnail.toString(), 
                        views: snapshot.data![index].viewers.toString()) 
                      )
                     ),
                   );
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              }
             
            }
            
            ),
            
            
                    ],
                  ),
          )),
    );
  }
}
