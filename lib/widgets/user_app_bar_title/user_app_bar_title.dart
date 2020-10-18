import 'package:flutter/material.dart';
import 'package:entity_model_structure/entity_model_structure.dart';

class UserAppBarTitle extends StatelessWidget {
  final Widget title;
  final dynamic photo;
  final String name;

  UserAppBarTitle({
    @required this.title,
    @required this.photo,
    @required this.name,
  }) {
    assert(title != null);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: AvatarWidget(avatar: this.photo, size: 20)
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title,
            (name != null ? Text(this.name, style: Theme.of(context).textTheme.subtitle2) : Container())
          ],
        ),
      ]
    );
  }

  static UserAppBarTitle fromUserModel({ @required Widget title, @required UserModelPattern user }) {
    return UserAppBarTitle(
      title: title,
      photo: user.entity.photo?.getPublicUrl(size: 75),
      name: user.entity.name);
  }
}