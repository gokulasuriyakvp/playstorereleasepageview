import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playstore_pageview/navbar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'app_data_image.dart';
import 'display_image.dart';
import 'indicator.dart';

class PageViewImageScreen extends StatefulWidget {
  const PageViewImageScreen({Key? key}) : super(key: key);

  @override
  State<PageViewImageScreen> createState() => _PageViewImageScreenState();
}

class _PageViewImageScreenState extends State<PageViewImageScreen> {
  var selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          'Charles Dickens Images',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) =>
                [PopupMenuItem(value: 1, child: Text('Share'))],
            onSelected: (value) {
              if (value == 1) {
                shareInfo();
              }
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 450,
              child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      selectIndex = index;
                    });
                  },
                  itemCount: appdataimage.length,
                  itemBuilder: (context, index) {
                    return DisplayImage(appData: appdataimage[index]);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  appdataimage.length,
                  (index) =>
                      Indicator(isActive: selectIndex == index ? true : false),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  shareInfo() async {
    ByteData imagebyte =
        await rootBundle.load(appdataimage[selectIndex].imagepath);
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/download.jpg';
    File(path).writeAsBytesSync(imagebyte.buffer.asUint8List());
    await Share.shareFiles([path], text: 'Image Shared');
  }
}
