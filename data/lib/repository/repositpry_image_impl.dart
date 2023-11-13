import 'package:data/models/image_api.dart';
import 'package:data/service/api_service.dart';
import 'package:domain/models/image_model.dart';
import 'package:domain/repository/image_repository.dart';
import 'package:get/get.dart';

class RepositoryImageImpl extends RepositoryImage {
  final ApiService apiService = Get.find();

  @override
  Future<List<ImageModel>> getListImage(int page) async {
    final ImageResponse images = await apiService.getImages(page);
    final List<ImageModel> resultList = images.results
        .map((it) =>
            ImageModel(id: it.id, imageUrl: it.imageUrl, nameDevice: it.nameDevice, description: it.description))
        .toList();
    return resultList;
  }

  @override
  Future<ImageModel> getDetails(int id) async {
    final details = await apiService.getDetails(id);
    return ImageModel(
        id: details.id, imageUrl: details.imageUrl, nameDevice: details.nameDevice, description: details.description);
  }
}
