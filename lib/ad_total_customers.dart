import 'package:flutter/material.dart';

import 'ad_customer_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TotalCustomers extends StatefulWidget {
  const TotalCustomers({Key? key}) : super(key: key);

  @override
  State<TotalCustomers> createState() => _TotalCustomersState();
}

class _TotalCustomersState extends State<TotalCustomers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.green),
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Customer",
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
      ),
      body: Column(children: [
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("customer").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, right: 20, left: 20, bottom: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return CustomerDetails(
                                    // name:nm.text,
                                    // mobile:number.text,
                                    // gmail:mail.text,
                                    // address:addres.text
                                  );
                                }),
                              );
                            },
                            child: ListTile(
                              leading: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                    // image: DecorationImage(
                                    //     image: FileImage(
                                    //         snapshot
                                    //         .data!.docs[index]
                                    //         .data()["image"]
                                    //     ))
                                ),
                              ),
                              title: Text(snapshot.data!.docs[index]
                                  .data()["name"]
                                  .toString()),
                              trailing: Container(
                                  height: 30,
                                  width: 80,
                                  child: Center(child: Text("Delete")),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          width: 2, color: Colors.green))),
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return Text("");
              }
            })
      ]),
    );
  }
}
