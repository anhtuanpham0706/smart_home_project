


import '../util/until.dart';

class UsersModel {
  final List<UserModel> list = [];
  UsersModel fromJson(json) {
    if (json.isNotEmpty)
      json.forEach((ele) => list.add(UserModel().fromJson(ele)));
    return this;
  }
}

class UserModel {
  int id, district_id, city_id;
  String name, phone, email, address, company, default_address, image, gender, birthdate,
      token_user, key_login, password, city, district;

  UserModel({
    this.id = -1,
    this.name = '',
    this.phone = '',
    this.email = '',
    this.address = '',
    this.company = '',
    this.default_address = '',
    this.image = '',
    this.gender = '',
    this.birthdate = '',
    this.token_user = '',
    this.key_login = '',
    this.password = '',
    this.city = '',
    this.city_id = -1,
    this.district = '',
    this.district_id = -1
  });

  void copy(UserModel user) {
    id = user.id;
    name = user.name;
    phone = user.phone;
    birthdate = user.birthdate;
    image = user.image;
    address = user.address;
    city = user.city;
    city_id = user.city_id;
    district = user.district;
    district_id = user.district_id;
  }

  // void copyFromAddress(AddressModel address) {
  //   name = address.name;
  //   phone = address.phone;
  //   birthdate = address.birthdate;
  //   this.address = address.address;
  //   city = address.city;
  //   city_id = address.city_id;
  //   district = address.district;
  //   district_id = address.district_id;
  // }

  UserModel fromJson(Map<String, dynamic> json) {
    try {
      id = Util.getValueFromJson(json, 'id', -1);
      city_id = Util.getValueFromJson(json, 'city_id', -1);
      district_id = Util.getValueFromJson(json, 'district_id', -1);
      name = Util.getValueFromJson(json, 'name', '');
      phone = Util.getValueFromJson(json, 'phone', '');
      email = Util.getValueFromJson(json, 'email', '');
      address = Util.getValueFromJson(json, 'address', '');
      company = Util.getValueFromJson(json, 'company', '');
      default_address = Util.getValueFromJson(json, 'default_address', '');
      image = Util.getValueFromJson(json, 'image', '');
      gender = Util.getValueFromJson(json, 'gender', '');
      birthdate = Util.getValueFromJson(json, 'birthdate', '');
      token_user = Util.getValueFromJson(json, 'token_user', '');
      city = Util.getValueFromJson(json, 'city', '');
      district = Util.getValueFromJson(json, 'district', '');
    } catch (_) {}
    return this;
  }
}