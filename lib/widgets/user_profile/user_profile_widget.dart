import 'dart:io';

import 'package:flutter/material.dart';
import 'package:user_structure/user_structure.dart';

class UserProfileWidget extends StatelessWidget {
  final String name;
  final dynamic photoUrl;
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
          Expanded(
            child: Column(
              children: _buildLeftWidgets(context),
            )
          ),
          AvatarWidget(
            size: 70,
            border: 1,
            avatar: this.photoUrl,
            onPhotoChange: onPhotoChangeTap,
          ),
          Expanded(
            child: Column(
              children: _buildRightWidgets(context),
            )
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Text(this.name ?? '', style: Theme.of(context).textTheme.headline6,),
      )
    ];

    if ((this.message != null && this.message.isNotEmpty) || (emptyMessage != null && emptyMessage.isNotEmpty)) {
      widgets.add(_buildMessageWidget(context));
    }

    // if (this.followersQuantity != null || this.followingsQuantity != null) {
    //   widgets.add(_buildFollowQuantity(context));
    // }

    if (this.imFollowing != null) {
      widgets.add(_buildFollow(context));
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: widgets
      ),
    );
  }

  _buildMessageWidget(BuildContext context) {
    return GestureDetector(
        onTap: onMessageTap,
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
              this.message ?? emptyMessage ?? '',
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
        ),
      );
  }
  
  _buildLeftWidgets(BuildContext context) {
    List<Widget> widgets = [];

    if (followersQuantity != null) {
      widgets.add(GestureDetector(
        child: InkWell(
          child: Column(
            children: <Widget>[
              Text(this.followersQuantity.toString(), style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 25),),
              Text('Seguidores', style: Theme.of(context).textTheme.bodyText1,)
            ],
          ),
        ),
        onTap: onFollowersTap,
      ));
    }

    return widgets;
  }
  _buildRightWidgets(BuildContext context) {
    List<Widget> widgets = [];

    if (followingsQuantity != null) {
      widgets.add(GestureDetector(
        child: InkWell(
          child: Column(
            children: <Widget>[
              Text(this.followingsQuantity.toString(), style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 25),),
              Text('Seguindo', style: Theme.of(context).textTheme.bodyText1,)
            ],
          ),
        ),
        onTap: onFollowingTap,
      ));
    }

    return widgets;
  }
  buildFollowQuantity(BuildContext context) {
    List<Widget> items = [];

    if (this.followersQuantity != null) {
      items.add(GestureDetector(
        child: InkWell(
          child: Column(
            children: <Widget>[
              Text(this.followersQuantity.toString(), style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 25),),
              Text('Seguidores', style: Theme.of(context).textTheme.bodyText1,)
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
                Text(this.followingsQuantity.toString(), style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 25),),
                Text('Seguindo', style: Theme.of(context).textTheme.bodyText1,)
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

  static UserProfileWidget fromUserModel(UserModelPattern user, {
    Future<bool> Function(File) onPhotoChangeTap,
    Function() onRatingTap,
    String emptyMessage, 
    Function() onMessageTap,
    Function() onFollowersTap,
    Function() onFollowingTap,
    Function() onFollowButtonTap
  }) {
    return UserProfileWidget(
      name: user.entity.name,
      photoUrl: user.entity.photo?.getPublicUrl(size: 300),
      onPhotoChangeTap: onPhotoChangeTap,
      onRatingTap: onRatingTap,
      message: user.message,
      emptyMessage: emptyMessage,
      onMessageTap: onMessageTap,
      //followersQuantity: entity.followersQuantity,
      onFollowersTap: onFollowersTap,
      //followingsQuantity: entity.followingsQuantity,
      onFollowingTap: onFollowingTap,
      //imFollowing: entity.imFollowing,
      onFollowTap: onFollowButtonTap
    );
  }
}