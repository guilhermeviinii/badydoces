class Sale {
  String id_sale;
  double value;
  bool status;
  DateTime date;
  String admin_id;
  String customer;

  Sale(
      {this.id_sale,
      this.value,
      this.status,
      this.date,
      this.admin_id,
      this.customer});

  Sale.fromJson(Map<String, dynamic> json) {
    id_sale = json['id_sale'];
    value = json['value'];
    status = json['status'];
    date = json['date'];
    admin_id = json['admin_id'];
    customer = json['customer'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_sale': id_sale,
      'value': value,
      'status': status,
      'date': date,
      'admin_id': admin_id,
      'customer': customer
    };
  }
}
