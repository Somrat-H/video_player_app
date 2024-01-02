import 'package:flutter/material.dart';
import 'package:video_player_app/data/custom_http.dart';
import 'package:video_player_app/domain/model/video%20_model.dart';

class CustomProvider with ChangeNotifier {
  VideoModel? videoModel;
  List<Results> myList = [];
  final CustomHttp _customHttp = CustomHttp();

  Future<List<Results>> getVide(int page, int offset) async {
   
    videoModel = await _customHttp.getVideo(page, offset);
    myList.addAll(videoModel!.results as List<Results>);

    ChangeNotifier();

    return myList;
  }

  void getOffSetData(int page, int offset) async {
    getVide(page, offset);
    ChangeNotifier();
  }
}
