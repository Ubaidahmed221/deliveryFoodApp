
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/botttom_nav.dart';
import 'package:fooddeliveryapp/pages/forgetPassword.dart';
import 'package:fooddeliveryapp/pages/signup.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override

  String email = "", password = "";

  final _formkey = GlobalKey<FormState>();

  TextEditingController useremailcontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();

  UserLogin() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav()));

    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No User Found For That Email", style: TextStyle(fontSize: 18, color: Colors.black),
        )));

      }else if(e.code == 'wrong-password'){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wrong Password Provided By User", style: TextStyle(fontSize: 18, color: Colors.black),
        )));

      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(child:
       Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/2.5,
          decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
            Color(0xFFff5c30), Color(0xFFe74b1a),
          ])),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white, borderRadius:  BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Text(""),
        ),
        Container(
          margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          child: Column(children: [
            Center(child: Image.asset("images/logo.png", width: MediaQuery.of(context).size.width/1.5, fit: BoxFit.cover,)),
           SizedBox(height: 50.0,),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.8,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                    SizedBox(height: 30.0,),
                    Text("Login", style: AppWidget.HeadLineTextFeildStyle(),),
                    SizedBox(height: 30.0,),
                    TextFormField(
                      controller: useremailcontroller,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please Enter Email';

                        }
                         String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        RegExp regExp = RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return 'Please Enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: 'Email', hintStyle: AppWidget.SemiBoldTextFeildStyle(), 
                      prefixIcon: Icon(Icons.email_outlined)
                      ),
                    ),
                    
                     SizedBox(height: 30.0,),
                    TextFormField(
                        controller: userpasswordcontroller,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please Enter Password';

                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Password', hintStyle: AppWidget.SemiBoldTextFeildStyle(), 
                      prefixIcon: Icon(Icons.password_outlined)
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPassword()));
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text("Forget Password ", style: AppWidget.SemiBoldTextFeildStyle(),)),
                    ),
                       SizedBox(height: 80.0,),
                      GestureDetector(
                        onTap: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              email = useremailcontroller.text.trim();
                              password = userpasswordcontroller.text.trim();
                            });

                          }
                          UserLogin();
                        },
                        child: Material(
                          elevation: 5.0,
                           borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            width: 200,
                            decoration: BoxDecoration(color: Color(0xffff5722), borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: "Poppins" , fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ),
                                 ],),
                ),
              ),
            ),
              SizedBox(height: 50.0,), 
               GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                },
                child: Text("Don't have an account? sign up", style: AppWidget.SemiBoldTextFeildStyle(),)) 
                
          ],),
        )
      ],),),
    );
  }
}