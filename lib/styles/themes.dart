import 'package:ez_vocab/commons.dart';

ThemeData get lightTheme {
  return ThemeData(
    colorScheme: myColorScheme,
    textTheme: MyStyles.textTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: myColorScheme.surfaceDim,
      hintStyle: MyStyles.body2,
      border: OutlineInputBorder(
        borderRadius: kRadius30,
        borderSide: BorderSide.none,
      ),
    ),
    scaffoldBackgroundColor: myColorScheme.surface,
    appBarTheme: AppBarTheme(backgroundColor: myColorScheme.primary),
  );
}

///Expand darkTheme to meet your needs
ThemeData get darkTheme {
  return ThemeData();
}
