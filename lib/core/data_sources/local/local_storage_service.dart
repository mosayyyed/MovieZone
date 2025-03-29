abstract class LocalStorageService {
  Future<void> saveData(String key, dynamic value);
  dynamic getData(String key, {dynamic defaultValue});
  Future<void> deleteData(String key);
  Future<void> clearAll();
}
