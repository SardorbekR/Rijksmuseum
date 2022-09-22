import 'package:flutter/material.dart';
import 'package:rijksmuseum/dp.dart';
import 'package:rijksmuseum/features/home/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyProvider(
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200],
          appBarTheme: AppBarTheme(
            color: Colors.blue[900],
            iconTheme: const IconThemeData(color: Colors.white),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
