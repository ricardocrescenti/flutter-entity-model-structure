import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_structure/patterns/default_social_button_login.dart';

class TwitterLoginButton extends StatelessWidget{
  final bool rouded;
  final Function(BuildContext context) onPressed;

  TwitterLoginButton({this.onPressed, this.rouded = false});
  
  @override
  Widget build(BuildContext context) {
    return DefaultSocialButtonLogin(
      rouded: this.rouded,
      icon: FontAwesomeIcons.twitter,
      buttonColor: Color.fromRGBO(27, 161, 242, 1),
      textColor: Colors.white,
      text: 'Login with Twitter',
      onPressed: this.onPressed);
  }
}