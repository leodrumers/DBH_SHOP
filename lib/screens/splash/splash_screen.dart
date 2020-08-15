import 'package:dhb_shop/screens/splash/components/splash_body_screen.dart';
import 'package:dhb_shop/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SplashBodyScreen(),
    );
  }
}
