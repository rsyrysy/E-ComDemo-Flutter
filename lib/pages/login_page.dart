import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/utils/MyRoutes.dart';

import 'package:test1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey=GlobalKey<FormState>();
  moveToHome(BuildContext context)
    async {
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        changeButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
          children: [
              Image.asset(
                "assets/images/hey.png",
                fit: BoxFit.cover,
                height:100 ,
                width: 100,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter User name ", labelText: "User Name"),
                      validator: (value){
                        if(value!.isEmpty)
                          {
                            return "User name  can not be empty";
                          }
                        return null;
                      },

                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return "Password  can not be empty";
                        }
                       else if(value.length<6)
                        {
                          return "Password  length should be at least 6 char";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Password ", labelText: "Password"),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: context.theme.buttonColor,
                      // shape:
                      //   changeButton ? BoxShape.circle : BoxShape.rectangle,
                      borderRadius:
                      BorderRadius.circular(changeButton ? 50 : 8),

                      child: InkWell(
                        onTap: ()=>moveToHome(context) ,
                        child: AnimatedContainer(
                          width: changeButton ? 50 : 150,
                          height: 40,
                          alignment: Alignment.center,
                          duration: Duration(seconds: 1),
                          child: changeButton ? Icon(
                              Icons.done,
                            color: Colors.white,
                          )
                          : Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /* ElevatedButton(
                        child: Text("Login"),
                        style:TextButton.styleFrom(minimumSize: Size(150,40)),
                          onPressed: (){
                           Navigator.pushNamed(context, MyRoutes.homeRoute);
                          },
                      )*/
                  ],
                ),
              )
          ],
        ),
            )));
  }
}
