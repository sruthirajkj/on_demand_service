

import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'customer_payment.dart';
import 'home_page.dart';

class AppoinmentPage extends StatefulWidget {
  const AppoinmentPage({Key? key}) : super(key: key);

  @override
  State<AppoinmentPage> createState() => _AppoinmentPageState();
}

class _AppoinmentPageState extends State<AppoinmentPage> {
  var date = '';
  var time = '';
  var location = '';
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  locationpick() async {
    LocationData? locations = await Location().getLocation();
    setState(() {
      location = locations.longitude.toString();
    });
  }

  datepick() async {
    DateTime? pickeddate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
    setState(() {
      date = pickeddate.toString();
    });
  }

  timepick() async {
    TimeOfDay? pickedtime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      time = pickedtime.toString();
    });
  }

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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assetfile/office-desk-cleaning.jpg")))),
          ),
          Text(
            "cleaning type ",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
            child: TextFormField(
              controller: locationcontroller,
              readOnly: true,
              onTap: () {
                locationpick();
                locationcontroller.text = location;
              },
              decoration: InputDecoration(
                hintText: "Location",
                labelText: "Location",
                suffixIcon: Icon(Icons.location_on),
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
              },
              readOnly: true,
              controller: datecontroller,
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
                const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
            child: TextFormField(
              controller: timecontroller,
              readOnly: true,
              onTap: () {
                timepick();
                timecontroller.text = time;
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
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "successful",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        );
                      },
                    );
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) {
                    //     return UserPaymentPage();
                    //   }),
                    // );
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
                padding: const EdgeInsets.only(top: 30.0),
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
    );
  }
}
