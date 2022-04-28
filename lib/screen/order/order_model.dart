

import 'package:project_flutter2/component/constants.dart';
import 'package:project_flutter2/component/util/until.dart';
import 'package:project_flutter2/screen/address/address_model.dart';
import 'package:project_flutter2/screen/product/product_model.dart';

class ListOrderModel {
  final List<OrderModel> list = [];
  ListOrderModel fromJson(json) {
    if (json != null && json.isNotEmpty)
      json.forEach((v) => list.add(OrderModel().fromJson(v)));
    return this;
  }
}

class OrderModel {
  int id;
  String sku;
  String fullname;
  String address;
  String email;
  String phonenumber;
  String created_at;
  String updated_at;
  String description;
  String reason_cancel;

  String city = '', district = '';
  int city_id = -1, district_id = -1;

  int shipping_id;
  String shipping_name;
  double shipping_fee;
  bool is_shipping_free;

  int payment_id;
  String payment_key;
  String payment_name;

  String discount_type;
  double discount_percent;
  double discount_value;
  double discount_max;
  double price_discount;
  double gift_price;

  int coupon_id, gift_id, gift_quantity;
  String coupon_code, gift_name, gift_image;

  int taxon;
  int quantity;
  double sub_total;
  double price_total;

  String status;
  String status_shipping;
  String status_payment;
  String paid_transaction;
  int user_id;

  late List<ProductOrder> product_list;
  ProductModel? gift;

  OrderModel({
    this.id = Constants.idDefault,
    this.sku = '',
    this.fullname = '',
    this.address = '',
    this.email = '',
    this.phonenumber = '',
    this.created_at = '',
    this.updated_at = '',
    this.description = '',
    this.reason_cancel = '',
    this.shipping_id = Constants.idDefault,
    this.shipping_name = '',
    this.shipping_fee = 0.0,
    this.is_shipping_free = false,
    this.payment_id = Constants.idDefault,
    this.payment_key = '',
    this.payment_name = '',
    this.discount_type = '',
    this.discount_value = 0.0,
    this.discount_percent = 0.0,
    this.discount_max = 0.0,
    this.price_discount = 0.0,
    this.coupon_id = 0,
    this.coupon_code = '',
    this.gift_id = 0,
    this.gift_quantity = 0,
    this.taxon = 0,
    this.quantity = 0,
    this.sub_total = 0.0,
    this.price_total = 0.0,
    this.status = '',
    this.status_payment = '',
    this.status_shipping = '',
    this.user_id = -1,
    this.paid_transaction = '',
    this.gift_name = '',
    this.gift_image = '',
    this.gift_price = .0,
  }){
    product_list = [];
  }

  OrderModel fromJson(Map<String, dynamic> json) {
    try {
      id = Util.getValueFromJson(json, 'id', -1);
      sku = Util.getValueFromJson(json, 'sku', '');
      fullname = Util.getValueFromJson(json, 'fullname', '');
      address = Util.getValueFromJson(json, 'address', '');
      email = Util.getValueFromJson(json, 'email', '');
      phonenumber = Util.getValueFromJson(json, 'phonenumber', '');
      created_at = Util.getValueFromJson(json, 'created_at', '');
      updated_at = Util.getValueFromJson(json, 'updated_at', '');
      description = Util.getValueFromJson(json, 'description', '');
      reason_cancel = Util.getValueFromJson(json, 'reason_cancel', '');
      shipping_id = Util.getValueFromJson(json, 'shipping_id', -1);
      shipping_name = Util.getValueFromJson(json, 'shipping_name', '');
      shipping_fee = Util.getValueFromJson(json, 'shipping_fee', 0.0);
      is_shipping_free = Util.getValueFromJson(json, 'is_shipping_free', false);
      payment_id = Util.getValueFromJson(json, 'payment_id', -1);
      payment_name = Util.getValueFromJson(json, 'payment_name', '');
      discount_type = Util.getValueFromJson(json, 'discount_type', '');
      discount_value = Util.getValueFromJson(json, 'discount_value', 0.0);
      discount_percent = Util.getValueFromJson(json, 'discount_percent', 0.0);
      discount_max = Util.getValueFromJson(json, 'discount_max', 0.0);
      price_discount = Util.getValueFromJson(json, 'price_discount', 0.0);
      coupon_id = Util.getValueFromJson(json, 'coupon_id', 0);
      coupon_code = Util.getValueFromJson(json, 'coupon_code', '');
      gift_id = Util.getValueFromJson(json, 'gift_id', 0);
      gift_quantity = Util.getValueFromJson(json, 'gift_quantity', 0);
      taxon = Util.getValueFromJson(json, 'taxon', 0);
      quantity = Util.getValueFromJson(json, 'quantity', 0);
      sub_total = Util.getValueFromJson(json, 'sub_total', 0.0);
      price_total = Util.getValueFromJson(json, 'price_total', 0.0);
      status = Util.getValueFromJson(json, 'status', '');
      status_shipping = Util.getValueFromJson(json, 'status_shipping', '');
      status_payment = Util.getValueFromJson(json, 'status_payment', '');
      user_id = Util.getValueFromJson(json, 'user_id', -1);
      paid_transaction = Util.getValueFromJson(json, 'paid_transaction', '');
      gift_price = Util.getValueFromJson(json, 'gift_price', .0);
      gift_image = Util.getValueFromJson(json, 'gift_image', '');
      gift_name = Util.getValueFromJson(json, 'gift_name', '');
      if (Util.checkKeyFromJson(json, 'product_list'))
        json['product_list'].forEach((v) => product_list.add(ProductOrder().fromJson(v)));
    } catch (_) {}
    return this;
  }

  void setValue(OrderModel value) {
    id = value.id;
    user_id = value.user_id;
    sku = value.sku;
    created_at = value.created_at;
    updated_at = value.updated_at;
    status = value.status;
  }

  void setTransaction(String? value) {
    paid_transaction = value == null || value.isEmpty ? sku : value;
  }

  void setStatusPayment(String value) {
    status_payment = value;
  }

  void setStatus(String value) {
    status = value;
  }

  // void setPayment(PaymentModel payment) {
  //   payment_id = payment.id;
  //   payment_key = payment.key;
  //   payment_name = payment.name;
  // }

  void setPayment2(int id, String name, String key) {
    payment_id = id;
    payment_key = key;
    payment_name = name;
  }

  void setShipping(int id, String name, double fee) {
    shipping_id = id;
    shipping_name = name;
    shipping_fee = fee;
  }

  // void setCoupon(CouponModel coupon, {double ship = 0.0}) {
  //   price_discount = coupon.discount_value;
  //   discount_value = price_discount;
  //   coupon_id = coupon.coupon_id;
  //   coupon_code = coupon.coupon_code;
  //   discount_type = coupon.discount_type;
  //   gift_id = coupon.gift_id;
  //   gift_quantity = coupon.gift_quantity;
  //   if (coupon.shipping_fee == 0.0) {
  //     is_shipping_free = true;
  //     shipping_fee = 0.0;
  //   } else {
  //     is_shipping_free = false;
  //     shipping_fee = ship;
  //   }
  //   price_total = sub_total - discount_value + shipping_fee;
  // }

  void reset() {
    id = user_id = -1;
    status = '';
    price_total = price_total - shipping_fee + price_discount;
    sub_total = price_total;

    price_discount = .0;
    discount_value = .0;
    coupon_id = 0;
    coupon_code = '';
    discount_type = '';
    gift_id = 0;
    gift_quantity = 0;
    gift_image = '';
    gift_price = .0;
    gift = null;

    shipping_id = -1;
    is_shipping_free = false;
    shipping_fee = .0;
    status_shipping = '';

    payment_id = -1;
    payment_key = '';
    payment_name = '';
    paid_transaction = '';
    status_payment = '';
  }

  OrderModel clone(OrderModel value) {
    id = value.id;
    sku = value.sku;
    fullname = value.fullname;
    address = value.address;
    email = value.email;
    phonenumber = value.phonenumber;
    created_at = value.created_at;
    updated_at = value.updated_at;
    description = value.description;
    shipping_id = value.shipping_id;
    shipping_name = value.shipping_name;
    shipping_fee = value.shipping_fee;
    is_shipping_free = value.is_shipping_free;
    payment_id = value.payment_id;
    payment_name = value.payment_name;
    payment_key = value.payment_key;
    discount_type = value.discount_type;
    discount_value = value.discount_value;
    discount_percent = value.discount_percent;
    discount_max = value.discount_max;
    price_discount = value.price_discount;
    taxon = value.taxon;
    quantity = value.quantity;
    sub_total = value.sub_total;
    price_total = value.price_total;
    status = value.status;
    status_payment = value.status_payment;
    status_shipping = value.status_shipping;
    user_id = value.user_id;
    paid_transaction = value.paid_transaction;
    product_list.clear();
    product_list.addAll(value.product_list);
    city = value.city;
    city_id = value.city_id;
    district = value.district;
    district_id = value.district_id;
    coupon_id = value.coupon_id;
    coupon_code = value.coupon_code;
    gift_id = value.gift_id;
    gift_name = value.gift_name;
    gift_price = value.gift_price;
    gift_image = value.gift_image;
    gift = value.gift;
    return this;
  }

  void copyFromAddress(AddressModel address) {
    fullname = address.name;
    phonenumber = address.phone;
    this.address = address.address;
    city = address.city;
    city_id = address.city_id;
    district = address.district;
    district_id = address.district_id;
  }
}

class ProductOrder {
  int id, tax_id;
  String sku;
  String title;
  String image;
  int quantity;
  int weight;
  int unit;
  String unit_name;
  double price;
  double totalPrice;
  List<Attribute>? product_attributes;

  ProductOrder({
    this.id = -1,
    this.tax_id = -1,
    this.sku = '',
    this.title = '',
    this.image = '',
    this.quantity = 0,
    this.weight = 0,
    this.unit = -1,
    this.unit_name = '',
    this.price = 0.0,
    this.totalPrice = 0.0,
    this.product_attributes
  }) {
    product_attributes ??= [];
  }

  ProductOrder fromJson(Map<String, dynamic> json) {
    try {
      id = Util.getValueFromJson(json, 'id', -1);
      tax_id = Util.getValueFromJson(json, 'tax_id', -1);
      sku = Util.getValueFromJson(json, 'sku', '');
      title = Util.getValueFromJson(json, 'title', '');
      image = Util.getValueFromJson(json, 'image', '');
      quantity = Util.getValueFromJson(json, 'quantity', 0);
      weight = Util.getValueFromJson(json, 'weight', 0);
      unit = Util.getValueFromJson(json, 'unit', -1);
      unit_name = Util.getValueFromJson(json, 'unit_name', '');
      price = Util.getValueFromJson(json, 'price', 0.0);
      totalPrice = Util.getValueFromJson(json, 'totalPrice', 0.0);
      if (Util.checkKeyFromJson(json, 'product_attributes'))
        json['product_attributes'].forEach((ele) => product_attributes!.add(Attribute().fromJson(ele)));
    } catch (_) {}
    return this;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'tax_id': tax_id,
    'sku': sku,
    'title': title,
    'image': image,
    'quantity': quantity,
    'weight': weight,
    'price': price,
    'totalPrice': totalPrice,
    'product_attributes': product_attributes
  };
}

class ShippingHistoriesModel {
  final Map<String, String> list = {};
  ShippingHistoriesModel fromJson(json) {
    if (Util.checkKeyFromJson(json, 'shipping_histories')) {
      json = json['shipping_histories'];
      if (json.isNotEmpty)
        json.forEach((ele) {
          if (Util.checkKeyFromJson(ele, 'status'))
            list.putIfAbsent(ele['status'], () => Util.getValueFromJson(ele, 'shipping_date', ''));
        });
    }
    return this;
  }
}