import 'package:dhb_shop/components/SocialCard.dart';
import 'package:dhb_shop/constans.dart';
import 'package:dhb_shop/screens/sign_in/components/sign_in_form.dart';
import 'package:dhb_shop/size_config.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenHeight(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ingresa con tus redes sociales o \n'
                  'usa tu cuenta de correo electronico',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.08),
                SiginForm(),
                SizedBox(height: SizeConfig.screenWidth * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: 'assets/icons/facebook-2.svg',
                      onTap: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/google-icon.svg',
                      onTap: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/twitter.svg',
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('¿No tienes cuenta?'),
                    Text(
                      'Registrate.',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
