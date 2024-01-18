import 'package:flutter/material.dart';
import 'package:provider_count/provider/count_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider_count/provider/favorite_provider.dart';
import 'package:provider_count/provider/slider_provider.dart';
import 'package:provider_count/screens/favorites_screen.dart';
import 'package:provider_count/screens/slider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider())
      ],
        child: MaterialApp(
          title: 'Provider Counter',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const FavoritesScreen(),
        ));
  }
}
