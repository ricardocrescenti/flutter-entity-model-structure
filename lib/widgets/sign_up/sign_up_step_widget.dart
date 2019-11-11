import 'package:flutter/material.dart';
import 'package:useful_widgets/widgets/stepper/step_widget.dart';

class SignUpStepWidget extends StepWidget {
  SignUpStepWidget({
    Widget title,
    bool showContinueButton = true,
    Widget continueButton,
    Future<bool> Function(BuildContext context) onContinue,
    Future<bool> Function(BuildContext context) onCancel,
    Widget Function(BuildContext context) builder
  }) : super(
    title: title,
    showContinueButton: showContinueButton,
    continueButton: continueButton,
    onContinue: onContinue,
    onCancel: onCancel,
    builder: builder
  );
}