import 'package:get_storage/get_storage.dart';

class LocalStorage {
  // إنشاء مثيل ثابت للفئة
  static final LocalStorage _instance = LocalStorage._internal();

  // استخدام factory constructor لإنشاء مثيل للفئة
  factory LocalStorage() {
    return _instance;
  }

  // الإنشاء الداخلي للمثيل
  LocalStorage._internal();

  // متغير لتخزين مثيل GetStorage
  final _storage = GetStorage();

  // طريقة عامة لحفظ البيانات
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // طريقة عامة لقراءة البيانات
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // طريقة عامة لإزالة البيانات
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // مسح جميع البيانات في التخزين
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
