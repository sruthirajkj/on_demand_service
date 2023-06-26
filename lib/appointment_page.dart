import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'customer_payment.dart';
import 'home_page.dart';
import 'homepage_ui.dart';
import 'login_page.dart';

class AppoinmentPage extends StatefulWidget {
  // const AppoinmentPage({Key? key}) : super(key: key);
  String? image;
  String? name;
  bool? carwash;
  bool? kitchencleaning;
  bool? loundry;
  bool? deepcleaning;
  String? employeeid;
  AppoinmentPage({
    required this.image,
    required this.name,
    required this.carwash,
    required this.kitchencleaning,
    required this.loundry,
    required this.deepcleaning,
    required this.employeeid,
  });

  @override
  State<AppoinmentPage> createState() => _AppoinmentPageState();
}

class _AppoinmentPageState extends State<AppoinmentPage> {
  var date = '';
  var time = '';
  var location = '';
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  shredprefcustomerid() async {
    final SharedPreferences idcustomer = await SharedPreferences.getInstance();
    var n = await idcustomer.getString("customerid");
    //print(n);
    setState(() {
      custmid = n;
    });
  }

  String? custmid;
  @override
  void initState() {
    // TODO: implement initState
    shredprefcustomerid();
    super.initState();
  }

  appointmentdetails() async {
    try {

      FirebaseFirestore.instance.collection("Appointment").add({
        "address": addresscontroller.text,
        "time": timecontroller.text,
        "date": datecontroller.text,
        "employeeId": widget.employeeid,
        "customerId": custmid,
        "status":"pending",
        "amount":"notpayed",
        "payment":"300",
      });
    } catch (e) {
      print(e);
    }
  }



  datepick() async {
    DateTime? pickeddate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));

    if(pickeddate!=null){setState(() {
      date = pickeddate.toString();
    });}

  }


  timepick() async {
    TimeOfDay? pickedtime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      time = pickedtime.toString();
    });
  }
  var appointmentkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: BackButton(color: Colors.green),
        title: Text(
          "Create your appointment",
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: appointmentkey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Text(
                widget.name.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(widget.image!)))),
            ),
            widget.carwash == true
                ? Text(
                    "Car Wash ",
                    style: TextStyle(fontSize: 20),
                  )
                : widget.loundry == true
                    ? Text("Loundry", style: TextStyle(fontSize: 20))
                    : widget.kitchencleaning == true
                        ? Text(
                            "Kitchen Cleaning",
                            style: TextStyle(fontSize: 20),
                          )
                        : widget.deepcleaning == true
                            ? Text(
                                "Deep Cleaning",
                                style: TextStyle(fontSize: 20),
                              )
                            : Text(""),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
              child: TextFormField(
                controller: addresscontroller,
                validator: (u) {
                  if (u!.isEmpty) {
                    return "please enter your address";
                  }
                },

                decoration: InputDecoration(
                  hintText: "Address",
                  labelText: "Address",
                  suffixIcon: Icon(Icons.location_city_outlined),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.green)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
              child: TextFormField(
                onTap: () {


                    datepick();

                    datecontroller.text = date;

                  print(custmid);
                },
                readOnly: true,
                controller: datecontroller,
                validator: (u) {
                  if (u!.isEmpty) {
                    return "please select a date";
                  }
                },
                decoration: InputDecoration(
                  hintText: "Date",
                  labelText: "Date",
                  suffixIcon: Icon(Icons.date_range),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.green)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 2, left: 20, right: 20),
              child: TextFormField(
                controller: timecontroller,
                validator: (u) {
                  if (u!.isEmpty) {
                    return "please enter time";
                  }
                },
                readOnly: true,
                onTap: () {
                  setState(() {
                    timepick();
                    timecontroller.text = time;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Time",
                  labelText: "Time",
                  suffixIcon: Icon(Icons.timelapse),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.green)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: InkWell(
                    onTap: () { bool validate = appointmentkey.currentState!.validate();
                    if (validate == false) {
                      return;

                    }else{
                      appointmentdetails();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "successful",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),actions: [ TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return LoginPage();
                                  }),
                                );
                              },
                              child: Text(
                                "ok",
                                style: TextStyle(
                                    color: Colors.greenAccent[700]),
                              )),],
                          );
                        },
                      );

                    }


                    },
                    child: Container(
                      height: 50,
                      width: 350,
                      child: Center(child: Text("Book Now")),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 350,
                      child: Center(child: Text("Cancel")),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
