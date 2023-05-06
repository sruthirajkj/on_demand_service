import 'package:flutter/material.dart';

import 'employee_notificationpage.dart';
import 'employee_profile.dart';
import 'home_page.dart';

class EmployeeProfileviewUI extends StatefulWidget {
  const EmployeeProfileviewUI({Key? key}) : super(key: key);

  @override
  State<EmployeeProfileviewUI> createState() => _EmployeeProfileviewUIState();
}

class _EmployeeProfileviewUIState extends State<EmployeeProfileviewUI> {
  int selectedindex = 0;
  List page = [EmployeeProfilePage(), EmployeeNotificationPage(), HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],

        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        currentIndex: selectedindex,
      ),
      body: page[selectedindex],
    );
  }
}
