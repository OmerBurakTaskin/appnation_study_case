import 'dart:io';

import 'package:flutter/material.dart';

class DogEntity {
  final String? name;
  final String? imageUrl;
  final File? localImage;
  final List<String>? subBreeds;

  DogEntity({this.imageUrl, this.localImage, this.name, this.subBreeds});

  DogEntity copyWith({File? localImage}) => DogEntity(
      name: name,
      imageUrl: imageUrl,
      localImage: localImage,
      subBreeds: subBreeds);

  ImageProvider getImageProvider() {
    if (localImage != null) {
      return FileImage(localImage!);
    }
    return NetworkImage(imageUrl!);
  }
}
