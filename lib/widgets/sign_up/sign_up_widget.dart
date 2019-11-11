import 'package:flutter/material.dart';
import 'package:useful_widgets/widgets/stepper/stepper_widget.dart';
import 'package:user_structure/user_structure.dart';

class SignUpWidget extends StatefulWidget{
  final Widget title;
  final bool centerTitle;
  final Widget continueButton;
  final Widget finalizeButton;
  final Future<bool> Function(BuildContext context) onFinalize;
  final List<SignUpStepWidget> steps;  

  SignUpWidget({
    this.title,
    this.centerTitle = false,
    this.continueButton = const Text('CONTINUE'),
    this.finalizeButton = const Text('FINALIZE'),
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
      continueButton: widget.continueButton,
      finalizeButton: widget.finalizeButton,
      onFinalize: widget.onFinalize,
      steps: widget.steps,
    );
  }
}