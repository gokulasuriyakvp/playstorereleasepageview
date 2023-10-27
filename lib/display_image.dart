import 'package:flutter/material.dart';

import 'app_data_image.dart';


class DisplayImage extends StatelessWidget {
   final AppDataImage appData;

  const DisplayImage({super.key, required this.appData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(appData.imagepath),
            fit: BoxFit.cover,
          )),
    );
  }
}
