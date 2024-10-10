import 'package:flutter/material.dart';
import 'package:plant_app_ui/my_colors.dart';
import 'package:plant_app_ui/screen/account.dart';
import 'package:plant_app_ui/screen/favorite.dart';
import 'package:plant_app_ui/screen/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Body(),
    );
  }
}

// ignore: must_be_immutable
class Body extends StatefulWidget {
  Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Widget> screens = [
    HomePage(),
    const Favoritepage(),
    const AccountPage()
  ];

  int indexScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Material App Bar'),
        leading: const Icon(
          Icons.menu_rounded,
          color: Colors.white,
        ),
        backgroundColor: MyColors().mainColor,
      ),
      body: screens[indexScreen],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexScreen,
          selectedItemColor: MyColors().mainColor,
          // selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting,
          onTap: (value) => {
                setState(() {
                  indexScreen = value;
                })
              },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Plants'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded), label: 'favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_sharp), label: 'Account'),
          ]),
    );
  }
}
