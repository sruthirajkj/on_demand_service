import 'package:flutter/material.dart';

import 'customer_notificationpage.dart';

class AllSevices extends StatefulWidget {
  const AllSevices({Key? key}) : super(key: key);

  @override
  State<AllSevices> createState() => _AllSevicesState();
}

class _AllSevicesState extends State<AllSevices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: BackButton(color: Colors.green),
        title: Text(
          "On Demand Services",
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return CustomerNotificationPage();
                  }),
                );
              },
              icon: Icon(
                Icons.notifications,
                color: Colors.green,
              ))
          // IconButton(

          // )
        ],
      ),
      body: ListView(
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 8, left: 15, right: 10),
              child: Container(
                height: 220,
                width: 350,
                child: Row(children: [
                  Container(
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assetfile/deep cleaning 3.jpg")),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 15),
                    child: Column(
                      children: [
                        Text(
                          "Deep Cleaning",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Text("bedroom cleaning"),
                        Text("kitchen cleaning"),
                        Text("bathroom cleaning"),
                        Text("floor cleaning"),
                      ],
                    ),
                  )
                ]),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.green)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 8, left: 15, right: 10),
              child: Container(
                height: 220,
                width: 350,
                child: Row(children: [
                  Container(
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assetfile/kitchen cleaning 2.jpg")),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 15),
                    child: Column(
                      children: [
                        Text(
                          "Kitchen Cleaning",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Text("stove cleaning"),
                        Text("dishwash cleaning"),
                        Text("kitchenfloor cleaning"),
                        Text("countertop cleaning"),
                      ],
                    ),
                  )
                ]),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.green)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 8, left: 15, right: 10),
              child: Container(
                height: 220,
                width: 350,
                child: Row(children: [
                  Container(
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assetfile/car wash2.jpg")),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 15),
                    child: Column(
                      children: [
                        Text(
                          "Car Wash",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Text("wash and dry"),
                        Text("vaccum"),
                        Text("hand polish"),
                        Text("tyre polish"),
                      ],
                    ),
                  )
                ]),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.green)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 8, left: 15, right: 10),
              child: Container(
                height: 220,
                width: 350,
                child: Row(children: [
                  Container(
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assetfile/loundry 2.jpg")),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 15),
                    child: Column(
                      children: [
                        Text(
                          "Loundry",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Text("Ladies garments"),
                        Text("Gents garments"),
                        Text("House Hold"),
                      ],
                    ),
                  )
                ]),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.green)),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
