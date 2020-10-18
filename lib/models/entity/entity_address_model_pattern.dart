import 'package:basic_model_structure/basic_model_structure.dart';
import 'package:user_structure/models/locality/city_model_pattern.dart';

abstract class EntityAddressModelPattern<CityModel extends CityModelPattern> extends PatternModel {
  String description;
  String contact;
  String street;
  String number;
  String neighborhood;
  String complement;
  String reference;
  CityModel city;
  String zipCode;
  bool isDefault;
  String coordinate;

  EntityAddressModelPattern() : super();
  EntityAddressModelPattern.fromJson(json) : super.fromJson(json);

  CityModel createCityModel(dynamic json);

  @override
  void readValues() {
    super.readValues();
    description = readValue<String>('description');
    contact = readValue<String>('contact');
    street = readValue<String>('street');
    number = readValue<String>('number');
    neighborhood = readValue<String>('neighborhood');
    complement = readValue<String>('complement');
    reference = readValue<String>('reference');
    city = readValue<CityModel>('state', convertion: (json) => createCityModel(json));
    zipCode = readValue<String>('zip_code');
    isDefault = readValue<bool>('isDefault');
    coordinate = readValue<String>('coordinate');
  }

  @override
  void writeValues(bool exportOnlyChanged, bool ignoreNulls) {
    writeValue('description', description);
    writeValue('contact', contact);
    writeValue('street', street);
    writeValue('number', number);
    writeValue('neighborhood', neighborhood);
    writeValue('complement', complement);
    writeValue('reference', reference);
    writeValue('city', city?.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls), ignoreNull: true);
    writeValue('zipCode', zipCode);
    writeValue('isDefault', isDefault);
    writeValue('coordinate', coordinate);
  }
}