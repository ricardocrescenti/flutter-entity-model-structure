import 'dart:io';

import 'package:flutter/material.dart';
import 'package:user_structure/models/entity_model_pattern.dart';
import 'package:user_structure/user_structure.dart';

class UserProfileWidget extends StatelessWidget {
  final EntityModelPattern entity;
  final Future<bool> Function(File) onPhotoChangeTap;
  final Function() onRatingTap;
  final String emptyMessage;
  final Function() onMessageTap;
  final Function() onFollowersTap;
  final Function() onFollowingTap;
  final Function() onFollowButtonTap;

  UserProfileWidget(this.entity, {
    this.onPhotoChangeTap,
    this.onRatingTap,
    this.emptyMessage, 
    this.onMessageTap,
    this.onFollowersTap,
    this.onFollowingTap,
    this.onFollowButtonTap
  }) {
    assert(entity != null);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AvatarWidget(
            size: 90,
            border: 1,
            onPhotoChange: onPhotoChangeTap,
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Text(this.entity.name ?? '', style: Theme.of(context).textTheme.title,),
      )
    ];

    if ((entity.message != null && entity.message.isNotEmpty) || (emptyMessage != null && emptyMessage.isNotEmpty)) {
      widgets.add(_buildMessageWidget(context));
    }

    if (entity.followersQuantity != null || entity.followingsQuantity != null) {
      widgets.add(_buildFollowQuantity(context));
    }

    if (entity.imFollowing != null) {
      widgets.add(_buildFollow(context));
    }

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: widgets
      ),
    );
  }

  _buildMessageWidget(BuildContext context) {
    return GestureDetector(
        onTap: onMessageTap,
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 15, 40, 10),
          child: Text(
              entity.message ?? emptyMessage ?? '',
              style: Theme.of(context).textTheme.subtitle,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
        ),
      );
  }
  _buildFollowQuantity(BuildContext context) {
    List<Widget> items = [];

    if (entity.followersQuantity != null) {
      items.add(GestureDetector(
        child: InkWell(
          child: Column(
            children: <Widget>[
              Text(entity.followersQuantity.toString(), style: Theme.of(context).textTheme.body2.copyWith(fontSize: 25),),
              Text('Seguidores', style: Theme.of(context).textTheme.body2,)
            ],
          ),
        ),
        onTap: onFollowersTap,
      ));
    }

      if (entity.followingsQuantity != null) {
        items.add(GestureDetector(
          child: InkWell(
            child: Column(
              children: <Widget>[
                Text(entity.followingsQuantity.toString(), style: Theme.of(context).textTheme.body2.copyWith(fontSize: 25),),
                Text('Seguindo', style: Theme.of(context).textTheme.body2,)
              ],
            ),
          ),
          onTap: onFollowingTap,
        ));
      }

      return Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items,
        )
      );
  }
  _buildFollow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          RaisedButton(
            child: Row(
              children: <Widget>[
                Icon(entity.imFollowing ? Icons.check : Icons.add),
                Padding(padding: EdgeInsets.all(2),),
                Text(entity.imFollowing ? 'Seguindo' : 'Seguir')
              ],
            ),
            onPressed: onFollowButtonTap,
            color: Colors.lightGreen,
            disabledColor: Colors.lightGreen,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          ),

        ],
      ),
    );
  }
}