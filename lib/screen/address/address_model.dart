
import 'package:project_flutter2/component/util/until.dart';

class AddressesModel {
  final List<AddressModel> list = [];
  AddressesModel fromJson(json) {
    if (json.isNotEmpty)
      json.forEach((ele) => list.add(AddressModel().fromJson(ele)));
    return this;
  }
}

class AddressModel {
  int city_id, district_id, id;
  String name, phone, birthdate, address, city, district;
  bool select, isDefault;

  AddressModel({this.name = '', this.phone = '', this.address = '', this.city = '',
    this.district = '', this.select = false, this.isDefault = false, this.city_id = -1,
    this.district_id = -1, this.id = -1, this.birthdate = ''});

  AddressModel fromJson(Map<String, dynamic> json) {
    try {
      name = Util.getValueFromJson(json, 'name', '');
      phone = Util.getValueFromJson(json, 'phone', '');
      birthdate = Util.getValueFromJson(json, 'birthdate', '');
      address = Util.getValueFromJson(json, 'address', '');
      city = Util.getValueFromJson(json, 'city_name', '');
      district = Util.getValueFromJson(json, 'district_name', '');
      city_id = Util.getValueFromJson(json, 'city_id', -1);
      district_id = Util.getValueFromJson(json, 'district_id', -1);
      id = Util.getValueFromJson(json, 'id', -1);
      //select = Util.getValueFromJson(json, 'kind_address', '') == 'default';
      isDefault = Util.getValueFromJson(json, 'isDefault', false);
    }
    catch (_) {}
    return this;
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "birthdate": birthdate,
    "address": address,
    "city_name": city,
    "city_id": city_id,
    "district_name": district,
    "district_id": district_id,
    "select": select,
    "isDefault": isDefault,
    "id": id
  };

  void copy(AddressModel value, {bool saveSelect = true}) {
    name = value.name;
    phone = value.phone;
    birthdate = value.birthdate;
    address = value.address;
    id = value.id;
    city = value.city;
    city_id = value.city_id;
    district = value.district;
    district_id = value.district_id;
    isDefault = value.isDefault;
    if (saveSelect) select = value.select;
  }
}
