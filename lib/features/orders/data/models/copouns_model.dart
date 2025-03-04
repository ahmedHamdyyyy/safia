// class Copoun {
//   String? orderId;
//   String? userId;
//   String? orderDate;
//   double? totalAmount;
//   String? shippingAddress;
//   String? number;
//   String? status;
//   String? createdDate;
//   String? contactNumber;
//   String? userName;
//   String? detailedAddress;
//   String? notes;
//   String? couponeCode;
//   double? netPrice;
//   double? discountValue;
//   // List<Items>? items;

//   Copoun({
//     this.orderId,
//     this.userId,
//     this.orderDate,
//     this.totalAmount,
//     this.shippingAddress,
//     this.number,
//     this.status,
//     this.createdDate,
//     this.contactNumber,
//     this.userName,
//     this.detailedAddress,
//     this.notes,
//     this.couponeCode,
//     this.netPrice,
//     this.discountValue,
//     // this.items,
//   });

//   Copoun.fromJson(Map<String, dynamic> json) {
//     orderId = json['orderId'];
//     userId = json['userId'];
//     orderDate = json['orderDate'];
//     totalAmount = json['totalAmount'];
//     shippingAddress = json['shippingAddress'];
//     number = json['number'];
//     status = json['status'];
//     createdDate = json['createdDate'];
//     contactNumber = json['contactNumber'];
//     userName = json['userName'];
//     detailedAddress = json['detailedAddress'];
//     notes = json['notes'];
//     couponeCode = json['couponeCode'];
//     netPrice = json['netPrice'];
//     discountValue = json['discountValue'];
//     // if (json['items'] != null) {
//     //   items = <Items>[];
//     //   json['items'].forEach(
//     //     (v) {
//     //       items!.add(new Items.fromJson(v));
//     //     },
//     //   );
//     // }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orderId'] = this.orderId;
//     data['userId'] = this.userId;
//     data['orderDate'] = this.orderDate;
//     data['totalAmount'] = this.totalAmount;
//     data['shippingAddress'] = this.shippingAddress;
//     data['number'] = this.number;
//     data['status'] = this.status;
//     data['createdDate'] = this.createdDate;
//     data['contactNumber'] = this.contactNumber;
//     data['userName'] = this.userName;
//     data['detailedAddress'] = this.detailedAddress;
//     data['notes'] = this.notes;
//     data['couponeCode'] = this.couponeCode;
//     data['netPrice'] = this.netPrice;
//     data['discountValue'] = this.discountValue;
//     // if (this.items != null) {
//     //   data['items'] = this.items!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }

// // class Items {
// //   int? productId;
// //   String? title;
// //   Null category;
// //   String? image;
// //   int? quantity;
// //   int? unitPrice;
// //   int? totalPrice;

// //   Items(
// //       {this.productId,
// //       this.title,
// //       this.category,
// //       this.image,
// //       this.quantity,
// //       this.unitPrice,
// //       this.totalPrice});

// //   Items.fromJson(Map<String, dynamic> json) {
// //     productId = json['productId'];
// //     title = json['title'];
// //     category = json['category'];
// //     image = json['image'];
// //     quantity = json['quantity'];
// //     unitPrice = json['unitPrice'];
// //     totalPrice = json['totalPrice'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['productId'] = this.productId;
// //     data['title'] = this.title;
// //     data['category'] = this.category;
// //     data['image'] = this.image;
// //     data['quantity'] = this.quantity;
// //     data['unitPrice'] = this.unitPrice;
// //     data['totalPrice'] = this.totalPrice;
// //     return data;
// //   }
// // }
