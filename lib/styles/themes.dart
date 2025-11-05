import 'package:ez_vocab/commons.dart';

ThemeData get lightTheme {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.cyan,
      brightness: Brightness.light,
    ),
    textTheme: MyStyles.textTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade200,
      hintStyle: MyStyles.body2,
      border: OutlineInputBorder(
        borderRadius: kRadius30,
        borderSide: BorderSide.none,
      ),
    ),
  );
}

///Expand darkTheme to meet your needs
ThemeData get darkTheme {
  return ThemeData();
}
