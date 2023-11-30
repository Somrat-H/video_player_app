import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/screen/widget/custom_box.dart';

class VideoPlay extends StatefulWidget {
  final String title;
  final String views;
  final String days;
  final String channelName;
  final String channelSubscriber;
  final String manifest;
  final String channelImage;
  final String thumbnail;

  const VideoPlay({super.key,required this.thumbnail, required this.channelImage, required this.channelName, required this.days, required this.channelSubscriber, required this.title, required this.views, required this.manifest});

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late VideoPlayerController _videoPlayerController;
  
  bool isPlay = false;
    @override
  void initState() {
    
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        widget.manifest), videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true) )
      ..initialize().then((_) {

        setState(() {});
      });
      if (kDebugMode) {
        print("ratio${_videoPlayerController.value.aspectRatio.toDouble()}");
      }
      super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: SingleChildScrollView(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _videoPlayerController.value.isInitialized 
                    ? AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child:  GestureDetector(
                onTap: () {
                  _videoPlayerController.value.isPlaying ? _videoPlayerController.pause() : _videoPlayerController.play();
                },
                child:  AspectRatio(
                  aspectRatio: 16/9,
                  child: Stack(
                    children: [
                      VideoPlayer(_videoPlayerController),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: DecoratedBox(decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ), child: IconButton(onPressed: (){
                            Navigator.pop(context);
                            _videoPlayerController.pause();
                      }, icon:  const Icon(Icons.arrow_back)),))
                    ],
                  ),
                ),
                              ),
                        
                       
                      )
                    : AspectRatio(
                      aspectRatio: 16/9,
                      child: Container(
                        
                        // height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(widget.thumbnail))
                        ),
                      ),
                    ),
            
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Expanded(child: Text(widget.title, style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
            
                  ),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 0),
                  child: Row(
                    children: [
                      Text("${widget.views} views .${widget.days}Days Ago", style: const TextStyle(
                        color: Colors.grey,
                        
                      ),)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal:10.0, vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: CustomBox(iconData: Icons.favorite_border_outlined, text: "MASA ALLAH (12K)"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: CustomBox(iconData: Icons.thumb_up_alt_sharp,text: "LIKE (12K)"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right :10.0),
                          child: CustomBox(iconData: Icons.share_sharp, text: "SHARE"),
                        ),
                        CustomBox(iconData: Icons.flag, text: "Report"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(widget.channelImage),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                            Text(widget.channelName, style: const TextStyle(
                              fontWeight: FontWeight.bold,
                                            
                            ),),
                             Text("${widget.channelSubscriber} Subscriber", style: const TextStyle(
                             color: Colors.grey,
                                            
                            ),),
                                                  ],
                                                ),
                          ),
                        ],
                      ),
                      
                      DecoratedBox(decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                  
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(children: [
                          Icon(Icons.add, color: Colors.white,),
                          Text("Subscribe", style: TextStyle(
                            color: Colors.white
                          ),)
                        ],),
                      ),)
                    ],
                  ),
                ), 
                const Divider(),
            
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("COMMENTS  7.5k",style: TextStyle(
                        color: Colors.grey
                      ),),
                      Column(
                        children: [
                          Icon(Icons.arrow_drop_up,),
                          Icon(Icons.arrow_drop_down_outlined)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: DecoratedBox(decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), 
                    border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add Comment", style: TextStyle(
                          color: Colors.grey,
                    
                        ),),
                        Icon(Icons.send, color: Colors.grey,),
                      ],
                    ),
                  ),
                  ),
                ), 
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fahmida Khan   2 days ago", style: TextStyle(
                              color: Colors.grey,
                            ),),
                            Text("*************************************************")
                          ],
                        ),
                      )
                    ],
                  ),
                ), const Divider()
            
              ],
            ),
          ),
        ),
       
    );
  }
}