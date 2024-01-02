import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String text;
  final IconData iconData;
  const CustomBox({super.key,required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300,width:2 ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(iconData, color: Colors.grey,),
                        Text(text, style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),)
                      ],
                    ),
                  ),
                  );
  }
}