import 'package:flutter/material.dart';

class NotificationCustomer extends StatefulWidget {
  const NotificationCustomer({Key? key}) : super(key: key);

  @override
  State<NotificationCustomer> createState() => _NotificationCustomerState();
}

class _NotificationCustomerState extends State<NotificationCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: 10,
          itemBuilder:
        (context,index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20,
            ),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "customer name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "datas",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              )
            ]),
          );
        }
      ),
    );
  }
}
