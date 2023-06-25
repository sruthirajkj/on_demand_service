import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Employee_profileview_ui.dart';

import 'employee_profile.dart';

class EmployeeSighupPage extends StatefulWidget {
  const EmployeeSighupPage({Key? key}) : super(key: key);

  @override
  State<EmployeeSighupPage> createState() => _EmployeeSighupPageState();
}

class _EmployeeSighupPageState extends State<EmployeeSighupPage> {
  TextEditingController employeenamecontroller = TextEditingController();
  TextEditingController employeenumbercontroller = TextEditingController();
  TextEditingController employeepasswordcontroller = TextEditingController();
  TextEditingController employeegmailcontroller = TextEditingController();
  TextEditingController employeeaddresscontroller = TextEditingController();
  var employeekey = GlobalKey<FormState>();

  bool click = false;
  bool click1 = false;
  bool click2 = false;
  bool click3 = false;
  bool section=true;

  File? pickimage;
  uploadimage() async {
    ImagePicker imagepick = ImagePicker();
    XFile? image = await imagepick.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickimage = File(image.path);
      setState(() {

      });
    }
  }

  employeedetails() async
  { try {
    var imagedetails =
        FirebaseStorage.instance.ref().child("image/${pickimage!.path}");
    await imagedetails.putFile(pickimage!);
    var url = await imagedetails.getDownloadURL();
   var login = await FirebaseFirestore.instance.collection("login").add({
     "image": url,
      "name": employeenamecontroller.text,
      "password": employeepasswordcontroller.text,
      "mobile": employeenumbercontroller.text,
      "gmail": employeegmailcontroller.text,
      "type": "employee"
    });
    var employeeid=await FirebaseFirestore.instance.collection("employee").add({
      "name": employeenamecontroller.text,
      "mobile": employeenumbercontroller.text,
      "password": employeepasswordcontroller.text,
      "address": employeeaddresscontroller.text,
      "gmail": employeegmailcontroller.text,
      "deep cleaning":click,
      "car wash":click1,
      "Kitchen cleaning":click2,
      "Loundry":click3,
      "section":true,
      "image": url,
      "type": "employee",
      "loginDocID":login.id




    });
    await employeesharedprf( url, employeeid.id);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return EmployeeProfilePage();
      }),
    );
  }on Exception catch (e) {
    print("error is $e");
    // TODO
  }
  }
  employeesharedprf(String url,eid)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("name", employeenamecontroller.text);
    sharedPreferences.setString("mobile", employeenumbercontroller.text);
    sharedPreferences.setString("gmail", employeegmailcontroller.text);
    sharedPreferences.setString("image",url );
    sharedPreferences.setString("employeeid", eid);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.green,
          )),
      body: Form(
        key: employeekey,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                "Create a new account",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 30, bottom: 20),
              child: Container(
                width: 140,
                height: 140,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        uploadimage();
                      },
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                            image: DecorationImage(fit: BoxFit.cover,
                                image: pickimage == null
                                    ? NetworkImage(
                                    "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png")
                                    : FileImage(pickimage!) as ImageProvider),
                            shape: BoxShape.circle,
                            color: Colors.green),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Icon(
                            Icons.camera_alt,
                            size: 30,
                          )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8, left: 20, right: 20),
              child: SizedBox(
                width: 380,
                child: TextFormField(
                  controller: employeenamecontroller,
                  validator: (n) {
                    if (n!.isEmpty) {
                      return "please enter your name";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    labelText: "Name",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.green)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8, left: 20, right: 20),
              child: SizedBox(
                width: 380,
                child: TextFormField(
                  controller: employeenumbercontroller,
                  validator: (m) {
                    if (m!.length<10) {
                      return "please enter your number";
                    }
                    if (m!.length>10) {
                      return "please enter your number";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your mobile number",
                    labelText: "Mobile",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.green)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8, left: 20, right: 20),
              child: SizedBox(
                width: 380,
                child: TextFormField(
                  controller: employeepasswordcontroller,
                  validator: (p) {
                    if (p!.isEmpty) {
                      return "please enter your password";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Create a password",
                    labelText: "Password",
                    suffixIcon: Icon(Icons.remove_red_eye),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.green)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8, left: 20, right: 20),
              child: SizedBox(
                width: 380,
                child: TextFormField(
                  controller: employeegmailcontroller,
                  validator: (g) {
                    if (g!.isEmpty) {
                      return "please enter your mail id";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Gmail",
                    labelText: "Gmail",
                    suffixIcon: Icon(Icons.mail),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8, left: 20, right: 20),
              child: SizedBox(
                width: 380,
                child: TextFormField(
                  controller: employeeaddresscontroller,
                  validator: (a) {
                    if (a!.isEmpty) {
                      return "please enter your address";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Address",
                    labelText: "Address",
                    suffixIcon: Icon(Icons.location_city),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.green)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    "Section",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      "Deep cleaning",
                      style: TextStyle(fontSize: 16),
                    ),
                    Checkbox(
                        value: click,
                        onChanged: (v) {
                          setState(() {
                            section=true;
                            click = v!;
                          });
                        }),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Car wash",
                      style: TextStyle(fontSize: 16),
                    ),
                    Checkbox(
                        value: click1,
                        onChanged: (w) {
                          setState(() {
                            section=true;
                            click1 = w!;
                          });
                        }),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      "Kitchen cleaning",
                      style: TextStyle(fontSize: 16),
                    ),
                    Checkbox(
                        value: click2,
                        onChanged: (v) {
                          setState(() {
                            section=true;
                            click2 = v!;
                          });
                        }),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Loundry",
                      style: TextStyle(fontSize: 16),
                    ),
                    Checkbox(
                        value: click3,
                        onChanged: (w) {
                          setState(() {
                            section=true;
                            click3 = w!;
                          });
                        }),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 8, left: 12, right: 12),
              child: ElevatedButton(
                onPressed: () async {
                  bool validate = employeekey.currentState!.validate();
                  if (validate == false) {
                    return;
                  }else{
                    if(section==true){

                   await  employeedetails();

                  }}

                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(350, 50),
                  ),
                ),
              ),
            )
          ]),
        )),
      ),
    );
  }
}
