import 'package:connect_google_excel/src/config/colors.dart';
import 'package:connect_google_excel/src/constant/credential.dart';
import 'package:connect_google_excel/src/home/delete.dart';
import 'package:connect_google_excel/src/home/display.dart';
import 'package:connect_google_excel/src/home/insert.dart';
import 'package:connect_google_excel/src/home/update.dart';
import 'package:connect_google_excel/src/widget/bottombar_design/sliding_clipped.dart';
import 'package:flutter/material.dart';

void main() {
  FlutterSheet.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedIndex = 0;
  PageController? _pageController;


  bool loading = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() => selectedIndex = index);
          },
          children: [
            const Display(),
            const Insert(),
            const Update(),
            const Delete()
          ],
        ),

        bottomNavigationBar: SlidingClippedNavBar(
          backgroundColor: Colors.white,
          onButtonPressed: (index) {
            setState(() {
              _onItemTapped(index);
            });
          },
          activeColor: AppColors.appGreenColor,
          selectedIndex: selectedIndex,
          barItems: [
            BarItem(
              icon: Icons.smart_display_outlined,
              title: 'Display',
              iconSize: 21,
            ),
            BarItem(
              icon: Icons.insert_drive_file_outlined,
              title: 'Insert',
              iconSize: 25,
            ),
            BarItem(
              icon: Icons.update_outlined,
              title: 'Update',
              iconSize: 25,
            ),
            BarItem(
              icon: Icons.delete_outlined,
              title: 'Delete',
              iconSize: 25,
            ),
          ],
        ),
      );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      _pageController!.animateToPage(index, duration: Duration(milliseconds: 800), curve: Curves.easeOut);
    });
  }
  
}

