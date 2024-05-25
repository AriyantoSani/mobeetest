import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobeetest/core/localizations/app_localization_keys.dart';
import '../controllers/crypto_controller.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final CryptoController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizationKeys.favoriteTitle.tr,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return Center(
              child: Text(
            AppLocalizationKeys.noFavoriteCrypto.tr,
          ));
        }

        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final crypto = controller.favorites[index];

            return ListTile(
              title: Text(crypto.name),
              subtitle: Text('\$${crypto.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
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
