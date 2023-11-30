import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CustomVideoCard extends StatelessWidget {
  final String image;
  final String channelImage;
  final String title;
  final String views;
  // ignore: prefer_typing_uninitialized_variables
  var date;
  final Function() onTap;
  CustomVideoCard({super.key, required this.channelImage, required this.title, required this.date, required this.image, required this.views, required this.onTap});

  @override
  Widget build(BuildContext context) {
    
  final dot = DateTime.parse(date);
  String  data =  DateFormat.yMMMMd().format(dot);
    return InkWell(
      onTap: onTap,
      child: SizedBox(
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
                      decoration: const BoxDecoration(
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
                                        child: Text(title,style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          
                                        ),),
                                      ),
                              ),
                              
                              const Padding(
                                padding: EdgeInsets.only(top:0),
                                child:  Icon(Icons.more_vert_rounded, color: Colors.grey,),
                              )
                            ],),
                          ),
                          Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                                // ignore: prefer_interpolation_to_compose_strings
                                child: Text("$views Views. "+ data),
                              )
                        ],
                      ),
                    )
                  ],
                ),
              ),
    );
  }
}