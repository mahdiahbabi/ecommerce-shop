import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'data.g.dart';

@HiveType(typeId: 0)
class AuthD {
  @HiveField(0)
  String accessToken = '';
  @HiveField(1)
  String refreshtoken = '';
}