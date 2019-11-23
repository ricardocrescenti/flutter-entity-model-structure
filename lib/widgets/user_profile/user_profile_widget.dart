import 'package:flutter/material.dart';
import 'package:user_structure/models/entity_model_pattern.dart';
import 'package:user_structure/user_structure.dart';

class UserProfileWidget extends StatelessWidget {
  final AvatarWidget avatar;
  final Widget name;
  final Widget message;

  UserProfileWidget({
    this.avatar,
    this.name,
    this.message
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        this.avatar,
        this.name,
        this.message
      ],
    );
  }

  static UserProfileWidget fromEntityModel(EntityModelPattern entity) {
    return UserProfileWidget(
      avatar: AvatarWidget(),
      name: Text(entity.name),
      message: Text(entity.message),
    );
  }
}