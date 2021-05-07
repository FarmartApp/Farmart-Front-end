class Product {
  int id, userid, amount;
  double price, weight;
  String name, productType, image, location;
  bool deliveryAvailable, sold;
  DateTime createdat, updatedat, deletedat;

  Product(
      {this.id,
      this.userid,
      this.amount,
      this.price,
      this.weight,
      this.name,
      this.productType,
      this.image,
      this.location,
      this.deliveryAvailable,
      this.sold,
      this.createdat,
      this.updatedat,
      this.deletedat});
  
  List<Product> searchProducts = [];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      userid: json['user_id'],
      amount: json['amount'],
      price: json['price'],
      weight: json['weight'],
      name: json['name'],
      productType: json['productType'],
      image: json['image'],
      location: json['location'],
      deliveryAvailable: json['deliveryAvailable'],
      sold: json['sold'],
      createdat: json['created_at'],
      updatedat: json['updated_at'],
      deletedat: json['deleted_at'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userid,
        "amount": amount,
        "price": price,
        "weight": weight,
        "name": name,
        "productType": productType,
        "image": image,
        "location": location,
        "deliveryAvailable": deliveryAvailable,
        "sold": sold,
        "created_at": createdat,
        "updated_at": updatedat,
        "deleted_at": deletedat,
      };
      
}
