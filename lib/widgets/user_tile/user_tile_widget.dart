import 'package:flutter/material.dart';
import 'package:user_structure/user_structure.dart';

class UserTileWidget extends StatelessWidget {
  final dynamic photo;
  final String name;
  final String message;
  final bool enabled;
  final Function() onLongPress;
  final Function() onTap;

  UserTileWidget({
    @required this.photo,
    @required this.name,
    this.message,
    this.enabled = true,
    this.onLongPress,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 60, maxHeight: 60),
        child: AvatarWidget(avatar: photo)),
      title: Text(name),
      subtitle: Text(message),
      enabled: enabled,
      onLongPress: onLongPress,
      onTap: onTap,);
  }

  static UserTileWidget fromEntity(EntityModelPattern entity, {bool enabled = true, Function() onLongPress, Function() onTap}) {
    return UserTileWidget(
      photo: entity.photo?.getPublicUrl(size: 150),
      name: entity.name,
      message: (entity.message ?? ''),
      enabled: enabled,
      onLongPress: onLongPress,
      onTap: onTap
    );
  }
}