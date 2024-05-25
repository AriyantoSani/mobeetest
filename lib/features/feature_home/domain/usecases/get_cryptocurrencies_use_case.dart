import 'package:mobeetest/features/feature_home/domain/entities/crypto_entity.dart';
import '../../data/repositories/crypto_repository_impl.dart';

class GetCryptocurrenciesUseCase {
  final CryptoRepositoryImpl repository;

  GetCryptocurrenciesUseCase(this.repository);

  Future<List<CryptoEntity>> call() async {
    final models = await repository.fetchCryptocurrencies();
    return models
        .map((model) =>
            CryptoEntity(id: model.id, name: model.name, price: model.price))
        .toList();
  }
}
