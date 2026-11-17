import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:news/Provider/auth_provider.dart';
import 'package:news/Screen/login.dart';
import 'package:news/Widget/signup_custom.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
   new({super.key});
    TextEditingController _name=TextEditingController();
    TextEditingController email=TextEditingController();
    TextEditingController phone=TextEditingController();
    TextEditingController password=TextEditingController();
    final GlobalKey<FormState> key=GlobalKey();


  @override
  Widget build(BuildContext context) {
    final object=context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up",style:  TextStyle(color: Colors.white,),),backgroundColor: const Color.fromARGB(255, 228, 112, 150),centerTitle: true,),
      body: Consumer<AuthProvider>(
        
        builder: (context, value, child) => 
        Form(
          
          key: key,
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
          children: [
            
            Text("Sign Up",style: TextStyle(color: const Color.fromARGB(255, 218, 32, 94),fontSize: 50),),
            SignupCustom(icon: Icons.account_circle, text: "Name", controler: _name),
             SignupCustom(icon: Icons.email, text: "email", controler: email),
              SignupCustom(icon: Icons.lock, text: "Password", controler: password,suficon: IconButton(onPressed: (){
                value.changevisiblity();
              },icon:Icon(value.isblasabl
                   ? Icons.visibility_off
                    : Icons.visibility,) ),
              ),
               SignupCustom(icon: Icons.phone, text: "Phone", controler: phone),

                 ElevatedButton(onPressed: ()async{
                if(key.currentState!.validate()){
                  await value.Request(name: _name.text,email: email.text,password: password.text,phone: phone.text);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("${object.user!.Massege}",style: TextStyle(color: Colors.white,fontWeight: .bold),)),backgroundColor: const Color.fromARGB(255, 230, 133, 165),));
                  if(object.user!.statuse==true){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                  }

                 
                }
               }, child: Text("Sign Up"),style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 223, 105, 144)),),
                  Row(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .center,
                    children: [
                      Text("Already have account"),
                      TextButton(onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      }, child: Text("Login",style: TextStyle(color: Colors.pink),),style: TextButton.styleFrom(shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20))),)
                    ],
                  ),
               
              
          ],
        )),
       
      ),
    );
  }
}