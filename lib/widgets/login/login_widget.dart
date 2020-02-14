import 'package:flutter/material.dart';
import 'package:simple_form/simple_form.dart';
import 'package:user_structure/localizations/user_structure_localization.dart';
import 'package:user_structure/user_structure.dart';

class LoginWidget extends StatefulWidget {
  final Widget logo;
  final Widget title;
  final String userNameFieldText;
  final String passwordFieldText;
  final String registerText;
  final String forgetPasswordText;
  final String orSignWithText;
  final Function(BuildContext context) onLoginClick;
  final Function(BuildContext context) onForgetPasswordClick;
  final Function(BuildContext context) onRegisterClick;
  final List<Widget> socialLoginButtons;
  final EdgeInsetsGeometry padding;

  LoginWidget({
    this.logo,
    this.title,
    this.userNameFieldText,
    this.passwordFieldText,
    this.registerText,
    this.forgetPasswordText,
    this.orSignWithText,
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

  UserStructureLocalization localization;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.localization = UserStructureLocalization.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBackground(),
          _buildScreen(context),
        ]
      )
    );
  }

  _buildBackground() {
    return Container();
  }

  _buildScreen(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
      padding: widget.padding,
      child: Column(
        children: [
          _buildLogo(),
          _buildTitle(),
          _buildForm(context),
          _buildSocialLoginButtons(context)
        ].where((item) => item != null).toList().cast<Widget>(),
      ),
    ));
  }

  _buildLogo() {
    if (widget.logo != null) {
      return widget.logo;
    }
    return null;
  }
  _buildTitle() {
    if (widget.title != null) {
      return widget.title;
    }
    return null;
  }
  _buildForm(BuildContext context) {
    return SimpleForm(
      key: formState,
      initialValues: formValue,
      onChange: (fieldNane, newValue) => formValue[fieldNane] = newValue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: SimpleTextField(
              fieldName: 'username', 
              title: widget.userNameFieldText ?? localization[LoginWidgetMessages.userNameFieldText], 
              textCapitalization: TextCapitalization.none, 
              inputDecoration: InputDecoration(
                labelText: widget.userNameFieldText ?? localization[LoginWidgetMessages.userNameFieldText],
                prefixIcon: Icon(Icons.person)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: SimpleTextField(
              fieldName: 'password', 
              title: widget.passwordFieldText ?? localization[LoginWidgetMessages.passwordFieldText], 
              textCapitalization: TextCapitalization.none, 
              obscureText: true,
              inputDecoration: InputDecoration(
                labelText: widget.passwordFieldText ?? localization[LoginWidgetMessages.passwordFieldText],
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
                  child: Text(widget.registerText ?? localization[LoginWidgetMessages.registerText]),
                  onPressed: () => widget.onRegisterClick(context),
                )
                : null),
              (widget.onForgetPasswordClick != null
                ? FlatButton(
                  child: Text(widget.forgetPasswordText ?? localization[LoginWidgetMessages.forgetPasswordText]),
                  onPressed: () => widget.onForgetPasswordClick(context),
                )
                : null)
            ].where((item) => item != null).toList().cast<Widget>()
          )
        ],
      ),
    );
  }
  _buildSocialLoginButtons(BuildContext context) {
    if (widget.socialLoginButtons != null && widget.socialLoginButtons.length > 0) {
      List<Widget> widgets = [
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(widget.orSignWithText ?? localization[LoginWidgetMessages.orSignWithText]),
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