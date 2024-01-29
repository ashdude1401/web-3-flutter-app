import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_3_app/utils/theme/app_theme.dart';
import 'package:web_3_app/utils/theme/pallete.dart';
import 'package:web_3_app/view/wallet_connect_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Web 3 App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: WalletConnectPage(),
    );
  }
}
