import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<void> copyInitialJsonIfNeeded() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/posts_data.json');

  if (!await file.exists()) {
    final rawData = await rootBundle.loadString('lib/database/posts_data.json');
    await file.writeAsString(rawData);
    print('📦 Copied initial JSON to local storage');
  }
}