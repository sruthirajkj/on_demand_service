import 'package:flutter/material.dart';

class CustomerBookingView extends StatefulWidget {
  const CustomerBookingView({Key? key}) : super(key: key);

  @override
  State<CustomerBookingView> createState() => _CustomerBookingViewState();
}

class _CustomerBookingViewState extends State<CustomerBookingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: BackButton(color: Colors.green),
        title: Text(
          "view",
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20,bottom: 8,top: 15),
        child: Center(
          child: Container(
            width: 300,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top:20.0,bottom: 25),
                child: Text(
                  "employee name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("Location/address",style: TextStyle(fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("Type of cleaning",style: TextStyle(fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("Date and time",style: TextStyle(fontSize: 18),),
              ),
              Text("payment",style: TextStyle(fontSize: 18),)
            ]),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 2, color: Colors.green)),
          ),
        ),
      ),
    );
  }
}
