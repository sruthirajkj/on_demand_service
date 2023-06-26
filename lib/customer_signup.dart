import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController gmailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  var userkey = GlobalKey<FormState>();
  File? pickImage;
  pickedimage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickImage = File(image.path);
      setState(() {
        // customerdetails();
      });
    }
  }

  customerdetails() async {
    try {
      var imagedetails = await FirebaseStorage.instance
          .ref()
          .child("image/${pickImage!.path}");
      await imagedetails.putFile(pickImage!);
      var url = await imagedetails.getDownloadURL();
     var login1= await FirebaseFirestore.instance.collection("login").add({
        "image": url,
        "name": usernamecontroller.text,
        "password": passwordcontroller.text,
        "mobile": numbercontroller.text,
        "gmail": gmailcontroller.text,
        "type": "customer",
      });
      print("image");
    var customerid=  await FirebaseFirestore.instance.collection("customer").add({
        "name": usernamecontroller.text,
        "mobile": numbercontroller.text,
        "password": passwordcontroller.text,
        "gmail": gmailcontroller.text,
        "address": addresscontroller.text,
        "image": url,
        "type": "customer",
      "loginDocID":login1.id
      });
      await sharedprf(url,customerid.id);
      //print()

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return HomePage();
        }),
      );
    } on Exception catch (e) {
      print("error is $e");
      // TODO
    }
  }

  sharedprf(String url,cid) async {
    SharedPreferences sharedprf = await SharedPreferences.getInstance();
   await sharedprf.setString("name", usernamecontroller.text);
  await  sharedprf.setString("address", addresscontroller.text);
   await sharedprf.setString("image", url);
   await sharedprf.setString("customerid", cid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: userkey,
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
                        pickedimage();
                      },
                      child: Container(
                        width: 140,
                        height: 140,
                        //child: Image.file(pickImage!),
                        decoration: BoxDecoration(
                            image: DecorationImage(fit: BoxFit.cover,
                                image: pickImage == null
                                    ? NetworkImage(
                                        "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png")
                                    : FileImage(pickImage!) as ImageProvider),
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
                  controller: usernamecontroller,
                  validator: (u) {
                    if (u!.isEmpty) {
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
                  controller: numbercontroller,
                  validator: (m) {
                    if (m!.length > 10) {
                      return "please enter your number";
                    }
                    if (m.length < 10) {
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
                  controller: passwordcontroller,
                  validator: (p) {
                    if (p!.isEmpty) {
                      return "please enter a password";
                    }
                    if (p!.length > 8) {
                      return "please enter valid password";
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
                  controller: gmailcontroller,
                  validator: (g) {
                    if (g!.isEmpty) {
                      return "please enter a password";
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
                  controller: addresscontroller,
                  validator: (a) {
                    if (a!.isEmpty) {
                      return "please enter a password";
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
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 8, left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  bool validate = userkey.currentState!.validate();
                  if (validate == false) {
                    return;
                  }
                  customerdetails();
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
                    Size(380, 50),
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

