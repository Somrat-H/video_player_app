import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player_app/model/video%20_model.dart';

class CustomHttp {
  static Future<VideoModel> getVideo(int page) async {
    VideoModel? videoModel;

    try {
      var response = await http.get(Uri.parse("https://test-ximit.mahfil.net/api/trending-video/1?&page=$page"));
      var getData = jsonDecode(response.body);
      videoModel = VideoModel.fromJson(getData);
      return videoModel;

    } catch (e) {
      debugPrint(e.toString());
      return videoModel!;
    }
  }
}
