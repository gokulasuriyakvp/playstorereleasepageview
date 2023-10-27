import 'package:flutter/material.dart';
import 'package:flutter_playstore_pageview/compayprofile.dart';
import 'package:flutter_playstore_pageview/page_viewimage.dart';
import 'package:flutter_playstore_pageview/page_viewtext.dart';
import 'package:flutter_playstore_pageview/profile.dart';



class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            ' Charles Dickens',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: Text(
            'version 1.0',
            style: TextStyle(
                fontSize: 20, color: Colors.black, ),
          ),
          currentAccountPicture: ClipOval(
            child: Image.asset(
              'images/authorimage.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/backgroundimage.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Quotes Text',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (Context) => PageViewText()));
          },
        ),
        ListTile(
          title: Text(
            'Quotes Image',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => PageViewImageScreen()));
          },
        ),
        ListTile(
          title: Text(
            'Personal Profile',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => PersonalProfile()));
          },
        ),
        ListTile(
          title: Text(
            ''
            'Company Profile',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => CompanyProfile()));
          },
        )
      ]),
    );
  }
}
