import 'package:flutter/material.dart';

class ADEmployeeNotification extends StatefulWidget {
  const ADEmployeeNotification({Key? key}) : super(key: key);

  @override
  State<ADEmployeeNotification> createState() => _ADEmployeeNotificationState();
}

class _ADEmployeeNotificationState extends State<ADEmployeeNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20,
        right: 20,
      ),
      child: ListView.builder(itemCount: 10,
          itemBuilder:
       (context,index) {
          return Column(children: [
            Row(
              children: [
                Text(
                  "Empployee name",
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
          ]);
        }
      ),
    ),);
  }
}
