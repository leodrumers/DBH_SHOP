import 'package:dhb_shop/components/default_button.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';
import '../../../size_config.dart';
import 'custom_suffix_icon.dart';
import 'form_error.dart';

class SiginForm extends StatefulWidget {
  @override
  _SiginFormState createState() => _SiginFormState();
}

class _SiginFormState extends State<SiginForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                activeColor: kPrimaryColor,
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value;
                  });
                },
              ),
              Text('Recordame'),
              Spacer(),
              Text('Olvidé la contraseña')
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            text: 'Continue',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Contraseña',
        hintText: 'Ingresa tu contraseña',
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        setState(() {
          if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            errors.remove(kEmailNullError);
          } else if (emailValidatorRegexp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            errors.remove(kInvalidEmailError);
          }
        });
        return null;
      },
      validator: (value) {
        setState(() {
          if (value.isEmpty && !errors.contains(kEmailNullError)) {
            errors.add(kEmailNullError);
          } else if (!emailValidatorRegexp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
            errors.add(kInvalidEmailError);
          }
        });
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Ingresa tu email',
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }
}
