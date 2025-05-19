import 'package:app_nation_case/core/di/di.dart';
import 'package:app_nation_case/core/helper/helper_methods.dart';
import 'package:app_nation_case/core/routes/app_routes.dart';
import 'package:app_nation_case/data/entities/dog_entity.dart';
import 'package:app_nation_case/data/services/network/connection_dialog_service.dart';
import 'package:app_nation_case/data/services/dog/dog_service.dart';
import 'package:flutter/material.dart';

class DogRepository {
  Future<List<DogEntity>> fetchDogs() async {
    await locator<ConnectionDialogService>().checkConnectionAndShowDialog();

    try {
      return await locator<DogService>().getAllDogBreeds();
    } catch (e) {
      printIfDebug("Error while fetching dogs: $e");
      return [];
    }
  }

  Future<String> fetchRandomDogImage(String breed) async {
    await locator<ConnectionDialogService>().checkConnectionAndShowDialog(
        onCancel: () => Navigator.pop(navigatorKey.currentContext!));
    try {
      return await locator<DogService>().randomImageUrlofDog(breed);
    } catch (e) {
      printIfDebug("Error while fetching random dog image: $e");
      return "";
    }
  }
}
