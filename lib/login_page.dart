import 'package:flutter/material.dart';
import 'package:housekeeping/customer_signup.dart';

import 'employee_signup.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernamecontrolller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 10),
              child: Text(
                "On Demand ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.blueAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assetfile/cleaning loging1.jpg"))),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, bottom: 10, right: 10, left: 10),
                child: SizedBox(
                  width: 330,
                  child: TextFormField(
                    controller: usernamecontrolller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.green)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      prefixIcon: Icon(Icons.person, color: Colors.greenAccent),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.greenAccent),
                      //labelText: "User name",
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.green),
                      // ),
                      // focusedBorder: UnderlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.green)),
                      // fillColor: Colors.greenAccent,
                      // filled: true),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 30, left: 8, right: 8),
                child: SizedBox(
                  width: 330,
                  child: TextFormField(
                    controller: usernamecontrolller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.green)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      prefixIcon: Icon(Icons.lock, color: Colors.greenAccent),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.greenAccent),
                      //labelText: "password",
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.green),
                      // ),
                      // focusedBorder: UnderlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.green)),
                      // fillColor: Colors.greenAccent,
                      // filled: true),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.greenAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(330, 50),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }),
                    );
                    // Button press action
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?"),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Register Now"),
                            content: Text(
                                "Do you want to register as a user or employee ?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return SignUpPage();
                                      }),
                                    );
                                  },
                                  child: Text(
                                    "user",
                                    style: TextStyle(
                                        color: Colors.greenAccent[700]),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return EmployeeSighupPage();
                                      }),
                                    );
                                  },
                                  child: Text(
                                    "employee",
                                    style: TextStyle(
                                        color: Colors.greenAccent[700]),
                                  ))
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(color: Colors.greenAccent[700]),
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
