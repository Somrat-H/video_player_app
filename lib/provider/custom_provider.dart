import 'package:flutter/material.dart';
import 'package:video_player_app/http/custom_http.dart';
import 'package:video_player_app/model/video%20_model.dart';

class CustomProvider with ChangeNotifier {
  VideoModel? videoModel;
  // int offset = 2;
  // int page = 1;
  List<Results> myList = [];
  
  Future<List<Results>> getVide(int page, int offset) async {
    // print(offset);
    videoModel = await CustomHttp.getVideo(page, offset);
    myList.addAll(videoModel!.results as List<Results>);

    ChangeNotifier();
    // print(myList.length);
    return myList;
  }

  void getOffSetData(int page, int offset) async {
    // videoModel = await CustomHttp.getVideo(1);
    //   if(page == 1 && offset  == 2){
    //    videoModel = await CustomHttp.getVideo(page, offset);
    // // myList.add(videoModel!.results as Results);
    // myList.addAll(videoModel!.results as List<Results>);
    //   }
    //    if(page == 1&& offset >2){
    //       // print("before incremnet $offset");
    //     offset = offset + page;
    //     videoModel = await CustomHttp.getVideo(page, offset);
    // // myList.add(videoModel!.results as Results);
    // myList.addAll(videoModel!.results as List<Results>);
    // ChangeNotifier();
    //     // print("after incremment $offset");
    //     //  getVide();
    //     ChangeNotifier();
    // // print("Page $page and offset $offset");
    //   }

    getVide(page, offset);

    ChangeNotifier();

    // print(myList);

    // print(myList.length.toString());

    // ChangeNotifier();
    // print("offset $offset");
  }
}
