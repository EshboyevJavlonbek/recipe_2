import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.2.9:8888/api/v1"));

  Future<List<dynamic>> fetchOnboarding() async {
    var response = await dio.get("/onboarding/list");
    List<dynamic> data = response.data;
    return data;
  }

  Future<Map<String, dynamic>> fetchProfile() async {
    var responseProfile = await dio.get("/auth/details/1");

    return responseProfile.data;
  }
}
