import 'package:dio/dio.dart';

class ApiClient{
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.2.9/api/v1"));

  Future<List<dynamic>> fetchOnboarding() async{
    var response = await dio.get("/onboarding/list");
    List<dynamic> data = response.data;
    return data;
  }
}