import 'package:basic_model_structure/basic_model_structure.dart';

class CityModelPattern extends PatternModel {
	String code;
  	String name;
  	String state;
  	String country;

	CityModelPattern.fromJson(json) : super.fromJson(json);

	@override
	void updateValues(Map<String, dynamic> map) {
		super.updateValues(map);
		code = readValue<String>('code');
		name = readValue<String>('name');
		state = readValue<String>('state');
		country = readValue<String>('country');
	}

	@override
	void writeValues(bool exportOnlyChanged, bool ignoreNulls) {
		writeValue('code', code);
		writeValue('name', name);
		writeValue('state', state);
		writeValue('country', country);
	}
}