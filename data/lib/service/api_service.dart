import 'package:data/models/image_api.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://mobile-shop-api.hiring.devebs.net/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('products')
  Future<ImageResponse> getImages(@Query("page") int page);

  @GET('products/{id}')
  Future<ImageAPI> getDetails(@Path("id") int id);
}
