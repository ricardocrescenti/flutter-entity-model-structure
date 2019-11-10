import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_structure/patterns/default_social_button_login.dart';

class MicrosoftLoginButton extends StatelessWidget{
  final bool rouded;
  final Function(BuildContext context) onPressed;

  MicrosoftLoginButton({this.onPressed, this.rouded = false});
  
  @override
  Widget build(BuildContext context) {
    return DefaultSocialButtonLogin(
      rouded: this.rouded,
      icon: FontAwesomeIcons.microsoft,
      buttonColor: Color.fromRGBO(0, 24, 142, 1),
      textColor: Colors.white,
      text: 'Login with Microsoft',
      onPressed: this.onPressed);
  }
}