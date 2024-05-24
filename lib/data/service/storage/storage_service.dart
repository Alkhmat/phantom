import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static Future<List<String>> loadImages(String folderName) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child(folderName);

      // Получаем список всех объектов (изображений) в папке
      final ListResult result = await ref.listAll();

      // Преобразуем список объектов в список URL-адресов изображений
      final List<String> urls = await Future.wait(
        result.items.map((Reference ref) => ref.getDownloadURL()).toList(),
      );

      return urls;
    } catch (e) {
      print("Error loading images: $e");
      return [];
    }
  }
}
