import 'package:flutter/material.dart';

class EmployeesDetails extends StatefulWidget {
  const EmployeesDetails({Key? key}) : super(key: key);

  @override
  State<EmployeesDetails> createState() => _EmployeesDetailsState();
}

class _EmployeesDetailsState extends State<EmployeesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: BackButton(color: Colors.green),
      backgroundColor: Colors.white,),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 200,
              width: 200,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.green, image: DecorationImage(
                      image: NetworkImage(
                          "https://media.istockphoto.com/id/1329006104/photo/cheerful-young-housewife-holding-bucket-with-cleaning-supplies.jpg?s=612x612&w=0&k=20&c=9sYffJHz7gGHfr78k7DITVDqjNfPyA5KDUo2aKi3xoQ="))),
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.black,
                border: Border(
                  top: BorderSide(width: 1, color: Colors.black),
                )),
          ),
          Padding(
            padding: const  EdgeInsets.only(top: 10.0,bottom:2,left: 20,right: 20),
            child: Row(
              children: [
                Text(
                  "Address:",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0,bottom:2,left: 20,right: 20),
            child: Row(
              children: [
                Text("section:", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0,bottom:2,left: 20,right: 20),
            child: Row(
              children: [
                Text("Selected date slote:", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0,bottom:2,left: 20,right: 20),
            child: Row(
              children: [
                Text("Selected time slote:", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0,bottom:2,left: 20,right: 20),
            child: Row(
              children: [
                Text(
                  "Payment:",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Container(
              height: 50,
              width: 350,
              child: Center(child: Text("Remove", style: TextStyle(color: Colors.white),)),
              decoration:
              BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom:2,left: 20,right: 20),
            child: Row(
              children: [
                Text("Comments:",style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
