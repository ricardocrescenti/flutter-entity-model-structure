import 'dart:convert';

import 'package:flutter/cupertino.dart';

abstract class PatternModel {
  Map<String, dynamic> json;

  //BigInt id;
  String uuid;
  DateTime createdAt;
  DateTime updatedAt;

  getJsonValue<T>(String valueName, {T Function(dynamic value) convertion, T nullValue}) {
    if (this.json[valueName] != null) {
      if (convertion != null) {
        return convertion(this.json[valueName]);
      } else if (T == BigInt) {
        return BigInt.parse(this.json[valueName].toString());
      } else if (T == DateTime) {
        if (!(this.json[valueName] is DateTime)) {
          return DateTime.parse(this.json[valueName].toString());
        }
      }
      return this.json[valueName] as T;
    }
    return nullValue;
  }
  setJsonValue(Map map, String valueName, dynamic value, {bool onlyNotNull = false}) {
    if (onlyNotNull && value == null) {
      return;
    }
    map[valueName] = value;
  }

  @protected
  Map<String, dynamic> filterMap(Map<String, dynamic> map, Iterable<String> filterFields) {
    if (filterFields == null || filterFields.length == 0) {
      return map;
    }
    map.removeWhere((key, value) => (!filterFields.contains(key)));
    return map;
  }

  PatternModel.fromJson(dynamic json) {
    if (json is String) {
      this.json = jsonDecode(json);
    } else {
      this.json = json;
    }

    //this.id = getJsonValue<BigInt>('id');
    this.uuid = getJsonValue<String>('uuid');
    this.createdAt = getJsonValue<DateTime>('created_at');
    this.updatedAt = getJsonValue<DateTime>('updated_at');
  }

  @mustCallSuper
  Map<String, dynamic> toJson() {
    Map map = Map<String, dynamic>();

    //setJsonValue(map, 'id', this.id, onlyNotNull: true);
    setJsonValue(map, 'uuid', this.uuid, onlyNotNull: true);
    //map['created_at'] = this.createdAt;
    //map['updated_at'] = this.updatedAt;

    return map;
  }
}