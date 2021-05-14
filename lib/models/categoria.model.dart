class Categoria {
  String name;
  String id;

  Categoria({this.name, this.id});

  Categoria.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'id': id};
  }
}
