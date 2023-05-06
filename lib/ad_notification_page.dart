import 'package:flutter/material.dart';

import 'ad_customer_notification.dart';
import 'ad_employee_notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.green),
          backgroundColor: Colors.greenAccent,
          title: Text(
            "Notification",
            style: TextStyle(color: Colors.green[800], fontSize: 25),
          ),
          bottom: TabBar(tabs: [
            Tab(text: "Customer",),
            Tab(
              text: "Employee",
            )
          ]),
        ),
        body: TabBarView(
            children: [NotificationCustomer(), ADEmployeeNotification()]),
      ),
    );
  }
}
