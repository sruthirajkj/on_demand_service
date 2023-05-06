import 'package:flutter/material.dart';

class CustomerBookingHistory extends StatefulWidget {
  const CustomerBookingHistory({Key? key}) : super(key: key);

  @override
  State<CustomerBookingHistory> createState() => _CustomerBookingHistoryState();
}

class _CustomerBookingHistoryState extends State<CustomerBookingHistory> {
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
          child: ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 12.0,bottom: 8),
              child: Container(
                decoration: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.green, width: .4)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Employee name:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text("name",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Date and time:",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text("12/11/22,10.30AM",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Payment:",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text("Rs.500",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ]),
              ),
            );
          }),
        )
      ]),
    );
  }
}
