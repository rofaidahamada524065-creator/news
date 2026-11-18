import 'package:dio/dio.dart';
import 'package:randumuser/Models/auth_model.dart';


class AuthServices {
  static Dio dio =Dio();
  static Future<Auth> Signup({ required String name, required String email, required String password, required String phone})async
  {
   try{
     Response response =await dio.post("https://elsewedyteam.runasp.net/api/Register/AddUser",
    data: 
    {
    
        "name": name,
        "phone": phone,
        "password": password,
        "email": email,
    });
    return Auth.fromjson(response.data);
   }on DioException catch(m){
    throw Exception(m.message);
   }catch(other){
    throw Exception("Error : ${other.toString()}");
   }
  }

  static Future<Auth> Login({ required String password, required String email,})async
  {
    Response e=await dio.post("https://elsewedyteam.runasp.net/api/Login/CheckUser",
    data: {
       "password": password,
        "email": email,
    }
  
    );
    return Auth.fromjson(e.data);
  }
}