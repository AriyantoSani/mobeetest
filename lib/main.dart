import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeetest/core/localizations/languages.dart';
import 'package:mobeetest/core/utils/api/dio_client.dart';
import 'package:mobeetest/core/utils/router/router_constant.dart';
import 'package:mobeetest/features/feature_home/data/datasources/remote/api_remote_datasource.dart';
import 'package:mobeetest/features/feature_home/data/repositories/crypto_repository_impl.dart';
import 'package:mobeetest/features/feature_home/domain/usecases/get_cryptocurrencies_use_case.dart';
import 'package:mobeetest/features/feature_home/persentation/controllers/crypto_controller.dart';
import 'package:mobeetest/features/feature_home/persentation/views/favorites_view.dart';
import 'package:mobeetest/features/feature_home/persentation/views/home_view.dart';

void main() {
  final DioClient dioClient = DioClient();
  final ApiService apiService = ApiServiceImpl(dio: dioClient.dio);
  final CryptoRepositoryImpl cryptoRepository =
      CryptoRepositoryImpl(apiService);
  final GetCryptocurrenciesUseCase getCryptocurrencies =
      GetCryptocurrenciesUseCase(cryptoRepository);

  Get.put(CryptoController(getCryptocurrencies));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: RouterConstant.mainRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: RouterConstant.favoriteRoute,
        builder: (context, state) => const FavoritesView(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Crypto Portfolio',
      themeMode: ThemeMode.system,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
