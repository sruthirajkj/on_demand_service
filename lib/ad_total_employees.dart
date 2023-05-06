import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ad_employees_details.dart';

class TotalEmployees extends StatefulWidget {
  const TotalEmployees({Key? key}) : super(key: key);

  @override
  State<TotalEmployees> createState() => _TotalEmployeesState();
}

class _TotalEmployeesState extends State<TotalEmployees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.green),
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Employees",
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
      ),
      body: Column(children: [
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("employee").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, right: 20, left: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return EmployeesDetails();
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
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://media.istockphoto.com/id/1329006104/photo/cheerful-young-housewife-holding-bucket-with-cleaning-supplies.jpg?s=612x612&w=0&k=20&c=9sYffJHz7gGHfr78k7DITVDqjNfPyA5KDUo2aKi3xoQ="))),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: Text(
                                  snapshot.data!.docs[index]
                                      .data()["name"]
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              subtitle: Text(
                                "Service",
                                style: TextStyle(fontSize: 12),
                              ),
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
