import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'customer_payment.dart';

class CustomerBookingHistory extends StatefulWidget {
  const CustomerBookingHistory({Key? key}) : super(key: key);

  @override
  State<CustomerBookingHistory> createState() => _CustomerBookingHistoryState();
}

class _CustomerBookingHistoryState extends State<CustomerBookingHistory> {
  customershrdprf() async {
    SharedPreferences sherdprff = await SharedPreferences.getInstance();
    var id = await sherdprff.getString("customerid");
    setState(() {
      idc = id;
    });
  }

  String? idc;
  String? ide;
  payment(String id) async {
    await FirebaseFirestore.instance
        .collection("Appointment")
        .doc(id)
        .update({"amount": "notpayed"});
  }

  payed(String id) async {
    await FirebaseFirestore.instance
        .collection("Appointment")
        .doc(id)
        .update({"amount": "payed"});
  }

  @override
  void initState() {
    customershrdprf();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: BackButton(color: Colors.green),
        title: Text(
          "History",
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Appointment")
                  .where("customerId", isEqualTo: idc)
                  .snapshots(),
              builder: (context, snapshot) {
                print(idc);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                          child: Container(
                            decoration: UnderlineTabIndicator(
                                borderSide:
                                    BorderSide(color: Colors.green, width: .4)),
                            child: Column(children: [
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("employee")
                                      .doc(snapshot.data!.docs[index]
                                          .data()["employeeId"])
                                      .snapshots(),
                                  builder: (context, AsyncSnapshot snapshot1) {
                                   // print(ide);
                                    if (snapshot1.hasData) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Employee name:",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                              snapshot1.data
                                                  .data()["name"]
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Service type:",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  )),
                                              Text("service ",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      );
                                    } else
                                      return Text("");
                                  }),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Date and time:",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                  Column(
                                    children: [
                                      Text(
                                          snapshot.data!.docs[index]
                                              .data()["date"]
                                              .toString()
                                              .split("00:")
                                              .first,
                                          style: TextStyle(
                                            fontSize: 20,
                                          )),
                                      Text(
                                          snapshot.data!.docs[index]
                                              .data()["time"]
                                              .toString()
                                              .split("(")
                                              .last
                                              .split(")")
                                              .first,
                                          style: TextStyle(
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Payment:",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                  Text(
                                      snapshot.data!.docs[index]
                                          .data()["payment"]
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                              snapshot.data!.docs[index].data()["amount"] ==
                                          "notpayed" &&
                                      snapshot.data!.docs[index]
                                              .data()["status"] ==
                                          "accepted"
                                  ? ElevatedButton(
                                      onPressed: () async{

                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (contex) {
                                            return UserPaymentPage( amount:snapshot.data!.docs[index].data()["amount"],
                                                id:snapshot.data!.docs[index].id);
                                          }),
                                        );
                                      },
                                      child: Text("payment"))
                                  : Text("")
                            ]),
                          ),
                        );
                      });
                } else
                  return Text("");
              }),
        )
      ]),
    );
  }
}
