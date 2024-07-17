import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:photo_zone/local_storage/local_storage.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

final GetIt locator = GetIt.instance;

Future<void> init() async {
  locator.registerSingleton<LocalStorage>(
      LocalStorage(localStorage: LocalStorageSetup(Hive)));
}
