import 'package:calender/database/drift_datebase.dart';
import 'package:calender/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:drift/drift.dart';

const DEFAULT_COLORS = [
  'F44336',
  'FF9800',
  'FFEB3B',
  'FCAF50',
  '2196F3',
  '9C27B0'
];

void main() async {
  // 초기화가 되라고 기다리는 함수
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  //drift_datebase.dart 에 만들어 놨던 함수임
  final database = LocalDatabase();

  final colors = await database.getCategoryColors();

  if (colors.isEmpty) {
    for (String hexcode in DEFAULT_COLORS) {
      await database.createCategoryColor(
          CategoryColorsCompanion(Hexcode: Value(hexcode)));
    }
  }

  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'NotoSans'),
    home: HomeScreen(),
  ));
}
