import 'package:bake_house/Admin/Pages/AdminPage.dart';
import 'package:bake_house/Pages/HomePage.dart';
import 'package:bake_house/Pages/SignUpPage.dart';
import 'package:bake_house/Services/Authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/AdminAuthentication.dart';

class BakerLoginPage extends StatefulWidget {
  @override
  State<BakerLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<BakerLoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                child: Image.network(
                  'https://www.westend61.de/images/0001447192pw/beautiful-woman-weighing-flour-on-kitchen-scale-for-baking-cake-at-home-MSUF00293.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: Color.fromARGB(255, 218, 214, 214),
                          spreadRadius: 5)
                    ]),
                    height: 50,
                    width: 240,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: username,
                        decoration: const InputDecoration(
                            hintText: "Email", border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: Color.fromARGB(255, 218, 214, 214),
                          spreadRadius: 5)
                    ]),
                    height: 50,
                    width: 240,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: password,
                        decoration: const InputDecoration(
                            hintText: "Password", border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      AdminAuthentication().Login(username.text, password.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminPage()));
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text("Login"),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account click "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: const Text(
                          "Here",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
