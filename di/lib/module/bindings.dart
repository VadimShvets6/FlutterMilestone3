
import 'package:data/repository/repositpry_image_impl.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/image_repository.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings{

  @override
  Future<void> dependencies() async{
    Get.lazyPut(()=>ApiService(Dio()),fenix: true);
    Get.put<RepositoryImage>(RepositoryImageImpl(), tag: "repo");
  }
}