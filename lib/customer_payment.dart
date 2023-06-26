import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'customer_bookingview.dart';
import 'customer_bookingview_ui.dart';

class UserPaymentPage extends StatefulWidget {
  // const UserPaymentPage({Key? key}) : super(key: key);
  String? amount;
  String? id;
  UserPaymentPage({required this.amount, required this.id});

  @override
  State<UserPaymentPage> createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  TextEditingController cardnumcontoller = TextEditingController();
  TextEditingController holdernmcontoller = TextEditingController();

  var paymentkey = GlobalKey<FormState>();
  payed(String id) async {
    await FirebaseFirestore.instance
        .collection("Appointment")
        .doc(id)
        .update({"amount": "payed"});
  }

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
      body: SingleChildScrollView(
          child: Form(
        key: paymentkey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10),
            child: Container(
              height: 250,
              width: 330,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Amount",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "300",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
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
            padding: const EdgeInsets.only(
              left: 25,
              right: 20,
            ),
            child: Row(
              children: [
                Text("Card holder name"),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 8),
            child: TextFormField(
              controller: holdernmcontoller,
              validator: (u) {
                if (u!.isEmpty) {
                  return "please enter card holder name";
                }
              },
              decoration: InputDecoration(

                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.green)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 20,
            ),
            child: Row(
              children: [
                Text("Card number"),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 8),
            child: TextFormField(
              controller: cardnumcontoller,
              validator: (u) {
                if (u!.isEmpty) {
                  return "please enter your card number";
                }
              },
              decoration: InputDecoration(

                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.green)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 8),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.greenAccent),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(350, 50),
                  ),
                ),
                onPressed: () async{
                  bool validate = paymentkey.currentState!.validate();
                  if (validate == false) {
                    return;
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("payment succesful"),
                        );
                      },
                    );
                  }
                  await payed(widget.id!);

                    widget.amount = "payed";


                },
                child: Text(
                  "ok",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                )),
          )
        ]),
      )),
    );
  }
}
//Navigator.of(context).push(MaterialPageRoute(builder: (context){return CustomerBookingViewUI();}),);
