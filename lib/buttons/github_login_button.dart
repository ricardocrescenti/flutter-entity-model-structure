import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_structure/patterns/default_social_button_login.dart';
import 'package:user_structure/user_structure.dart';

class GitHubLoginButton extends StatelessWidget{
  final String text;
  final bool rouded;
  final Function(BuildContext context) onPressed;

  GitHubLoginButton({
    this.text,
    this.rouded = false,
    this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return DefaultSocialButtonLogin(
      rouded: this.rouded,
      icon: FontAwesomeIcons.github,
      buttonColor: Color.fromRGBO(27, 30, 33, 1),
      textColor: Colors.white,
      text: this.text ?? UserStructureLocalization.of(context)[SocialButtonsMessages.github],
      onPressed: this.onPressed);
  }
}