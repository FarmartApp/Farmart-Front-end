class Trasport {
  int id, amount, userid;
  double weight;
  String vehiclemodel, vehiclenum, image;
  // User user;
  DateTime createdat, updatedat, deletedat;

  Trasport(
      {this.id,
      this.userid,
      this.amount,
      this.weight,
      this.vehiclemodel,
      this.vehiclenum,
      this.image,
      this.createdat,
      this.updatedat,
      this.deletedat});

  List<Trasport> searchTrasport = [];

  factory Trasport.fromJson(Map<String, dynamic> json) {
    return Trasport(
      id: json['id'],
      userid: json['user_id'],
      amount: json['amount'],
      weight: json['weight'],
      vehiclemodel: json['vehicle_model'],
      vehiclenum: json['vehicle_no'],
      image: json['image'],
      createdat: json['created_at'],
      updatedat: json['updated_at'],
      deletedat: json['deleted_at'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userid,
        "amount": amount,
        "weight": weight,
        "vehicle_model": vehiclemodel,
        "vehicle_no": vehiclenum,
        "image": image,
        "created_at": createdat,
        "updated_at": updatedat,
        "deleted_at": deletedat,
      };
}
