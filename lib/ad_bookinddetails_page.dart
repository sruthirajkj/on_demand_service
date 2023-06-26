import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class bookingpage extends StatefulWidget {
  const bookingpage({Key? key}) : super(key: key);

  @override
  State<bookingpage> createState() => _bookingpageState();
}

class _bookingpageState extends State<bookingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.green),
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Booking",
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Appointment")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: UnderlineTabIndicator(
                                  borderSide: BorderSide(width: .3)),
                              child: Column(children: [
                                StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("customer")
                                        .doc(snapshot.data!.docs[index]
                                            .data()["customerId"])
                                        .snapshots(),
                                    builder:
                                        (context, AsyncSnapshot snapshot1) {
                                      if (snapshot1.hasData) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              top: 8.0,
                                              right: 20,
                                              bottom: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot1.data
                                                    .data()["name"]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else
                                        return Text("");
                                    }),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 8.0,
                                    right: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Employee name:"),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection("employee")
                                            .doc(snapshot.data!.docs[index]
                                                .data()["employeeId"])
                                            .snapshots(),
                                        builder:
                                            (context, AsyncSnapshot snapshot2) {
                                          if (snapshot2.hasData) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  top: 2.0,
                                                  right: 20,
                                                  bottom: 5),
                                              child: Text(
                                                snapshot2.data
                                                    .data()["name"]
                                                    .toString(),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            );
                                          } else
                                            return Text("");
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          top: 8.0,
                                          right: 20,
                                          bottom: 8),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text("Rs "),
                                              Text(
                                                  snapshot.data!.docs[index]
                                                      .data()["payment"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
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
                                    )
                                  ],
                                ),
                              ]),
                            );
                          });
                    } else
                      return Text("");
                  })),
        ],
      ),
    );
  }
}
