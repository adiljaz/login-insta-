import 'package:flutter/material.dart';
import 'package:my_first_app/home.dart';
import 'package:my_first_app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY_NAME = 'userLogined';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLogined();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'images/inastagram.webp',
            height: 100,
          )),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 245, 242, 242),
    );
  }

  disposes() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLogin()));
  }

  Future<void> checkUserLogined() async {
    final _sharedPrefs = await SharedPreferences.getInstance();

    final _userLoggedin = _sharedPrefs.getBool(SAVE_KEY_NAME);

    if (_userLoggedin == null || _userLoggedin == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    }
  }
}
