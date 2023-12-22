// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productdata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDataAdapter extends TypeAdapter<ProductData> {
  @override
  final int typeId = 1;

  @override
  ProductData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductData(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as String,
      (fields[4] as List).cast<String>(),
      fields[5] as int,
      fields[6] as String,
      fields[7] as String,
      fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductData obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.images)
      ..writeByte(5)
      ..write(obj.categoryId)
      ..writeByte(6)
      ..write(obj.categoryName)
      ..writeByte(7)
      ..write(obj.categoryImage)
      ..writeByte(8)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
