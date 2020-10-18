import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:useful_widgets/widgets/future/future_widget.dart';

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
          child: FutureWidget<Widget>(
            load: (context) => _getImage(context), 
            awaitWidget: (context) => CircularProgressIndicator(),
            builder: (context, result) => result),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
  _buildChangeAvatarButton() {
    if (this.onPhotoChange == null) {
      return Container();
    }
    
    return Padding(
      padding: EdgeInsets.only(right: 8, bottom: 8),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 15,
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
      ),
    );
  }
  
  Future<Widget> _getImage(BuildContext context) async {
    dynamic result = (avatar != null && avatar is Future<dynamic> ? await avatar : avatar);

    if (result == null || result.toString().length == 0) {
      if (this.emptyWidget == null) {
        return FittedBox(fit: BoxFit.fill, child: Icon(Icons.person, size: MediaQuery.of(context).size.height,));
      }
      return this.emptyWidget;
    }
    
    if (result is File) {
      return Image.file(result, width: double.infinity, height: double.infinity, fit: BoxFit.cover);
    } else if (result is String && (result).isNotEmpty) {
      return CachedNetworkImage(imageUrl: result, width: double.infinity, height: double.infinity, fit: BoxFit.cover);
    }

    return Text('Invalid type');
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
    );
  }
}