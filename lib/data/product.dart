

class Product {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final int categoryId;
  final String categoryName;
  final String categoryImage;

  Product(this.id, this.title, this.price, this.description,
      this.categoryId, this.categoryName, this.categoryImage, this.images);

  Product.fromjson( Map<String, dynamic> element)
      : id = element["id"],
        title = element["title"],
        price = element["price"],
        description = element["description"],
        images = List<String>.from(element["images"]),
        categoryId = element['category']['id'],
        categoryName = element['category']['name'],
        categoryImage = element['category']['image'];
}



    // {
    //     "id": 2,
    //     "title": "Unbranded Steel Chips",
    //     "price": 129,
    //     "description": "Carbonite web goalkeeper gloves are ergonomically designed to give easy fit",
    //     "images": [
    //         "https://i.imgur.com/1twoaDy.jpeg",
    //         "https://i.imgur.com/FDwQgLy.jpeg",
    //         "https://i.imgur.com/kg1ZhhH.jpeg"
    //     ],
    //     "creationAt": "2023-11-22T06:36:16.000Z",
    //     "updatedAt": "2023-11-22T06:36:16.000Z",
    //     "category": {
    //         "id": 1,
    //         "name": "Clothes",
    //         "image": "https://i.imgur.com/QkIa5tT.jpeg",
    //         "creationAt": "2023-11-22T06:36:16.000Z",
    //         "updatedAt": "2023-11-22T06:36:16.000Z"
    //     }
    // },