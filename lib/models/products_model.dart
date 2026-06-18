import 'package:json_annotation/json_annotation.dart';
part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  @JsonKey(name: 'Pid')
  final String pid;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Price')
  final int price;

  ProductsModel({required this.pid, required this.name, required this.price});

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
