import 'package:flutter/material.dart';

class ServiceDetails extends StatefulWidget {
  //const ServiceDetails({Key? key}) : super(key: key);

  //final List<Map<String, dynamic>> serviceDetails;
  String? service;
  String? image;
  String? details1;
  String? details2;
  String? details3;
  String? details4;

  ServiceDetails(
      {required this.service,
      required this.image,
      required this.details1,
      required this.details2,
      required this.details3,
      required this.details4});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: Colors.green),
            backgroundColor: Colors.greenAccent,
            title: Text(
              widget.service.toString(),
              style: TextStyle(color: Colors.green[800], fontSize: 25),
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(widget.image!))),
              ),
            ),
            Text(
              widget.details1.toString(),

              style: TextStyle(fontSize: 22),
            ),
            Text(
              widget.details2.toString(),
              style: TextStyle(fontSize: 22),
            ),
            Text(
              widget.details3.toString(),
              style: TextStyle(fontSize: 22),
            ),
            Text(
              widget.details4.toString(),
              style: TextStyle(fontSize: 22),
            )
          ],
        ));
  }
}
