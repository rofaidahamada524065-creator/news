import 'package:dio/dio.dart';
import 'package:randumuser/Models/news_model.dart';

class NewsServices {
  static Dio dio = Dio();
  static Future<NewsModel> Getdata() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY",
      );
      return NewsModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (oth) {
      throw Exception("Erorr : ${oth.toString()}");
    }
  }
}
