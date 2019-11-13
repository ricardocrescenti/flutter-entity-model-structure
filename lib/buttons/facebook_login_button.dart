import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_structure/patterns/default_social_button_login.dart';

class FacebookLoginButton extends StatelessWidget{
  final String text;
  final bool rouded;
  final Function(BuildContext context) onPressed;

  FacebookLoginButton({
    this.text = 'Login with Facebook',
    this.rouded = false,
    this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return DefaultSocialButtonLogin(
      rouded: this.rouded,
      icon: FontAwesomeIcons.facebookF,
      buttonColor: Color.fromRGBO(60, 102, 196, 1),
      textColor: Colors.white,
      text: this.text,
      onPressed: this.onPressed);
  }
}