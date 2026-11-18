

import 'package:flutter/widgets.dart';
import 'package:randumuser/Models/auth_model.dart';
import 'package:randumuser/Services/auth_services.dart';

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