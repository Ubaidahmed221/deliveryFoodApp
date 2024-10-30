import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/signup.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController mailController = new TextEditingController();

  String email = "";
  final _formKey = GlobalKey<FormState>();
  resetPassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Email has been send!", style: TextStyle(
        fontSize: 18.0,
      ),)));
    }
    on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user Found for that email", style: TextStyle(
          fontSize: 18.0,
        ),)));

      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 70.0,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Password Recovery",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Enter Your Email",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
             SizedBox(
              height: 60.0,
            ),
            Expanded(
                child: Form(
                  key: _formKey,
                    child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white70, width: 2.0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      controller: mailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle:
                              TextStyle(fontSize: 18.0, color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white70,
                            size: 30.0,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                 
                        GestureDetector(
                          onTap: (){
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                email = mailController.text;
                              });
                              resetPassword();

                            }
                          },
                          child: Container(
                            width: 150,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Send Email",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(height: 50.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),),
                SizedBox(width: 5.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text("Create", style: TextStyle(
                    color: Color.fromARGB(225, 184, 166, 6),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                  ),),
                )
              ],
            ),
                ],
              ),
            ))),
           
          ],
        ),
      ),
    );
  }
}
