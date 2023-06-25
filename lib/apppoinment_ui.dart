// import 'package:flutter/material.dart';
//
// import 'appointment_page.dart';
// import 'ad_customer_details.dart';
// import 'employee_profile.dart';
// import 'home_page.dart';
//
// class AppoinmentUI extends StatefulWidget {
//   //const AppoinmentUI({Key? key}) : super(key: key);
//   String?image;
//   AppoinmentUI({required this.image});
//
//   @override
//   State<AppoinmentUI> createState() => _AppoinmentUIState();
// }
//
// class _AppoinmentUIState extends State<AppoinmentUI> {
//   int selectedindex1 = 0;
//   List pages = [AppoinmentPage(image: '',),HomePage()];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: pages[selectedindex1], bottomNavigationBar: BottomNavigationBar(
//         showUnselectedLabels: true,
//         showSelectedLabels: true,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//
//           BottomNavigationBarItem(
//               icon: Icon(Icons.exit_to_app), label: "Exit"),
//         ],
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) {
//           setState(() {
//             selectedindex1 = index;
//           });
//         },
//         currentIndex: selectedindex1),
//     );
//   }
// }
