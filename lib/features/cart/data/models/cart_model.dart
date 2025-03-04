class CartModel {
  String? userId;
  int? cartId;
  double? totalPrice;
  List<Items>? items;

  CartModel({this.userId, this.cartId, this.totalPrice, this.items});

  CartModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    cartId = json['cartId'];
    totalPrice = json['totalPrice'] != null ? 
      (json['totalPrice'] is int ? 
        (json['totalPrice'] as int).toDouble() : 
        json['totalPrice']) : 
      0.0;
    
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    } else {
      items = [];  // Initialize as empty list instead of null
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['cartId'] = this.cartId;
    data['totalPrice'] = this.totalPrice;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? title;
  String? image;
  int? quantity;
  double? price;

  Items({this.id, this.title, this.image, this.quantity, this.price});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}
