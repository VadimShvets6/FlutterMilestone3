import 'dart:io';

import 'package:domain/models/image_model.dart';
import 'package:domain/repository/image_repository.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  final RepositoryImage repositoryImage = Get.find(tag: "repo");

  final RxList<ImageModel> list = <ImageModel>[].obs;
  bool loading = false;
  int currentPage = 1;

  Future<void> getListImage(int page) async {
    try {
      loading = true;
      final images = await repositoryImage.getListImage(page);
      if (images.isNotEmpty) {
        list.addAll(images);
      }
    } finally {
      loading = false;
    }
  }

  void getMore() {
    getListImage(++currentPage);
  }
}