import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<void> saveData(String key, dynamic value);
  dynamic getData(String key, {dynamic defaultValue});
  Future<void> deleteData(String key);
  Future<void> clearAll();
}

class UserLocalStorageService extends LocalStorageService {
  @override
  Future<void> saveData(String key, dynamic value) async {
    await SharedPreferences.getInstance()
        .then((value) => value.setString(key, value.toString()));
  }

  @override
  dynamic getData(String key, {dynamic defaultValue}) {
    return SharedPreferences.getInstance()
        .then((value) => value.getString(key));
  }

  @override
  Future<void> deleteData(String key) async {
    await SharedPreferences.getInstance().then((value) => value.remove(key));
  }

  @override
  Future<void> clearAll() async {
    await SharedPreferences.getInstance().then((value) => value.clear());
  }
}
