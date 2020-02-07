import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageUploaderManager {
  StorageReference _storageReference;
  String _destinationFolder;
  
  File _file;
  File get file => _file;

  StorageUploadTask _storageUploadTask;
  StorageUploadTask get storageUploadTask => _storageUploadTask;

  StorageTaskSnapshot get storageTaskSnapshot => (_storageUploadTask != null ? _storageUploadTask.lastSnapshot : null);
  StorageReference get storageReference => (_storageUploadTask != null ? _storageUploadTask.lastSnapshot.ref : null);
  
  File downloadedPhotoFile;

  StorageUploaderManager(StorageReference storageReference, String destinationFolder) {
    _storageReference = storageReference;
    _destinationFolder = destinationFolder;
  }

  Future<StorageUploadTask> uploadFile(File file, String fileName, {Function(StorageTaskSnapshot snapshot) onComplete}) async {
    _file = null;
    await deleteUploadedFile();

    _file = file;
    _storageUploadTask = _storageReference.child('$_destinationFolder/$fileName').putFile(_file);
    _storageUploadTask.onComplete.then((StorageTaskSnapshot snapshot) {
      onComplete(snapshot);
    });
    return _storageUploadTask;
  }
  
  waitUploadFile() async {
    if (_storageUploadTask != null) {
      
      if (_storageUploadTask.isComplete || _storageUploadTask.isSuccessful) {
        return true;
      } else {
        await _storageUploadTask.onComplete;
        return waitUploadFile();
      }

    } else {
      return true;
    }
  }

  deleteUploadedFile() async {
    if (_storageUploadTask != null) {

      StorageTaskSnapshot storageTaskSnapshot = _storageUploadTask.lastSnapshot;
      if (storageTaskSnapshot.bytesTransferred < storageTaskSnapshot.totalByteCount) {
        _storageUploadTask.cancel();
      } else {
        await _storageReference.child(_storageUploadTask.lastSnapshot.storageMetadata.path).delete();
      }

      _storageUploadTask = null;
    }
  }
}