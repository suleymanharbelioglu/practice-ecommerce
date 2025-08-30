import 'package:flutter/material.dart';
import 'package:practice_ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:practice_ecommerce/presentation/settings/wigets/logout_button.dart';
import 'package:practice_ecommerce/presentation/settings/wigets/my_favorites_tile.dart';
import 'package:practice_ecommerce/presentation/settings/wigets/my_orders_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: Text('Settings'), hideBack: false),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [MyFavoritesTile(), SizedBox(height: 15), MyOrdersTile()],
        ),
      ),
      bottomNavigationBar: LogoutButton(),
    );
  }
}
