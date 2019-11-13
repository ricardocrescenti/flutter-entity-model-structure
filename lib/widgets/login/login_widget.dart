import 'package:flutter/material.dart';
import 'package:simple_form/simple_form.dart';

class LoginWidget extends StatefulWidget {
  final Widget logo;
  final Widget title;
  final String userNameFieldText;
  final String passwordFieldText;
  final String registerText;
  final String forgetPasswordText;
  final String orSignWithText;
  final Future<bool> Function(BuildContext context) onLoginClick;
  final Future<bool> Function(BuildContext context) onForgetPasswordClick;
  final Future<bool> Function(BuildContext context) onRegisterClick;
  final List<Widget> socialLoginButtons;
  final EdgeInsetsGeometry padding;

  LoginWidget({
    this.logo,
    this.title,
    this.userNameFieldText = 'Username',
    this.passwordFieldText = 'Password',
    this.registerText = 'Register',
    this.forgetPasswordText = 'Forget your password?',
    this.orSignWithText = 'Or sign in with your preferred account',
    @required this.onLoginClick,
    this.onForgetPasswordClick,
    this.onRegisterClick,
    this.socialLoginButtons,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 50)
  });

  @override
  State<StatefulWidget> createState() => _LoginWidget();
}

class _LoginWidget extends State<LoginWidget> {
  GlobalKey<FormState> formState = GlobalKey();
  Map<String, dynamic> formValue = {
    'username': '',
    'password': ''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBackground(),
          _buildScreen(),
        ]
      )
    );
  }

  _buildBackground() {
    return Container();
  }

  _buildScreen() {
    return Center(
      child: SingleChildScrollView(
      padding: widget.padding,
      child: Column(
        children: [
          _buildLogo(),
          _buildSubtitle(),
          _buildForm(),
          _buildSocialLoginButtons()
        ].where((item) => item != null).toList().cast<Widget>(),
      ),
    ));
  }

  _buildLogo() {
    if (widget.logo != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: widget.logo,
      );
    }
    return null;
  }
  _buildSubtitle() {
    if (widget.title != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: widget.title,
      );
    }
    return null;
  }
  _buildForm() {
    return SimpleForm(
      key: formState,
      initialValues: formValue,
      onChange: (fieldNane, newValue) => formValue[fieldNane] = newValue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: SimpleTextField(
              fieldName: 'username', 
              title: widget.userNameFieldText, 
              textCapitalization: TextCapitalization.none, 
              inputDecoration: InputDecoration(
                labelText: widget.userNameFieldText,
                prefixIcon: Icon(Icons.person)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: SimpleTextField(
              fieldName: 'password', 
              title: widget.passwordFieldText, 
              textCapitalization: TextCapitalization.none, 
              obscureText: true,
              inputDecoration: InputDecoration(
                labelText: widget.passwordFieldText,
                prefixIcon: Icon(Icons.lock)
              ),
            ),
          ),
          RaisedButton(
            child: Text('Login'),
            onPressed: () => widget.onLoginClick(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              (widget.onRegisterClick != null 
                ? FlatButton(
                  child: Text(widget.registerText),
                  onPressed: () => widget.onRegisterClick(context),
                )
                : null),
              (widget.onForgetPasswordClick != null
                ? FlatButton(
                  child: Text(widget.forgetPasswordText),
                  onPressed: () => widget.onForgetPasswordClick(context),
                )
                : null)
            ].where((item) => item != null).toList().cast<Widget>()
          )
        ],
      ),
    );
  }
  _buildSocialLoginButtons() {
    if (widget.socialLoginButtons != null && widget.socialLoginButtons.length > 0) {
      List<Widget> widgets = [
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(widget.orSignWithText),
        ),
      ];
      widgets.addAll(widget.socialLoginButtons); 
      
      return Column(
        children: widgets
      );
    }
    return null;
  }

  padding(double padding) {
    return Padding(padding: EdgeInsets.only(top: padding, left: padding));
  }
}