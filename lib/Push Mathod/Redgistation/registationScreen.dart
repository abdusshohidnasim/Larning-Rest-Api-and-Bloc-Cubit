import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Registationscreen extends StatefulWidget {
  const Registationscreen({super.key});


  @override
  State<Registationscreen> createState() => _RegistationscreenState();
}

class _RegistationscreenState extends State<Registationscreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  
  void Loging (String email,password)async{
    try{
      Response response = await post(Uri.parse(("https://reqres.in/api/register")),body: {
        "email": email,
        "password":password,
      });
      if(response.statusCode == 200){
        print(response.statusCode);
      }
      else{
        print("faild");
      }
    }catch(e){
      print(e.toString());
      
    }

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
            hintText: "Email"
          ),),SizedBox(height: 30,),
          TextFormField(
            controller: passwordEditingController,
            decoration: InputDecoration(

            hintText: "password"
          ),),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Loging(textEditingController.text.toString(), passwordEditingController.text.toString());
            },
            child: Container(
              height: 50,
              child: Center(child: Text("Sign up"),),decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(15)),),
          )
          

        ],),
      ),
    );
  }
}
