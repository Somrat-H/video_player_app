import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player_app/domain/model/video%20_model.dart';

class CustomHttp {
   Future<VideoModel> getVideo(int page, int offset) async {
    VideoModel? videoModel;

    try {
      var response = await http.get(Uri.parse("https://test-ximit.mahfil.net/api/trending-video/$offset?&page=$page"));
      var getData = jsonDecode(utf8.decode(response.bodyBytes));
      videoModel = VideoModel.fromJson(getData);

      return videoModel;

    } catch (e) {
      debugPrint(e.toString());
      return videoModel!;
    }
  }
}
