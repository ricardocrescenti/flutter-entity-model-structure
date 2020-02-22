import 'dart:io';

import 'package:flutter/material.dart';
import 'package:user_structure/models/entity_model_pattern.dart';
import 'package:user_structure/user_structure.dart';

class UserProfileWidget extends StatelessWidget {
  final String name;
  final String photoUrl;
  final Future<bool> Function(File) onPhotoChangeTap;
  final Function() onRatingTap;
  final String message;
  final String emptyMessage;
  final Function() onMessageTap;
  final int followersQuantity;
  final Function() onFollowersTap;
  final int followingsQuantity;
  final Function() onFollowingTap;
  final bool imFollowing;
  final Function() onFollowTap;

  UserProfileWidget({
    @required this.name,
    @required this.photoUrl,
    this.onPhotoChangeTap,
    this.onRatingTap,
    this.message,
    this.emptyMessage, 
    this.onMessageTap,
    this.followersQuantity,
    this.onFollowersTap,
    this.followingsQuantity,
    this.onFollowingTap,
    this.imFollowing,
    this.onFollowTap
  }) {
    assert(this.name != null);
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
            avatar: this.photoUrl,
            onPhotoChange: onPhotoChangeTap,
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Text(this.name ?? '', style: Theme.of(context).textTheme.title,),
      )
    ];

    if ((this.message != null && this.message.isNotEmpty) || (emptyMessage != null && emptyMessage.isNotEmpty)) {
      widgets.add(_buildMessageWidget(context));
    }

    if (this.followersQuantity != null || this.followingsQuantity != null) {
      widgets.add(_buildFollowQuantity(context));
    }

    if (this.imFollowing != null) {
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
              this.message ?? emptyMessage ?? '',
              style: Theme.of(context).textTheme.subtitle,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
        ),
      );
  }
  _buildFollowQuantity(BuildContext context) {
    List<Widget> items = [];

    if (this.followersQuantity != null) {
      items.add(GestureDetector(
        child: InkWell(
          child: Column(
            children: <Widget>[
              Text(this.followersQuantity.toString(), style: Theme.of(context).textTheme.body2.copyWith(fontSize: 25),),
              Text('Seguidores', style: Theme.of(context).textTheme.body2,)
            ],
          ),
        ),
        onTap: onFollowersTap,
      ));
    }

      if (this.followingsQuantity != null) {
        items.add(GestureDetector(
          child: InkWell(
            child: Column(
              children: <Widget>[
                Text(this.followingsQuantity.toString(), style: Theme.of(context).textTheme.body2.copyWith(fontSize: 25),),
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
                Icon(this.imFollowing ? Icons.check : Icons.add),
                Padding(padding: EdgeInsets.all(2),),
                Text(this.imFollowing ? 'Seguindo' : 'Seguir')
              ],
            ),
            onPressed: onFollowTap,
            color: Colors.lightGreen,
            disabledColor: Colors.lightGreen,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          ),

        ],
      ),
    );
  }

  static UserProfileWidget fromEntity(EntityModelPattern entity, {
    Future<bool> Function(File) onPhotoChangeTap,
    Function() onRatingTap,
    String emptyMessage, 
    Function() onMessageTap,
    Function() onFollowersTap,
    Function() onFollowingTap,
    Function() onFollowButtonTap
  }) {
    return UserProfileWidget(
      name: entity.name,
      photoUrl: entity?.photo?.publicUrl,
      onPhotoChangeTap: onPhotoChangeTap,
      onRatingTap: onRatingTap,
      emptyMessage: emptyMessage,
      onFollowersTap: onFollowersTap,
      onFollowingTap: onFollowingTap,
      onFollowTap: onFollowButtonTap
    );
  }
}