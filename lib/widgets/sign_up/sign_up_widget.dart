import 'package:flutter/material.dart';
import 'package:useful_widgets/widgets/stepper/stepper_widget.dart';
import 'package:entity_model_structure/entity_model_structure.dart';

class SignUpWidget extends StatefulWidget{
  final Widget title;
  final bool centerTitle;
  final Widget continueButton;
  final Widget finalizeButton;
  final Future<void> Function(BuildContext context) onFinalize;
  final List<SignUpStepWidget> steps;  

  SignUpWidget({
    this.title,
    this.centerTitle = false,
    this.continueButton,
    this.finalizeButton,
    this.onFinalize,
    @required this.steps
  });

  @override
  State<StatefulWidget> createState() => SignUpWidgetState();
}

class SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildStepper(),
    );
  }

  buildAppBar() {
    if (widget.title != null) {
      	return AppBar(
          title: widget.title,
          centerTitle: widget.centerTitle,
        );
    }
    return null;
  }

  buildStepper() {
    return StepperWidget(
      showStepTitle: true,
      centerTitle: widget.centerTitle,
      continueButton: widget.continueButton ?? Text(UserStructureLocalization.of(context)[SignUpWidgetMessages.continueButtonText]),
      finalizeButton: widget.finalizeButton ?? Text(UserStructureLocalization.of(context)[SignUpWidgetMessages.finalizeButtonText]),
      onFinalize: widget.onFinalize,
      steps: widget.steps,
    );
  }
}