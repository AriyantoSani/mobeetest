import 'package:get/get.dart';
import 'package:mobeetest/features/feature_home/data/datasources/remote/api_remote_datasource.dart';
import 'package:mobeetest/features/feature_home/domain/repositories/crypto_repository.dart';
import '../models/crypto_model.dart';

class CryptoRepositoryImpl extends GetxService implements CryptoRepository {
  final ApiService apiService;

  CryptoRepositoryImpl(this.apiService);

  @override
  Future<List<CryptoModel>> fetchCryptocurrencies() {
    return apiService.fetchCryptocurrencies();
  }
}
