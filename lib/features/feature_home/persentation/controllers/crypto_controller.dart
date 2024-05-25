import 'package:get/get.dart';
import 'package:mobeetest/features/feature_home/domain/entities/crypto_entity.dart';
import 'package:mobeetest/features/feature_home/domain/usecases/get_cryptocurrencies_use_case.dart';

class CryptoController extends GetxController {
  final GetCryptocurrenciesUseCase getCryptocurrencies;

  CryptoController(this.getCryptocurrencies);

  var cryptos = <CryptoEntity>[].obs;
  var favorites = <CryptoEntity>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCryptocurrencies();
    super.onInit();
  }

  Future<void> fetchCryptocurrencies() async {
    isLoading(true);
    try {
      final result = await getCryptocurrencies();
      cryptos.assignAll(result);
    } finally {
      isLoading(false);
    }
  }

  void toggleFavorite(CryptoEntity crypto) {
    isLoading(true);
    if (favorites.contains(crypto)) {
      favorites.remove(crypto);
    } else {
      favorites.add(crypto);
    }
    isLoading(false);
    favorites.refresh();
    update();
  }
}
