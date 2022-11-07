import 'package:bake_house/Services/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: Container(
                child: Center(
                    child: Container(
              color: Color.fromARGB(179, 209, 205, 205),
              height: 600,
              width: 500,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      color: Colors.white,
                      height: 30,
                      width: 200,
                      child: TextField(
                        controller: name,
                        decoration:
                            const InputDecoration(hintText: "Full Name"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      height: 30,
                      width: 200,
                      child: TextField(
                        controller: email,
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      height: 30,
                      width: 200,
                      child: TextField(
                        controller: number,
                        decoration:
                            const InputDecoration(hintText: "Mobile Number"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      height: 30,
                      width: 200,
                      child: TextField(
                        controller: address,
                        decoration: const InputDecoration(hintText: "Address"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      height: 30,
                      width: 200,
                      child: TextField(
                        controller: password,
                        decoration: const InputDecoration(hintText: "Password"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Authentication auth = Authentication();
                        auth.SignUp(name.text, email.text, number.text,
                            address.text, password.text);
                      },
                      child: Container(
                        color: Colors.blue,
                        height: 40,
                        width: 70,
                        alignment: Alignment.center,
                        child: const Text("Sign Up"),
                      ),
                    )
                  ]),
            )))));
  }
}
