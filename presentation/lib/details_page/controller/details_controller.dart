import 'package:domain/models/image_model.dart';
import 'package:domain/repository/image_repository.dart';
import 'package:get/get.dart';

class DetailsPageController extends GetxController {
  final RepositoryImage repositoryImage = Get.find(tag: "repo");

  final loading = false.obs;
  final details = Rxn<ImageModel>();

  Future<void> getDetails(int id) async {
    try {
      loading.value = true;
      details.value = await repositoryImage.getDetails(id);
    } catch (e) {
      details.value = null;
    } finally {
      loading.value = false;
    }
  }


  @override
  void onClose() {
    details.value = null;
    super.onClose();
  }
}
