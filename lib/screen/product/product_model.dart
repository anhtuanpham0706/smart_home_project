import 'package:project_flutter2/component/util/until.dart';
import 'package:project_flutter2/screen/order/order_model.dart';

class ListProductModel {
  final List<ProductModel> list = [];

  ListProductModel fromJson(data) {
    if (data != null && data.isNotEmpty)
      data.forEach((ele) => list.add(ProductModel().fromJson(ele)));
    return this;
  }
}

class ProductModel {
  int id, tax_id;
  int is_home;
  String title;
  String sku;
  String image;
  String description;
  int catalogue_id;
  int quantity;
  int weight;
  int qty_buy;
  double price;
  double last_price;
  late List<Attribute> product_attributes;
  late Map<String, Combine> combine_attributes;
  dynamic callback;
  late List<String> albums;
  bool is_favorite;

  ProductModel(
      {this.id = -1, this.tax_id = -1,
      this.is_home = 0,
      this.sku = '',
      this.title = '',
      this.image = '',
      this.description = '',
      this.catalogue_id = -1,
      this.quantity = 0,
      this.weight = 0,
      this.qty_buy = 1,
      this.price = 0.0,
      this.last_price = 0.0,
      this.is_favorite = false}) {
    product_attributes = [];
    combine_attributes = {};
    albums = [];
  }

  void clear() {
    product_attributes.clear();
    combine_attributes.clear();
    albums.clear();
  }

  void setValues(ProductModel product) {
    if (product_attributes.isEmpty && product.product_attributes.isNotEmpty)
      product_attributes.addAll(product.product_attributes);
    if (product.combine_attributes.isNotEmpty)
      combine_attributes.addAll(product.combine_attributes);

    quantity = product.quantity;
    if (description.isEmpty) description = product.description;
    if (albums.isEmpty && product.albums.isNotEmpty) albums.addAll(product.albums);

    is_home = product.is_home;
    sku = product.sku;
    title = product.title;
    image = product.image;
    catalogue_id = product.catalogue_id;
    weight = product.weight;
    qty_buy = product.qty_buy;
    price = product.price;
    last_price = product.last_price;
    tax_id = product.tax_id;
    is_favorite = product.is_favorite;
  }

  ProductModel fromJson(Map<String, dynamic> json) {
    try {
      id = Util.getValueFromJson(json, 'id', -1);
      tax_id = Util.getValueFromJson(json, 'tax_id', -1);
      is_home = Util.getValueFromJson(json, 'is_home', 0);
      sku = Util.getValueFromJson(json, 'sku', '');
      title = Util.getValueFromJson(json, 'title', '');
      image = Util.getValueFromJson(json, 'image', '');
      description = Util.getValueFromJson(json, 'description', '');
      catalogue_id = Util.getValueFromJson(json, 'catalogue_id', -1);
      quantity = Util.getValueFromJson(json, 'quantity', 0);
      weight = Util.getValueFromJson(json, 'weight', 0);
      //qty_buy = Util.getValueFromJson(json, 'qty_buy', 0);
      price = Util.getValueFromJson(json, 'price', 0.0);
      last_price = Util.getValueFromJson(json, 'last_price', 0.0);
      is_favorite = Util.getValueFromJson(json, 'is_favorite', false);
      if (Util.checkKeyFromJson(json, 'image_album'))
        json['image_album'].entries.forEach((ele) {
          if (ele.value['img'].length > 0) albums.add(ele.value['img']);
        });
      if (image.isNotEmpty) albums.insert(0, image);

      // if (Util.checkKeyFromJson(json, 'product_attributes')) {
      //   json['product_attributes'].forEach((ele) {
      //     final attr = Attribute().fromJson(ele);
      //     if (attr.children_attributes!.isNotEmpty)
      //       if (attr.type == attr.combine)
      //         product_attributes.insert(0, attr);
      //       else product_attributes.add(attr);
      //   });
      // }

      // if (Util.checkKeyFromJson(json, 'combine_attributes'))
      //   json['combine_attributes'].forEach((ele) {
      //     final combine = Combine().fromJson(ele);
      //     if (combine.value.isNotEmpty)
      //       combine_attributes.putIfAbsent(combine.keyId, () => combine);
      //   });
    } catch (_) {}
    return this;
  }

  ProductOrder convertTo() {
    final ProductOrder temp = ProductOrder();
    temp.title = title;
    temp.image = image;
    temp.sku = sku;
    temp.id = id;
    temp.totalPrice = last_price;
    return temp;
  }
}

class Attribute {
  final int single = 1, combine = 0;
  int id, type;
  String name;
  List<ValueAttribute>? children_attributes;

  Attribute({this.id = -1, this.name = '', this.type = 1, this.children_attributes}) {
    children_attributes ??= [];
  }

  Attribute fromJson(Map<String, dynamic> json) {
    try {
      id = Util.getValueFromJson(json, 'id', -1);
      name = Util.getValueFromJson(json, 'name', '');
      type = Util.getValueFromJson(json, 'is_request', single);
      if (Util.checkKeyFromJson(json, 'children_attributes')) {
        json['children_attributes'].forEach((ele) =>
            children_attributes!.add(ValueAttribute().fromJson(ele)));
        if (type == combine && children_attributes!.isNotEmpty) children_attributes![0].selected = true;
      }
    } catch (_) {}
    return this;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_request": type,
    "children_attributes": children_attributes
  };
}

class ValueAttribute {
  int id;
  String name, image;
  double price, last_price;
  bool selected;

  ValueAttribute({this.id = -1, this.name = '', this.image = '', this.price = 0.0, this.last_price = 0.0, this.selected = false});

  ValueAttribute fromJson(Map<String, dynamic> json) {
    try {
      id = Util.getValueFromJson(json, 'id', -1);
      name = Util.getValueFromJson(json, 'name', '');
      image = Util.getValueFromJson(json, 'image', '');
      price = Util.getValueFromJson(json, 'price', 0.0);
      last_price = Util.getValueFromJson(json, 'last_price', 0.0);
    } catch (_) {}
    return this;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "last_price": last_price,
  };
}

class Combine {
  String image = '', keyId = '';
  int quantity = 0;
  double price = 0.0;
  List<int> value = [];
  Combine fromJson(json) {
    try {
      image = Util.getValueFromJson(json, 'image', '');
      price = Util.getValueFromJson(json, 'price', 0.0);
      quantity = Util.getValueFromJson(json, 'quantity', 0);
      if (Util.checkKeyFromJson(json, 'value'))
        json['value'].forEach((ele) =>
            value.add(int.parse(Util.getValueFromJson(ele, 'value', '-1'))));
      value.sort((a, b) => a.compareTo(b));
      for (var ele in value) {
        keyId += ele.toString();
      }
    }
    catch (_) {}
    return this;
  }
}