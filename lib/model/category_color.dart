import 'package:drift/drift.dart';

class CategoryColors extends Table {
  // ID 값
  IntColumn get Id => integer().autoIncrement()();

  // 색상 코드
  TextColumn get Hexcode => text()();
}
