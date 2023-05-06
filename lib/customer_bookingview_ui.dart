import 'package:flutter/material.dart';

import 'customer_bookingview.dart';
import 'customer_profile.dart';
import 'home_page.dart';

class CustomerBookingViewUI extends StatefulWidget {
  const CustomerBookingViewUI({Key? key}) : super(key: key);

  @override
  State<CustomerBookingViewUI> createState() => _CustomerBookingViewUIState();
}

class _CustomerBookingViewUIState extends State<CustomerBookingViewUI> {
  int selected=0;
  List pages=[CustomerBookingView(),CustomerProfile (),CustomerBookingView(),HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[selected],   bottomNavigationBar:
    BottomNavigationBar(type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            selected=index;
          });

        },currentIndex: selected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit"),
          BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: "Exit"),
        ]),
    );
  }
}
