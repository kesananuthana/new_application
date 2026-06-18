// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      pid: json['Pid'] as String,
      name: json['Name'] as String,
      price: (json['Price'] as num).toInt(),
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'Pid': instance.pid,
      'Name': instance.name,
      'Price': instance.price,
    };
