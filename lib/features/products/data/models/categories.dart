class Categories {
  int? id;
  String? image;
  String? userId;
  List<Products>? products;
  String? name;
  String? description;

  Categories(
      {this.id,
      this.image,
      this.userId,
      this.products,
      this.name,
      this.description});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    userId = json['userId'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['userId'] = this.userId;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  double? price;
  int? quantity;
  String? category;
  String? image;

  Products(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.quantity,
      this.category,
      this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['category'] = this.category;
    data['image'] = this.image;
    return data;
  }
}