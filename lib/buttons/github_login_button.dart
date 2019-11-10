import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_structure/patterns/default_social_button_login.dart';

class GitHubLoginButton extends StatelessWidget{
  final bool rouded;
  final Function(BuildContext context) onPressed;

  GitHubLoginButton({this.onPressed, this.rouded = false});
  
  @override
  Widget build(BuildContext context) {
    return DefaultSocialButtonLogin(
      rouded: this.rouded,
      icon: FontAwesomeIcons.github,
      buttonColor: Color.fromRGBO(27, 30, 33, 1),
      textColor: Colors.white,
      text: 'Login with GutHub',
      onPressed: this.onPressed);
  }
}