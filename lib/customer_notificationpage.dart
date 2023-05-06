import 'package:flutter/material.dart';

class CustomerNotificationPage extends StatefulWidget {
  const CustomerNotificationPage({Key? key}) : super(key: key);

  @override
  State<CustomerNotificationPage> createState() => _CustomerNotificationPageState();
}

class _CustomerNotificationPageState extends State<CustomerNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      backgroundColor: Colors.greenAccent,
      leading: BackButton(color: Colors.green),
      title: Text(
        "Notification",
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
                child: Column(
                    children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Booking confirmed",
                          style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("Payment details",
                            style: TextStyle(
                              fontSize: 20,

                            )),
                      ),
                    ],
                  ),

                ]),
              ),
            );
          }),
        )
      ]),);
  }
}
