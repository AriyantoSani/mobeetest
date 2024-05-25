import 'package:mobeetest/features/feature_home/domain/entities/crypto_entity.dart';

abstract class CryptoRepository {
  Future<List<CryptoEntity>> fetchCryptocurrencies();
}
