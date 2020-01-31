import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AvatarWidget extends StatelessWidget {
  final double size;
  final double border;
  final Color borderColor;
  final dynamic avatar;
  final Widget emptyWidget;
  final Function(File) onPhotoChange;

  AvatarWidget({
    Key key, 
    this.size = 70,
    this.border = 0,
    this.borderColor,
    this.avatar,
    this.emptyWidget,
    this.onPhotoChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        _buildAvatarWidget(context),
        _buildChangeAvatarButton(),
      ],
    );
  }
  
  _buildAvatarWidget(BuildContext context) {
    return CircleAvatar(
      radius: this.size,
      backgroundColor: (this.borderColor == null ? Theme.of(context).dividerColor : this.borderColor),
      child: CircleAvatar(
        radius: (this.size - this.border),
        child: ClipOval(
          child: _getImage(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
  _buildChangeAvatarButton() {
    if (this.onPhotoChange == null) {
      return Container();
    }
    
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 14,
          backgroundColor: Colors.white,
          child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.camera_alt),
            iconSize: 20,
            autofocus: false,
            onPressed: _changeImage,
          ),
        )
      ],
    );
  }
  
  _getImage() {
    if (avatar == null) {
      if (this.emptyWidget == null) {
        return Icon(Icons.person, size: this.size * 1.5,);
      }
    
      return this.emptyWidget;
    }
    
    if (avatar is File) {
      return Image.file(avatar as File);
    } else if (avatar is CachedNetworkImage) {
      return avatar;
    } else if (avatar is String && (avatar as String).isNotEmpty) {
      
      return CachedNetworkImage(imageUrl: avatar,);
    }
  }

  _changeImage() async {
    File originalFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (originalFile == null) {
      return;
    }

    File croppedImage = await _cropImage(originalFile);
    if (croppedImage == null) {
      return;
    }
    
    this.onPhotoChange(croppedImage); 
  }
  _cropImage(File imageFile) async {
    return ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(
        ratioX: 1.0,
        ratioY: 1.0,
      ),
      maxWidth: 512,
      maxHeight: 512,
    );
  }
}