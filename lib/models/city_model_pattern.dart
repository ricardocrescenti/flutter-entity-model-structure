class CityModel {
  String code;
  String name;
  String street;
  String complement;
  String neighborhood;
  String zipCode;
  String state;

  CityModel.fromViaCepJson(json) {
    this.code = json['ibge'];
    this.name = json['localidade'];
    this.street = json['logradouro'];
    this.complement = json['complemento'];
    this.neighborhood = json['bairro'];
    this.zipCode = json['cep'];
    this.state = json['uf'];
  }
  CityModel.fromIbgeJson(json) {
    this.code = json['id'].toString();
    this.name = json['nome'];
  }
}