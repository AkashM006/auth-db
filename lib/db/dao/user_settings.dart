import 'dart:convert';

import 'package:auth/db/database.dart'; // import main database file
import 'package:auth/db/schema/user_setting.dart';
import 'package:drift/drift.dart'; // also import drift for all functions

part 'user_settings.g.dart';

@DriftAccessor(tables: [UserSettings]) // tables used in the current DAO
class UserSettingsDao extends DatabaseAccessor<AppDatabase>
    with _$UserSettingsDaoMixin {
  UserSettingsDao(super.db);

  Future<UserSetting?> getSettings() async {
    //   final row = await AppDb.database.userSettingsDao.findRowById(0);
    // if (row != null) {
    //   return jsonDecode(row.settings) as Map<String, dynamic>;
    // } else {
    //   return null;
    // }
    final query = select(userSettings)
      ..where(
        (tbl) => tbl.id.equals(0),
      );
    final result = await query.getSingleOrNull();
    print('Result: $result');
    return result;
  }

//  Future<List<Task>> getTasks() async { Mention different functions like this,
//   return await select(tasks).get();    which can be called later from flutter code
//  }
}
