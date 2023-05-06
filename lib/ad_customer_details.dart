import 'package:flutter/material.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);
 //  String ?name;
 //  String ?mobile;
 //  String ?gmail;
 //  String ?address;
 //  CustomerDetails ({required this.name,required this.mobile,
 //    required this.gmail,required this.address,});


  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea (
      child: ListView(scrollDirection: Axis.horizontal,
        children: [
          Center(
            child: Column(
              children: [ Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 200,
                width: 200,
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green, image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn6la0dOXP7G7oy6b1-xmmmZSTvY2y612sYg&usqp=CAU"))),
              ),
            ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(''
                    //widget.name.toString()
                    ,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(''
                 // widget.mobile.toString()
                  ,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(''
                   // widget.gmail.toString()
                    ,
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
                  padding: const EdgeInsets.only(top: 10.0,bottom: 2,left: 20,right: 20),
                  child: Row(
                    children: [
                      Text("",
                        //widget.address.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const  EdgeInsets.only(top: 2.0,bottom:2,left: 20,right: 20),
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
                  padding: const EdgeInsets.only(top: 2.0,bottom:2,left: 20,right: 20),
                  child: Row(
                    children: [
                      Text(
                        "Rating:",
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

               ],),
          ),
        ],
      ),
    ));
  }
}
