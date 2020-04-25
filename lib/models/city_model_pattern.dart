class CityModel {
  String code;
  String name;
  String zipCode;
  String state;

  CityModel.fromViaCepJson(json) {
    this.code = json['ibge'];
    this.name = json['localidade'];
    this.zipCode = json['cep'];
    this.state = json['uf'];
  }
  CityModel.fromIbgeJson(json) {
    this.code = json['id'].toString();
    this.name = json['nome'];
  }
}