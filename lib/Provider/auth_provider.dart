import 'package:material_ui/material_ui.dart';
import 'package:news/Models/auth_model.dart';
import 'package:news/Services/auth_services.dart';

class AuthProvider extends ChangeNotifier
{
    Auth ?user;
    bool isblasabl=true;
    Future<void> Request({required String name, required String email, required String password, required String phone})async{
      user=await AuthServices.Signup( name: name, email: email, password: password, phone: phone);
    }

    Future <void>Requestlogin({ required String password, required String email,})async{
      user=await AuthServices.Login(password: password, email: email);
    }
    void changevisiblity(){
      isblasabl=!isblasabl;
      notifyListeners();
    }
}