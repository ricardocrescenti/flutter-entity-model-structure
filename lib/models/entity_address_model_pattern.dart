import 'package:basic_structure/basic_structure.dart';

class EntityAddressModelPattern extends PatternModel {
  String contact;
  String street;
  String number;
  String neighborhood;
  String complement;
  String cityName;
  String cityCode;
  String zipCode;
  String state;
  String country;

  EntityAddressModelPattern.fromJson(json) : super.fromJson(json) {
    this.contact = getJsonValue<String>('contact');
    this.street = getJsonValue<String>('street');
    this.number = getJsonValue<String>('number');
    this.neighborhood = getJsonValue<String>('neighborhood');
    this.complement = getJsonValue<String>('complement');
    this.cityName = getJsonValue<String>('city_name');
    this.cityCode = getJsonValue<String>('city_code');
    this.zipCode = getJsonValue<String>('zip_code');
    this.state = getJsonValue<String>('state');
    this.country = getJsonValue<String>('country');
  }

  @override
  Map<String, dynamic> toJson({bool exportOnlyJsonFields = false}) {
    Map<String, dynamic> map = super.toJson();

    setJsonValue(map, 'contact', this.contact);
    setJsonValue(map, 'street', this.street);
    setJsonValue(map, 'number', this.number);
    setJsonValue(map, 'neighborhood', this.neighborhood);
    setJsonValue(map, 'complement', this.complement);
    setJsonValue(map, 'city_name', this.cityName);
    setJsonValue(map, 'city_code', this.cityCode);
    setJsonValue(map, 'zip_code', this.zipCode);
    setJsonValue(map, 'state', this.state);
    setJsonValue(map, 'country', this.country);
    
    return filterMap(map, (exportOnlyJsonFields ? json.keys : null));
  }

}