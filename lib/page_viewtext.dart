import 'package:flutter/material.dart';
import 'package:flutter_playstore_pageview/appdata.dart';
import 'package:flutter_playstore_pageview/display.text.dart';
import 'package:flutter_playstore_pageview/navbar.dart';
import 'package:share_plus/share_plus.dart';

class PageViewText extends StatefulWidget {
  const PageViewText({Key? key}) : super(key: key);

  @override
  State<PageViewText> createState() => _PageViewTextState();
}

class _PageViewTextState extends State<PageViewText> {
  var selecetdIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Charles Dickens Quotes',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    "Share",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 1) {
                  _shareInfo();
                }
              },
            )
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    selecetdIndex = index;
                  });
                },
                controller: PageController(viewportFraction: 0.7),
                itemCount: appDataText.length,
                itemBuilder: (context, index) {
                  var _quotes = appDataText[index];
                  var _scale = selecetdIndex == index ? 1.0 : 0.8;
                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale, end: _scale),
                      duration: Duration(microseconds: 400),
                      child: DisplayText(
                        appDataText: _quotes,
                      ),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value as double,

                          child: child,
                        );
                      });
                  return DisplayText(appDataText: appDataText[index]);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: new Text(
                  (selecetdIndex + 1).toString() +
                      '/' +
                      appDataText.length.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _shareInfo() {
    print('--------->Share');
    Share.share(appDataText[selecetdIndex].text);
    print(appDataText[selecetdIndex].text);
  }
}
