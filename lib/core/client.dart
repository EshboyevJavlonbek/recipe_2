import 'package:dio/dio.dart';

class ApiClient {
  // final home = "192.168.100.132";
  // final najot = "10.10.2.9";
  final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.100.132:8888/api/v1"));

  Future<List<dynamic>> fetchOnboarding() async {
    var response = await dio.get("/onboarding/list");
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<Map<String, dynamic>>> fetchProfileRecipes() async{
    var response = await dio.get("/recipes/list");
    List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(response.data);
    return data;
  }

  Future<Map<String, dynamic>> fetchProfile() async {
    var responseProfile = await dio.get("/auth/details/1");
    return responseProfile.data;
  }
}
