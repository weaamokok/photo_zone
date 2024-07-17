import 'package:hive_flutter/hive_flutter.dart';

import 'package:photo_zone/local_storage/local_storage.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();

  LocalStorageSetup(Hive);
}
