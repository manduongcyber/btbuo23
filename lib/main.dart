import 'package:flutter/material.dart';

import 'screens/store_page.dart';

void main() => runApp(const ShoeStoreApp());

class ShoeStoreApp extends StatelessWidget {
  const ShoeStoreApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cửa hàng giày hiệu online',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff079ee8)),
          scaffoldBackgroundColor: const Color(0xfffff8ff),
          useMaterial3: true,
        ),
        home: const StorePage(),
      );
}
