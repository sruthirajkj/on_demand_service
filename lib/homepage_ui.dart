import 'package:flutter/material.dart';

import 'all_services.dart';
import 'customer_bookinghistory.dart';
import 'customer_bookingview.dart';
import 'customer_notificationpage.dart';
import 'home_page.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({Key? key}) : super(key: key);

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  int selectedindex = 0;
  List page = [HomePage(),CustomerBookingHistory(), CustomerNotificationPage(),AllSevices()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
         BottomNavigationBar(

          showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_sharp), label: "My booking"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "Notification"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.cleaning_services), label: "Services"),
            ],
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                selectedindex = index;
              });
            },currentIndex: selectedindex,
        ),

      body: page[selectedindex],
    );
  }
}
