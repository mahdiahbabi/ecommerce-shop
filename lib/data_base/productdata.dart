
import 'package:hive/hive.dart';

part 'productdata.g.dart';
@HiveType(typeId: 1)
class ProductData extends HiveObject {
  @HiveField(0)
  final int id;
   @HiveField(1)
  final String title;
   @HiveField(2)
  final int price;
   @HiveField(3)
  final String description;
   @HiveField(4)
  final List<String> images;
   @HiveField(5)
  final int categoryId;
   @HiveField(6)
  final String categoryName;
   @HiveField(7)
  final String categoryImage;
  @HiveField(8)
   int amount;

  ProductData(this.id, this.title, this.price, this.description, this.images, this.categoryId, this.categoryName, this.categoryImage, this.amount);


}