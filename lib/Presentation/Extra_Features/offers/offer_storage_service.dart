import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class OfferStorageService {
  static const String fileName = 'post_data.json';
  static const String assetPath = 'lib/database/post_data.json';

  Future<String> getLocalFilePath() async {
    final file = await _localFile;
    return file.path;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  /// First-time run: copy from asset to writable app directory
  Future<void> initLocalCopyIfNeeded() async {
    final file = await _localFile;
    if (!await file.exists()) {
      final rawData = await rootBundle.loadString(assetPath);
      await file.writeAsString(rawData);
      print('📦 Copied $fileName to local storage.');
    }
  }

  /// Toggle isLiked and persist to file
  Future<void> updateIsLiked(String id, bool isLiked) async {
    final file = await _localFile;
    if (!await file.exists()) {
      print("⚠ JSON file not found at expected location");
      return;
    }

    final contents = await file.readAsString();
    final Map<String, dynamic> data = jsonDecode(contents);

    for (final category in data.values) {
      if (category is List) {
        for (final item in category) {
          if (item['id'] == id) {
            item['isLiked'] = isLiked;
          }
        }
      }
    }

    await file.writeAsString(jsonEncode(data));
    print("✅ Updated $id to isLiked=$isLiked");
  }
}