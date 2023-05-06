import 'package:flutter/material.dart';

import 'customer_bookingview.dart';
import 'customer_bookingview_ui.dart';

class UserPaymentPage extends StatefulWidget {
  const UserPaymentPage({Key? key}) : super(key: key);

  @override
  State<UserPaymentPage> createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: BackButton(color: Colors.green),
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10),
          child: Container(
            height: 250,
            width: 330,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Amount",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
              ),
              Text(
                "200",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
              ),
            ]),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(width: 2, color: Colors.greenAccent)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25,left: 20,right: 20,bottom: 8),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Google pay",
              prefixIcon: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage("assetfile/googlepay.jpeg"))),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.green)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25,left: 20,right: 20,bottom: 8),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Phonepe",
              prefixIcon: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage("assetfile/phonepay.png"))),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.green)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25,left: 20,right: 20,bottom: 8),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.greenAccent), minimumSize: MaterialStateProperty.all<Size>(
                Size(350, 50),
              ),),
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){return CustomerBookingViewUI();}),);},
              child: Text(
                "ok",
                style: TextStyle(fontSize: 22, color: Colors.black),
              )),
        )
      ]),
    );
  }
}
