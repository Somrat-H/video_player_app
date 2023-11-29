import 'package:flutter/material.dart';
import 'package:video_player_app/http/custom_http.dart';
import 'package:video_player_app/model/video%20_model.dart';

class CustomProvider with ChangeNotifier{
  VideoModel ?videoModel;

  Future<VideoModel> getVide(int page)async{
    videoModel = await CustomHttp.getVideo(page);
    print(videoModel!.results!.length.toString());
    return videoModel!;
  }

}