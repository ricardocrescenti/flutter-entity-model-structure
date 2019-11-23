import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_structure/patterns/default_social_button_login.dart';
import 'package:user_structure/user_structure.dart';

class MicrosoftLoginButton extends StatelessWidget{
  final String text;
  final bool rouded;
  final Function(BuildContext context) onPressed;

  MicrosoftLoginButton({
    this.text,
    this.rouded = false,
    this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return DefaultSocialButtonLogin(
      rouded: this.rouded,
      icon: FontAwesomeIcons.microsoft,
      buttonColor: Color.fromRGBO(0, 24, 142, 1),
      textColor: Colors.white,
      text: this.text ?? UserStructureLocalization.of(context)[SocialButtonsMessages.microsoft],
      onPressed: this.onPressed);
  }
}