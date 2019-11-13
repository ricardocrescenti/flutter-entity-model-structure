import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_structure/patterns/default_social_button_login.dart';

class GoogleLoginButton extends StatelessWidget{
  final String text;
  final bool rouded;
  final Function(BuildContext context) onPressed;

  GoogleLoginButton({
    this.text = 'Login with Google',
    this.rouded = false,
    this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return DefaultSocialButtonLogin(
      rouded: this.rouded,
      icon: FontAwesomeIcons.google,
      buttonColor: Color.fromRGBO(207, 67, 50, 1),
      textColor: Colors.white,
      text: this.text,
      onPressed: this.onPressed);
  }
}