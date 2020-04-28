class CityModel {
  String code;
  String name;
  String street;
  String complement;
  String neighborhood;
  String zipCode;
  String state;

  CityModel.fromViaCepJson(json) {
    code = json['ibge'];
    name = json['localidade'];
    street = json['logradouro'];
    complement = json['complemento'];
    neighborhood = json['bairro'];
    zipCode = json['cep'];
    state = json['uf'];
  }
  CityModel.fromIbgeJson(json) {
    code = json['id'].toString();
    name = json['nome'];
  }
}