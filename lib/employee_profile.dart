import 'package:flutter/material.dart';

class EmployeeProfilePage extends StatefulWidget {
  const EmployeeProfilePage({Key? key}) : super(key: key);

  @override
  State<EmployeeProfilePage> createState() => _EmployeeProfilePageState();
}

class _EmployeeProfilePageState extends State<EmployeeProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://media.istockphoto.com/id/1329006104/photo/cheerful-young-housewife-holding-bucket-with-cleaning-supplies.jpg?s=612x612&w=0&k=20&c=9sYffJHz7gGHfr78k7DITVDqjNfPyA5KDUo2aKi3xoQ="))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 20),
            child: Row(
              children: [
                Text(
                  "name",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "service",
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
                  "+91 9848586678",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8, left: 20, right: 20),
                      child: ListTile(
                        leading: Column(children: [
                          Text(
                            "customer name",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          Text(
                            "service type ",
                            style: TextStyle(fontSize: 18),
                          ),
                        ]),
                        trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 20,
                                  width: 80,
                                  child: Center(child: Text("Accept")),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          color: Colors.green, width: 1)),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 20,
                                  width: 80,
                                  child: Center(child: Text("Reject")),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          color: Colors.green, width: 1)),
                                ),
                              )
                            ]),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
