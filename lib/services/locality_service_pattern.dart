import 'package:dio/dio.dart';
import 'package:simple_app/simple_app.dart';
import 'package:user_structure/user_structure.dart';

class LocalityServicePattern extends Service {
  final Map<String, String> brazilStatesCode = {
    'RO': '11',
    'AC': '12',
    'AM': '13',
    'RR': '14',
    'PA': '15',
    'AP': '16',
    'TO': '17',
    'MA': '21',
    'PI': '22',
    'CE': '23',
    'RN': '24',
    'PB': '25',
    'PE': '26',
    'AL': '27',
    'SE': '28',
    'BA': '29',
    'MG': '31',
    'ES': '32',
    'RJ': '33',
    'SP': '35',
    'PR': '41',
    'SC': '42',
    'RS': '43',
    'MS': '50',
    'MT': '51',
    'GO': '52',
    'DF': '53',
  };

  LocalityServicePattern(Module module) : super(module);
  
  Future<CityModel> getCity(String country, String zipCode) async {
    if (country == 'BRA') {
      zipCode = zipCode.replaceAll('.', '').replaceAll('-', '').replaceAll('_', '');
      Response response = await Dio().get('https://viacep.com.br/ws/$zipCode/json');
      CityModel city = (response.data['erro'] != null ? null : CityModel.fromViaCepJson(response.data));
      return city;
    }

    throw UnimplementedError('City query for country "$country" is not implemented');
  }

  Future<List<CityModel>> getCities(String country, String state) async {
    if (country == 'BRA') {
      Response response = await Dio().get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/${brazilStatesCode[state]}/municipios');
      dynamic teste = response.data.map((city) => CityModel.fromIbgeJson(city));
      List<CityModel> cities = teste.toList().cast<CityModel>();
      return cities;
    }
    
    throw UnimplementedError('City query for country "$country" is not implemented');
  }

}