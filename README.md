# user_structure

A new Flutter package project.

## AvatarWidget

This widget use [image_cropper](https://pub.dev/packages/image_cropper) and [image_picker](https://pub.dev/packages/image_picker) packages to open and crop image, to allow photos changed, pass the `onPhotoChange` parameter.

If you need to use this feature, you will need to edit the following files.

### Android

File: `android/app/src/main/AndroidManifest.xml`<br/>
Add following lines inside the `<application>` tag.

```xml
<activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
```

### iOS

File: `ios/Runner/Info.plist`<br/>
Add following lines inside the `<dict>` tag.

```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>Example usage description</string>
<key>NSCameraUsageDescription</key>
<string>Example usage description</string>
```

## LoginWidget


## SignUpWidget
