import 'package:flutter/material.dart';
import 'package:user_structure/user_structure.dart';

class AddressFormPage extends StatelessWidget {
  final AppBar appBar;
  final AddressForm addressForm;
  final Widget bottomNavigationBar;

  AddressFormPage({
    @required this.appBar,
    @required this.addressForm,
    this.bottomNavigationBar
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.appBar,
      body: addressForm,
      bottomNavigationBar: this.bottomNavigationBar,
    );
  }
}