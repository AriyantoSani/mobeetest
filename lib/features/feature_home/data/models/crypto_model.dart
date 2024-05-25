// ignore_for_file: overridden_fields, annotate_overrides

import 'package:mobeetest/features/feature_home/domain/entities/crypto_entity.dart';

class CryptoModel extends CryptoEntity {
  String id;
  String name;
  double price;
  CryptoModel({required this.id, required this.name, required this.price})
      : super(
          id: id,
          name: name,
          price: price,
        );

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      id: json['id'],
      name: json['name'],
      price: (json['current_price'] as num).toDouble(),
    );
  }
}
