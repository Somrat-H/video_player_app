import 'package:flutter/material.dart';

class CustomVideoCard extends StatelessWidget {
  final String image;
  final String channelImage;
  final String title;
  final String views;
  final String date;
  const CustomVideoCard({super.key, required this.channelImage, required this.title, required this.date, required this.image, required this.views});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: double.infinity,
              child: Column(
              
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                      
                          image ),
                      )
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(channelImage),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                                      child: Text("${title}",style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        
                                      ),),
                                    ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.only(top:0),
                              child: Icon(Icons.more_vert_rounded, color: Colors.grey,),
                            )
                          ],),
                        ),
                        Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                              child: Text(views+" Views. "+ date),
                            )
                      ],
                    ),
                  )
                ],
              ),
            );
  }
}