class Product {
  final int price, phonenum;
  final double weight;
  final String name, description, type, ownwer, weightcatogory, image;

  Product(this.price, this.phonenum, this.weight, this.name, this.description,
      this.type, this.ownwer, this.weightcatogory, this.image);
}

List<Product> products = [
  Product(150, 0773459839, 230.5, "Potatto", "Natural", "Vegetable", "AAAA",
      "100-300kg", "assets/potatto.jpeg"),
  Product(150, 0773459839, 230.5, "Onion", "Natural", "Vegetable", "AAAA",
      "100-300kg", "assets/onion.jpeg"),
  Product(150, 0773459839, 230.5, "Tomato", "Natural", "Vegetable", "AAAA",
      "100-300kg", "assets/tomato.jpg"),
  Product(150, 0773459839, 230.5, "Pumpkin", "Natural", "Vegetable", "AAAA",
      "100-300kg", "assets/pumpkin.jpg")
];
