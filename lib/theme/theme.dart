import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
    background: Colors.yellow,
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueGrey,
    titleTextStyle: TextStyle(
        color: Colors.yellow, fontSize: 25, fontWeight: FontWeight.bold),
  ),
  textTheme: TextTheme(
    bodyLarge: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      color: Colors.black.withAlpha(200),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  ),
  dividerColor: Colors.white,
  listTileTheme: const ListTileThemeData(iconColor: Colors.blueGrey),
);
