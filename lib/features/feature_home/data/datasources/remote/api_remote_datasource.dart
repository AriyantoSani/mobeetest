import 'package:dio/dio.dart';
import 'package:mobeetest/core/utils/api/api_constants.dart';
import 'package:mobeetest/features/feature_home/data/models/crypto_model.dart';

abstract class ApiService {
  Future<List<CryptoModel>> fetchCryptocurrencies();
}

class ApiServiceImpl extends ApiService {
  final Dio dio;
  ApiServiceImpl({required this.dio});

  @override
  Future<List<CryptoModel>> fetchCryptocurrencies() async {
    final response = await dio.get(
        '${ApiConstants.baseUrl}?vs_currency=${ApiConstants.currency}&ids=bitcoin,ethereum,solana');
    final List<dynamic> data = response.data;

    return data.map((json) => CryptoModel.fromJson(json)).toList();
  }
}
