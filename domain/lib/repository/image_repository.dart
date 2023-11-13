import '../models/image_model.dart';

abstract class RepositoryImage{
  Future<List<ImageModel>> getListImage(int page);
  Future<ImageModel> getDetails(int id);
}