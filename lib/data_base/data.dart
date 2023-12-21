import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'data.g.dart';

@HiveType(typeId: 0)
class Data  extends HiveObject{
  @HiveField(0)
  final String accessToken ;
  @HiveField(1)
 final String refreshtoken ;
 

  Data(this.accessToken, this.refreshtoken);
}