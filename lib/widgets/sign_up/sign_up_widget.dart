import 'package:flutter/material.dart';
import 'package:useful_widgets/widgets/stepper/step_widget.dart';
import 'package:useful_widgets/widgets/stepper/stepper_widget.dart';

class SignUpWidget extends StatefulWidget{
  final Widget title;
  final bool centerTitle;
  final List<StepWidget> steps;

  SignUpWidget({
    this.title = const Text('Sign Up'),
    this.centerTitle = false,
    @required this.steps
  });

  @override
  State<StatefulWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
      steps: widget.steps,
    );
  }
}