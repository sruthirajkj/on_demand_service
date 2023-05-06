import 'package:flutter/material.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn6la0dOXP7G7oy6b1-xmmmZSTvY2y612sYg&usqp=CAU"))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Name",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          "+ 91 859475407",
          style: TextStyle(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
            "name111@gmail.com",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.black,
              border: Border(
                top: BorderSide(width: 1, color: Colors.black),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Text(
                "Address:",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text("city:", style: TextStyle(fontSize: 20)),
          ],
        ),
      ]),
    )));
  }
}
