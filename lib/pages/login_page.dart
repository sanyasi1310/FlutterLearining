import 'package:flutter/material.dart';
import 'package:flutter_catalog/Utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Image.asset(
                "assets/images/undraw_secure_login_pdn4.png",
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Welcome",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username should not be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
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
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: changeButton
                                ? BorderRadius.circular(25)
                                : BorderRadius.circular(7)),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(
                    //     foregroundColor: Colors.white,
                    //     minimumSize: Size(150, 40),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  moveToHome(BuildContext context) async {
    setState(() {
      changeButton = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton = false;
    });
  }
}
