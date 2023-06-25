import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housekeeping/customer_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Employee_profileview_ui.dart';
import 'administrator.dart';
import 'customer_bookingview_ui.dart';
import 'employee_profile.dart';
import 'employee_signup.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  var loginkey = GlobalKey<FormState>();
  
  sharedprf(String url,cid, bool isuser ) async {
    SharedPreferences sharedprf = await SharedPreferences.getInstance();
   await sharedprf.setString("name", usernamecontroller.text);
   await sharedprf.setString("image", url);
   // await sharedprf.setString("customerid", cid);
  isuser == true ?  await sharedprf.setString("customerid", cid):await sharedprf.setString("employeeid", cid);
    // sharedprf.setString("mobile",employeenumbercontroller.text);

  }


  List datas = [];
  customerlogindata() async {
    var logindata = await FirebaseFirestore.instance.collection("login").get();

    logindata.docs.forEach((element)async {
      if (element.data()["name"] == usernamecontroller.text &&
          element.data()["password"] == passwordcontroller.text) {
        if (element.data()["type"] == "customer") {
      var detals =   await FirebaseFirestore.instance.collection("customer").where("loginDocID",isEqualTo: element.id).get();

          sharedprf(element.data()["image"],detals.docs[0].id ,true);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return HomePage();
            }),
          );
        } else {
          if (element.data()["type"] == "employee") {
            var detals =   await FirebaseFirestore.instance.collection("employee").where("loginDocID",isEqualTo: element.id).get();

            sharedprf(element.data()["image"],detals.docs[0].id,false );
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return EmployeeProfilePage();
            }));
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginkey,
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      controller: usernamecontroller,
                      validator: (u) {
                        if (u!.isEmpty) {
                          return "please enter username";
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.green)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        prefixIcon:
                            Icon(Icons.person, color: Colors.greenAccent),
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
                      controller: passwordcontroller,
                      validator: (p) {
                        if (p!.isEmpty) {
                          return "please enter password";
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.green)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
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
                      bool validate = loginkey.currentState!.validate();
                      if (validate == false) {
                        return;
                      } else {
                        if (usernamecontroller.text == "admin" &&
                            passwordcontroller.text == "12121") {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return AdministratorPage();
                            }),
                          );
                        } else {
                          customerlogindata();
                        }
                      }

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
      ),
    );
  }
}
