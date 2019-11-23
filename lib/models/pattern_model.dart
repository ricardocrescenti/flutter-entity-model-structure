import 'dart:convert';

import 'package:flutter/cupertino.dart';

abstract class PatternModel {
  Map<String, dynamic> json;

  BigInt id;
  String uuid;  
  DateTime createdAt;
  DateTime updatedAt;

  getJsonValue<T>(String valueName, {T Function(dynamic value) convertion, T nullValue}) {
    if (this.json[valueName] != null) {
      if (convertion != null) {
        return convertion(this.json[valueName]);
      } else if (T is BigInt) {
        return BigInt.parse(this.json[valueName].toString());
      } else if (T is DateTime) {
        return DateTime.parse(this.json['created_at'].toString());
      }
      return this.json[valueName] as T;
    }
    return nullValue;
  }

  PatternModel.fromJson(dynamic json) {
    if (json is String) {
      this.json = jsonDecode(json);
    } else {
      this.json = json;
    }

    this.id = getJsonValue<BigInt>('id');
    this.uuid = getJsonValue<String>('uuid');
    this.createdAt = getJsonValue<DateTime>('created_at');
    this.updatedAt = getJsonValue<DateTime>('updated_at');
  }

  @mustCallSuper
  Map<String, dynamic> toJson() {
    Map map = Map<String, dynamic>();

    map['id'] = this.id;
    map['uuid'] = this.uuid;
    map['created_at'] = this.createdAt;
    map['updated_at'] = this.updatedAt;

    return map;
  }
}