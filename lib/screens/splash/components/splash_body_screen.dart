import 'package:dhb_shop/components/default_button.dart';
import 'package:dhb_shop/constans.dart';
import 'package:dhb_shop/screens/sign_in/sign_in_screen.dart';
import 'package:dhb_shop/screens/splash/components/splash_content.dart';
import 'package:dhb_shop/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashBodyScreen extends StatefulWidget {
  @override
  _SplashBodyScreenState createState() => _SplashBodyScreenState();
}

class _SplashBodyScreenState extends State<SplashBodyScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashData = [
      {
        "text": "Bienvendio a DHB, Confección y Dotación",
        "image": "assets/images/splash_1.png"
      },
      {
        "text": "Tenemos los elementos de protección que necesitas",
        "image": "assets/images/splash_2.png"
      },
      {
        "text":
            "Nuestra tienda tiene muchos productos que se ajustan\n a tus necesidades",
        "image": "assets/images/splash_3.png"
      },
    ];
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"],
                  image: splashData[index]["image"],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(18)),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      DefaultButton(
                        text: 'Continue',
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kDisableDot,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
