import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class EmployeeProfilePage extends StatefulWidget {
  const EmployeeProfilePage({Key? key}) : super(key: key);

  @override
  State<EmployeeProfilePage> createState() => _EmployeeProfilePageState();
}

class _EmployeeProfilePageState extends State<EmployeeProfilePage> {
  employeeshrdprfDisply() async {
    SharedPreferences sherdprff = await SharedPreferences.getInstance();
    var nm = await sherdprff.getString("name");
    var im = await sherdprff.getString("image");
    var num = await sherdprff.getString("mobile");
    var mail= await sherdprff.getString("gmail");
    var id = await sherdprff.getString("employeeid");
    print(id);

    setState(() {
      names = nm;
      img = im;
      mob = num;
      ml=mail;
      ids = id;
    });
  }

  String? names;
  String? img;
  String? mob;
  String?ml;
  String? ids;
  @override
  void initState() {
    // TODO: implement initState
    employeeshrdprfDisply();
    super.initState();
  }

  bookingAccept(String id) async {
    await FirebaseFirestore.instance
        .collection("Appointment")
        .doc(id)
        .update({"status": "accepted"});
  }

  bookingreject(String id) async {
    await FirebaseFirestore.instance
        .collection("Appointment")
        .doc(id)
        .update({"status": "reject"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.greenAccent, actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }),
              );
            },
            child: Text(
              "Exit",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          )
        ]),
        body: SafeArea(
          child: Column(
            
            children: [
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("employee")
                        .doc(ids)
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            snapshot.data!.data()["image"]))),
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0, left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    snapshot.data!.data()["name"].toString(),
                                    //names!,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    snapshot.data!.data()["gmail"].toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    snapshot.data!.data()["mobile"].toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      } else
                        return Text("");
                    }),
              ),
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Appointment")
                        .where("employeeId", isEqualTo: ids).snapshots(),
                    builder: (context, snapshot) {
                     // print(ids);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8, left: 20, right: 20),
                                  child: ListTile(
                                    leading: SizedBox(
                                      width: 200,
                                      child: StreamBuilder(
                                          stream: FirebaseFirestore.instance
                                              .collection("customer")
                                              .doc(snapshot.data!.docs[index]
                                                  .data()["customerId"])
                                              .snapshots(),
                                          builder: (context,
                                              AsyncSnapshot snapshot1) {
                                            print(
                                                "sss ${snapshot.data!.docs[index].id.toString()}");

                                            if (snapshot1.hasData) {
                                              return Text(
                                                snapshot1.data!
                                                    .data()["name"]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20),
                                              );
                                            } else
                                              return Text("");
                                          }),
                                    ),

                                    trailing:snapshot.data!.docs[index].data()["status"]=="pending"? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              var id = snapshot
                                                  .data!.docs[index].id
                                                  .toString();
                                              await bookingAccept(id);
                                            },
                                            child: Container(
                                              height: 20,
                                              width: 80,
                                              child:
                                                  Center(child: Text("Accept")),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                      color: Colors.green,
                                                      width: 1)),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var id = snapshot
                                                  .data!.docs[index].id
                                                  .toString();
                                              await bookingreject(id);
                                            },
                                            child: Container(
                                              height: 20,
                                              width: 80,
                                              child:
                                                  Center(child: Text("Reject")),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                      color: Colors.green,
                                                      width: 1)),
                                            ),
                                          )
                                        ]):snapshot.data!.docs[index]["status"]=="reject"? Text("Rejected"):Text("accepted"),
                                  ),
                                ),
                              );
                            });
                      } else
                        return Text("");
                    }),
              )
            ],
          ),
        ));
  }
}
