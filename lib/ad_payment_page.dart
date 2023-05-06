import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.green),
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                decoration:
                    UnderlineTabIndicator(borderSide: BorderSide(width: .3)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 8.0,right: 20,bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          "Customer 1",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 8.0,right: 20,bottom: 8),
                        child: Text(
                          "cleaning employee1",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 8.0,right: 20,bottom: 8),
                        child: Column(
                          children: [
                            Text("500/-",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text("date&time")
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
              );
            }),
          ),
        ],
      ),
    );
  }
}
