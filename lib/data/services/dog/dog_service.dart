import 'dart:io';
import 'package:app_nation_case/core/constants/api/api_constants.dart';
import 'package:app_nation_case/core/di/di.dart';
import 'package:app_nation_case/core/helper/helper_methods.dart';
import 'package:app_nation_case/data/entities/dog_entity.dart';
import 'package:app_nation_case/data/services/network/network_service.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DogService {
  Future<List<DogEntity>> getAllDogBreeds() async {
    final Directory baseDirectory = await getApplicationCacheDirectory();

    final listAllDogsEndPoint = "${ApiConstants.dogBreedsBaseUrl}list/all";

    final imagesResponse = await locator<NetworkService>().dio.get(
        listAllDogsEndPoint,
        options: Options(responseType: ResponseType.json));

    if (imagesResponse.statusCode != 200) {
      throw Exception("Error while fetching all dog breeeds.");
    }

    final responseData = imagesResponse.data;
    printIfDebug("Dogs fetched, data: $responseData");

    final dogsMap = responseData["message"] as Map<String, dynamic>;

    List<Future<DogEntity>> dogFutures = dogsMap.entries.map((entry) {
      final breed = entry.key;
      final subBreeds = List<String>.from(entry.value);
      return _createDogEntity(breed, subBreeds, baseDirectory);
    }).toList();

    final dogs = await Future.wait(dogFutures);
    return dogs;
  }

  Future<DogEntity> _createDogEntity(
      String breed, List<String> subBreeds, Directory directory) async {
    final randomImageUrl = await randomImageUrlofDog(breed);
    final imageFile = await _cachedDogImage(breed, randomImageUrl, directory);
    return DogEntity(
        localImage: imageFile,
        imageUrl: randomImageUrl,
        name: breed,
        subBreeds: subBreeds);
  }

  Future<String> randomImageUrlofDog(String breed) async {
    String randomImageUrl =
        "${ApiConstants.dogBreedBaseUrl}$breed/images/random";
    final randomImageResponse = await locator<NetworkService>()
        .dio
        .get(randomImageUrl, options: Options(responseType: ResponseType.json));
    if (randomImageResponse.statusCode != 200) {
      throw Exception("Error while fetching random image of breed: $breed");
    }
    return randomImageResponse.data["message"] as String;
  }

  Future<File> _cachedDogImage(
      String breed, String url, Directory directory) async {
    String unicPath = "${directory.path}/${breed}_image.jpg";
    File file = File(unicPath);

    if (await file.exists()) return file;

    final response = await locator<NetworkService>()
        .dio
        .get(url, options: Options(responseType: ResponseType.bytes));

    if (response.statusCode != 200) {
      throw Exception("Error while getting dog $breed image of url: $url");
    }

    await file.create(recursive: true);
    await file.writeAsBytes(response.data);
    return file;
  }
}
