class Sale {
  // ignore: non_constant_identifier_names
  String id_sale;
  String value;
  String customer;
  // ignore: non_constant_identifier_names
  String created_at;
  bool delivered;
  // ignore: non_constant_identifier_names
  String admin_id;

  Sale({
    // ignore: non_constant_identifier_names
    this.id_sale,
    this.value,
    this.customer,
    // ignore: non_constant_identifier_names
    this.created_at,
    this.delivered,
    // ignore: non_constant_identifier_names
    this.admin_id,
  });

  Sale.fromJson(Map<String, dynamic> json) {
    id_sale = json['id'];
    value = json['value'];
    customer = json['costumer'];
    created_at = json['created_at'];
    admin_id = json['admin_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id_sale,
      'value': value,
      'costumer': customer,
      'created_at': created_at,
      'admin_id': admin_id,
    };
  }
}
