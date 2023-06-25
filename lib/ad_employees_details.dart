import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployeesDetails extends StatefulWidget {
  // const EmployeesDetails({Key? key}) : super(key: key);
  String? name;
  String? mobile;
  String? gmail;
  String? address;
  String? image;
  String? id;
  bool ?click;
  bool ?click1;
  bool ?click2;
  bool ?click3;

  // bool section;

  EmployeesDetails(
      {required this.name,
      required this.mobile,
      required this.gmail,
      required this.address,
      required this.image, required this.id,
       this.click=false,
      this.click1=false,
      this.click2=false,
      this.click3=false});

  @override
  State<EmployeesDetails> createState() => _EmployeesDetailsState();
}

class _EmployeesDetailsState extends State<EmployeesDetails> {
  String s1='';
  String s2='';
  String s3='';
  String s4='';
  void section(){
    if(widget.click==true){
      setState(() {
        s1="deep cleaning";
      });
    }
    if(widget.click1==true){
      setState(() {
        s2="car wash";
      });
    }
    if(widget.click2==true){
      setState(() {
        s3="Kitchen cleaning";
      });
    }
    if(widget.click3==true){
      setState(() {
        s4="Loundry";
      });
    }
  }
  removeemployee(String id){
    FirebaseFirestore.instance.collection("employee").doc(id).delete().then((_) {  Navigator.pop(context); });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    section();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(widget.image!))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.name.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            widget.mobile.toString(),
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              widget.gmail.toString(),
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
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 2, left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  "Address:  ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.address.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 2.0, bottom: 2, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Section:   ", style: TextStyle(fontSize: 20)),
                    Text(s1, style: TextStyle(fontSize: 20)),
                    Text(s2, style: TextStyle(fontSize: 20)),
                    Text(s3, style: TextStyle(fontSize: 20)),
                    Text(s4, style: TextStyle(fontSize: 20)),
                  ],
                ),

              ],
            ),
          ),
          // Padding(
          //   padding:
          //       const EdgeInsets.only(top: 2.0, bottom: 2, left: 20, right: 20),
          //   child: Row(
          //     children: [
          //       Text("Selected date slote:", style: TextStyle(fontSize: 20)),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding:
          //       const EdgeInsets.only(top: 2.0, bottom: 2, left: 20, right: 20),
          //   child: Row(
          //     children: [
          //       Text("Selected time slote:", style: TextStyle(fontSize: 20)),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding:
          //       const EdgeInsets.only(top: 2.0, bottom: 2, left: 20, right: 20),
          //   child: Row(
          //     children: [
          //       Text(
          //         "Payment:",
          //         style: TextStyle(fontSize: 20),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: InkWell(onTap: ()async{ await removeemployee(widget.id!); },
              child: Container(
                height: 50,
                width: 350,
                child: Center(
                    child: Text(
                  "Remove",
                  style: TextStyle(color: Colors.white),
                )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green),
              ),
            ),
          ),

        ]),
      ),
    );
  }
}
