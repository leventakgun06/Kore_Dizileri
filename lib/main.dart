import 'package:flutter/material.dart';
import 'package:koredizileri/provider/genre_provider.dart';
import 'package:koredizileri/provider/korea_provider.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SerieProvider()),
        ChangeNotifierProvider(create: (context) => MovieProvider()),
        ChangeNotifierProvider(create: (context) => JaponProvider()),
        ChangeNotifierProvider(create: (context) => GenreProvider()),
      ],
      child: MaterialApp(
        title: textAppName,
        debugShowCheckedModeBanner: false,
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    );
  }
}
