import 'package:app_nation_case/data/repositories/dog_repository.dart';
import 'package:app_nation_case/data/services/network/connection_dialog_service.dart';
import 'package:app_nation_case/data/services/dog/dog_service.dart';
import 'package:app_nation_case/data/services/network/network_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<DogService>(DogService());
  locator.registerSingleton<NetworkService>(NetworkService());
  locator.registerSingleton<ConnectionDialogService>(ConnectionDialogService());
  locator.registerSingleton<DogRepository>(DogRepository());
}
