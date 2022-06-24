import 'package:flutter/material.dart';
import 'package:tube_downloader/screens/browser_page.dart';
import 'package:tube_downloader/screens/past_link_page.dart';
import 'package:tube_downloader/services/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff202020),
          //title: Text('Youtube Downloader'),
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
        backgroundColor: darkkk,
        unselectedItemColor: dark,
        selectedItemColor: redish,
        items: bottomNaveItems,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }

  List<Widget> pages = [
    PastLinkPage(),
    BrowserPage(),
  ];

  List<BottomNavigationBarItem> bottomNaveItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.paste),
      label: 'Paste  Link',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.tv),
      label: 'Browser',
    ),
  ];
}
