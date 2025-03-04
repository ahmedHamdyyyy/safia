// // create model for add order whit this data {
// //   "phoneNumebr": "<string>",
// //   "shippingAddress": "<string>",
// //   "shoppingCartId": "<integer>",
// //   "userId": "<string>",
// //   "detailedAddress": "<string>",
// //   "notes": "<string>"
// // }

// class AddOrderModel {
//   final String phoneNumebr;
//   final String shippingAddress;
//   final int shoppingCartId;
//   final String userId;
//   final String detailedAddress;
//   final String notes;

//   AddOrderModel({
//     required this.phoneNumebr,
//     required this.shippingAddress,
//     required this.shoppingCartId,
//     required this.userId,
//     required this.detailedAddress,
//     required this.notes,
//   });

//   factory AddOrderModel.fromJson(Map<String, dynamic> json) {
//     return AddOrderModel(
//       phoneNumebr: json['phoneNumber'],
//       shippingAddress: json['shippingAddress'],
//       shoppingCartId: json['shoppingCartId'],
//       userId: json['userId'],
//       detailedAddress: json['detailedAddress'],
//       notes: json['notes'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['phoneNumebr'] = phoneNumebr;
//     data['shippingAddress'] = shippingAddress;
//     data['shoppingCartId'] = shoppingCartId;
//     data['userId'] = userId;
//     data['detailedAddress'] = detailedAddress;
//     data['notes'] = notes;
//     return data;
//   }
// }

// class OrderResponse {
//   final String id;
//   final String status;
//   final String number;
//   final DateTime orderDate;
//   final double totalPrice;
//   final String phoneNumber;
//   final String shippingAddress;
//   final String userName;
//   final String email;
//   final String detailedAddress;
//   final String notes;
//   final double netPrice;

//   OrderResponse({
//     required this.id,
//     required this.netPrice,
//     required this.status,
//     required this.number,
//     required this.orderDate,
//     required this.totalPrice,
//     required this.phoneNumber,
//     required this.shippingAddress,
//     required this.userName,
//     required this.email,
//     required this.detailedAddress,
//     required this.notes,
//   });

//   factory OrderResponse.fromJson(Map<String, dynamic> json) {
//     return OrderResponse(
//       id: json['id'],
//       status: json['status'],
//       number: json['number'],
//       orderDate: DateTime.parse(json['orderDate']),
//       netPrice: json['netPrice'].toDouble(),
//       totalPrice: json['totalPrice'].toDouble(),
//       phoneNumber: json['phoneNumber'],
//       shippingAddress: json['shippingAddress'],
//       userName: json['userName'],
//       email: json['email'],
//       detailedAddress: json['detailedAddress'],
//       notes: json['notes'],
//     );
//   }
// }
// create model for add order whit this data {
//   "phoneNumebr": "<string>",
//   "shippingAddress": "<string>",
//   "shoppingCartId": "<integer>",
//   "userId": "<string>",
//   "detailedAddress": "<string>",
//   "notes": "<string>"
// }

class AddOrderModel {
  final String phoneNumebr;
  final String shippingAddress;
  final int shoppingCartId;
  final String userId;
  final String detailedAddress;
  final String notes;

  AddOrderModel({
    required this.phoneNumebr,
    required this.shippingAddress,
    required this.shoppingCartId,
    required this.userId,
    required this.detailedAddress,
    required this.notes,
  });

  factory AddOrderModel.fromJson(Map<String, dynamic> json) {
    return AddOrderModel(
      phoneNumebr: json['phoneNumber'],
      shippingAddress: json['shippingAddress'],
      shoppingCartId: json['shoppingCartId'],
      userId: json['userId'],
      detailedAddress: json['detailedAddress'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumebr'] = phoneNumebr;
    data['shippingAddress'] = shippingAddress;
    data['shoppingCartId'] = shoppingCartId;
    data['userId'] = userId;
    data['detailedAddress'] = detailedAddress;
    data['notes'] = notes;
    return data;
  }
}

class OrderResponse {
  String? orderId;
  String? userId;
  String? orderDate;
  double? totalAmount;
  String? shippingAddress;
  String? number;
  String? status;
  String? createdDate;
  String? contactNumber;
  String? userName;
  String? detailedAddress;
  String? notes;
  String? couponeCode;
  double? netPrice;
  double? discountValue;
  List<Items>? items;

  OrderResponse(
      {this.orderId,
      this.userId,
      this.orderDate,
      this.totalAmount,
      this.shippingAddress,
      this.number,
      this.status,
      this.createdDate,
      this.contactNumber,
      this.userName,
      this.detailedAddress,
      this.notes,
      this.couponeCode,
      this.netPrice,
      this.discountValue,
      this.items});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    userId = json['userId'];
    orderDate = json['orderDate'];
    totalAmount = json['totalAmount'];
    shippingAddress = json['shippingAddress'];
    number = json['number'];
    status = json['status'];
    createdDate = json['createdDate'];
    contactNumber = json['contactNumber'];
    userName = json['userName'];
    detailedAddress = json['detailedAddress'];
    notes = json['notes'];
    couponeCode = json['couponeCode'];
    netPrice = json['netPrice'];
    discountValue = json['discountValue'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }
  OrderResponse copyWith({
    String? status,
    String? number,
    String? shippingAddress,
    double? netPrice,
  }) {
    return OrderResponse(
      status: status ?? this.status,
      number: number ?? this.number,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      netPrice: netPrice ?? this.netPrice,
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['userId'] = this.userId;
    data['orderDate'] = this.orderDate;
    data['totalAmount'] = this.totalAmount;
    data['shippingAddress'] = this.shippingAddress;
    data['number'] = this.number;
    data['status'] = this.status;
    data['createdDate'] = this.createdDate;
    data['contactNumber'] = this.contactNumber;
    data['userName'] = this.userName;
    data['detailedAddress'] = this.detailedAddress;
    data['notes'] = this.notes;
    data['couponeCode'] = this.couponeCode;
    data['netPrice'] = this.netPrice;
    data['discountValue'] = this.discountValue;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? productId;
  String? title;
  String? category;
  String? image;
  int? quantity;
  double? unitPrice;
  double? totalPrice;

  Items(
      {this.productId,
      this.title,
      this.category,
      this.image,
      this.quantity,
      this.unitPrice,
      this.totalPrice});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    title = json['title'];
    category = json['category'];
    image = json['image'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['title'] = this.title;
    data['category'] = this.category;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['unitPrice'] = this.unitPrice;
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}
