import 'package:get_it/get_it.dart';

import 'local_storage_service.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final storageService = LocalStorageService();
  await storageService.init();
  locator.registerSingleton<LocalStorageService>(storageService);
}
