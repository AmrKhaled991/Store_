// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class Apimanger {
  Dio dio;
  Apimanger({
    required this.dio,
  });
  static const String baseurl = 'https://route-ecommerce.onrender.com/api/v1/';
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var res = await dio.get("$baseurl$endPoint");
    return res.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Object data}) async {
    var res = await dio.post("$baseurl$endPoint", data: data);
    return res.data;
  }

  Future<Map<String, dynamic>> Stripepost(
      {required String token,
      required json,
      required String endpoint,
      String? version,
      heders}) async {
    var res = await dio.post(endpoint,
        data: json,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: heders ??
              {
                'Authorization': 'Bearer $token',
              },
        ));
    print(res.statusCode);
    return res.data;
  }
}
