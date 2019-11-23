import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_localization/simple_localization.dart';
import 'package:user_structure/user_structure.dart';

class UserStructureLocalization extends SimpleLocalizations {
  static UserStructureLocalization of(BuildContext context) {
    UserStructureLocalization localization = Localizations.of<UserStructureLocalization>(context, UserStructureLocalization);
    return localization ?? UserStructureLocalization(Localizations.localeOf(context));
  }
  
  UserStructureLocalization(Locale locale) : super(locale);

  @override
  Locale get defaultLocale => Locale('en');

  @override
  Iterable<Locale> get suportedLocales => [
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  @override
  Map<String, Map<dynamic, String>> get localizedValues => {
    'en': {
      // login_widget
      LoginWidgetMessages.userNameFieldText: 'Username',
      LoginWidgetMessages.passwordFieldText: 'Password',
      LoginWidgetMessages.registerText: 'Register',
      LoginWidgetMessages.forgetPasswordText: 'Forget your password?',
      LoginWidgetMessages.orSignWithText: 'Or sign in with your preferred account',
      // sign_up_widget
      SignUpWidgetMessages.continueButtonText: 'Continue',
      SignUpWidgetMessages.finalizeButtonText: 'Finalize',
      // social buttons
      SocialButtonsMessages.facebook: 'Login with Facebook',
      SocialButtonsMessages.github: 'Login with GitHub',
      SocialButtonsMessages.google: 'Login with Google',
      SocialButtonsMessages.microsoft: 'Login with Microsoft',
      SocialButtonsMessages.twitter: 'Login with Twitter',
    },
    'es': {
      // login_widget
      LoginWidgetMessages.userNameFieldText: 'Usuario',
      LoginWidgetMessages.passwordFieldText: 'Contraseña',
      LoginWidgetMessages.registerText: 'Registro',
      LoginWidgetMessages.forgetPasswordText: '¿Olvidaste tu contraseña?',
      LoginWidgetMessages.orSignWithText: 'O inicie sesión con su cuenta preferida',
      // sign_up_widget
      SignUpWidgetMessages.continueButtonText: 'Continuar',
      SignUpWidgetMessages.finalizeButtonText: 'Finalizar',
      // social buttons
      SocialButtonsMessages.facebook: 'Login con Facebook',
      SocialButtonsMessages.github: 'Login con GitHub',
      SocialButtonsMessages.google: 'Login con Google',
      SocialButtonsMessages.microsoft: 'Login con Microsoft',
      SocialButtonsMessages.twitter: 'Login con Twitter',
    },
    'pt': {
      // login_widget
      LoginWidgetMessages.userNameFieldText: 'Usuário',
      LoginWidgetMessages.passwordFieldText: 'Senha',
      LoginWidgetMessages.registerText: 'Cadastrar',
      LoginWidgetMessages.forgetPasswordText: 'Esqueceu sua senha?',
      LoginWidgetMessages.orSignWithText: 'Ou efetue login com a sua conta preferida',
      // sign_up_widget
      SignUpWidgetMessages.continueButtonText: 'Continuar',
      SignUpWidgetMessages.finalizeButtonText: 'Finalizar',
      // social buttons
      SocialButtonsMessages.facebook: 'Login com Facebook',
      SocialButtonsMessages.github: 'Login com GitHub',
      SocialButtonsMessages.google: 'Login com Google',
      SocialButtonsMessages.microsoft: 'Login com Microsoft',
      SocialButtonsMessages.twitter: 'Login com Twitter',
    }
  };
}