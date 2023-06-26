import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomerDetails extends StatefulWidget {
  // const CustomerDetails({Key? key}) : super(key: key);
  String? name;
  String? mobile;
  String? gmail;
  String? address;
  String? image;
  String? id;

  CustomerDetails(
      {required this.name,
      required this.mobile,
      required this.gmail,
      required this.address,
      required this.image,
      required this.id
      });

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  removecustomer(String id){
    FirebaseFirestore.instance.collection("customer").doc(id).delete().then((_) {  Navigator.pop(context); });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        image: DecorationImage(fit: BoxFit.cover,
                            image: NetworkImage(widget.image!))),
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
                        widget.address.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 35.0, left: 20, right: 20),
                  child: Container(
                    height: 50,
                    width: 350,
                    child: InkWell(onTap: ()async{await removecustomer(widget.id!);},
                      child: Center(
                          child: Text(
                        "Remove",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
