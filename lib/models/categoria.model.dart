class Categoria {
  String name;
  String id;

  Categoria({this.name, this.id});

  Categoria.fromJson(Map<String, dynamic> json) {
    name = json['category_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'category_name': name, 'id': id};
  }
}
