import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_localization/simple_localization.dart';
import 'package:entity_model_structure/entity_model_structure.dart';

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
      // sign_up_widget
      SignUpWidgetMessages.continueButtonText: 'Continue',
      SignUpWidgetMessages.finalizeButtonText: 'Finalize',
    },
    'es': {
      // sign_up_widget
      SignUpWidgetMessages.continueButtonText: 'Continuar',
      SignUpWidgetMessages.finalizeButtonText: 'Finalizar',
    },
    'pt': {
      // sign_up_widget
      SignUpWidgetMessages.continueButtonText: 'Continuar',
      SignUpWidgetMessages.finalizeButtonText: 'Finalizar',
    }
  };
}