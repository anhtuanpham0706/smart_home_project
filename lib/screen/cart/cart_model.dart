import 'package:project_flutter2/component/util/until.dart';
import 'package:project_flutter2/screen/order/order_model.dart';
import 'package:project_flutter2/screen/product/product_model.dart';


class CartModel {
  int id, tax_id;
  String sku;
  String name;
  String subName;
  String image;
  int qty;
  int weight;
  double price;
  double last_price;
  List<Attribute>? product_attributes;

  CartModel(
      {this.id = -1, this.tax_id = -1,
      this.sku = '',
      this.name = '',
      this.subName = '',
      this.image = '',
      this.qty = 0,
      this.weight = 0,
      this.price = 0.0,
      this.last_price = 0.0, this.product_attributes}) {
    product_attributes ??= [];
  }

  CartModel fromJson(Map<String, dynamic> json) {
    try {
      id = Util.getValueFromJson(json, 'id', -1);
      tax_id = Util.getValueFromJson(json, 'tax_id', -1);
      sku = Util.getValueFromJson(json, 'sku', '');
      name = Util.getValueFromJson(json, 'name', '');
      subName = Util.getValueFromJson(json, 'subName', '');
      image = Util.getValueFromJson(json, 'image', '');
      qty = Util.getValueFromJson(json, 'qty', 0);
      weight = Util.getValueFromJson(json, 'weight', 0);
      price = Util.getValueFromJson(json, 'price', 0.0);
      last_price = Util.getValueFromJson(json, 'last_price', 0.0);
      if (Util.checkKeyFromJson(json, 'product_attributes'))
        json['product_attributes'].forEach((ele) => product_attributes!.add(Attribute().fromJson(ele)));
    } catch(_) {}
    return this;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "tax_id": tax_id,
    "sku": sku,
    "name": name,
    "subName": subName,
    "image": image,
    "qty": qty,
    "weight": weight,
    "price": price,
    "last_price": last_price,
    "product_attributes": product_attributes
  };

  ProductOrder toProductOrder() {
    return ProductOrder(
      id: id, tax_id: tax_id, sku: sku, title: name, image: image, quantity: qty,
      weight: weight, price: last_price, totalPrice: last_price * qty,
      product_attributes: product_attributes
    );
  }
}
