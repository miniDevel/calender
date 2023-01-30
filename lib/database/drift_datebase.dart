import 'dart:io';

import 'package:calender/model/category_color.dart';
import 'package:calender/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';

// import랑 비슷한데 private 값까지 불러올 수 있다. 보통 코드가 많아서 두개로 나눠놓은 느낌..?
// g가 제너레이티드란 뜻인데 이 파일은 특정 커멘드를 실행해서 자동으로 이 파일이 생성되도록 한거다.
// flutter pub run build_runner build :
// 이걸 teminal 에다가 써줘야 코드 제너레이션(자동생성?)을 정상적으로 사용할수 있음
part 'drift_datebase.g.dart';

// 생성해놓은 table 들을 import 하는 방법.
// 불러올때 인스턴스로 만들면 안되고 타입선언하는거 처럼 () 를 제거하고 함.
@DriftDatabase(
  tables: [
    Schedules,
    CategoryColors,
  ],
)

// 이렇게 해놓으면 위에 @DriftDatabase 에서 만들어진 파일에서 상속을 받으면서
// part 'drift_datebase.g.dart'; 에 저장함함
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  // schedule을 insert하는 방법. 프라이머리키를 return 받는다.
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  // 카테고리 색깔을 insert하는법.
  Future<int> createCategoryColor(CategoryColorsCompanion data) =>
      into(categoryColors).insert(data);

  // Select 하는 방법. category color를 가져오는 방법
  Future<List<CategoryColor>> getCategoryColors() =>
      select(categoryColors).get();

  // 이 앱의 버전을 설정해 줘야함.
  @override
  int get schemaVersion => 1;
}

// import 'package:path/path.dart' as p; 를 불러와야함
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // getApplicationDocumentsDirectory()는 아래패키지를 import 해야함
    // import 'package:path_provider/path_provider.dart';
    // dbFolder 라는 String값 안에 전용으로 사용할수 있는 폴더의 위치를 가져올수 있다.
    final dbFolder = await getApplicationDocumentsDirectory();
    // 이게 정보를 저장할 파일임. 불러올때는 dart.io를 불러와야함
    // file이라는 곳에다가 db.sqlite라는 파일을 또 저장해둔거임... ㅜㅜㅜㅜ
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    // import 'package:drift/native.dart'; 를 import 해야함
    return NativeDatabase(file);
  });
}
