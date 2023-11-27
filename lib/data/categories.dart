

class Categories {
final int id;
final String name;
final String image;

  Categories(this.id, this.name, this.image);

  Categories.fromjson(Map <String, dynamic> element):
  id = element['id'],
  name = element['name'],
  image = element['image'];

}




