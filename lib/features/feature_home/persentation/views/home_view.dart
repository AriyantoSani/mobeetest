import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobeetest/core/localizations/app_localization_keys.dart';
import 'package:mobeetest/core/utils/router/router_constant.dart';
import '../controllers/crypto_controller.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final CryptoController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          AppLocalizationKeys.homeTitle.tr,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {
              context.push(RouterConstant.favoriteRoute);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.cryptos.length,
          itemBuilder: (context, index) {
            final crypto = controller.cryptos[index];
            final isFavorite = controller.favorites.contains(crypto);

            return ListTile(
              title: Text(crypto.name),
              subtitle: Text('\$${crypto.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite
                      ? Colors.red
                      : Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  controller.toggleFavorite(crypto);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
