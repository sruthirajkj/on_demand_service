import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'ad_customer_notification.dart';
import 'appointment_page.dart';
import 'apppoinment_ui.dart';
import 'customer_bookinghistory.dart';
import 'customer_payment.dart';
import 'login_page.dart';
import 'ad_customer_notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchcontroller = TextEditingController();
  List<String> images = [
    "https://cdn.propertynest.com/images/cleaning-services.2e16d0ba.fill-685x343.format-jpeg.jpg",
    "https://thumbs.dreamstime.com/b/woman-cleaning-induction-stove-kitchen-young-smiling-janitor-dirty-94050172.jpg",
    "https://media.istockphoto.com/id/1287044692/photo/worker-washing-red-car-with-sponge-on-a-car-wash.jpg?s=612x612&w=0&k=20&c=_6WO9k1qkDub5CAEQgnORMduUoQJkU6w3jjVQTdTdwQ=",
    "https://media.istockphoto.com/id/1165135044/photo/row-of-industrial-laundry-machines-in-laundromat-in-a-public-laundromat-with-laundry-in-a.jpg?s=612x612&w=0&k=20&c=X_xOM4m_c8_4ubKcrHKJR_cEtrBXZi2HJos0KynhF5o="
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(color: Colors.greenAccent),
            child: Container(
              width: 300,
              child: Column(children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://img.freepik.com/free-photo/portrait-happy-young-woman-looking-camera_23-2147892777.jpg")),
                      shape: BoxShape.circle,
                      color: Colors.green),
                ),
                Text(
                  "administrator@gmail.com",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ]),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, size: 25),
            title: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (contex) {
                    return HomePage();
                  }),
                );
              },
              child: Text(
                "Home",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ListTile(
              leading: Icon(Icons.notifications),
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (contex) {
                      return NotificationCustomer();
                    }),
                  );
                },
                child: Text(
                  "Notification",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              )),
          // ListTile(
          //     leading: Icon(Icons.receipt_sharp),
          //     title: TextButton(
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(builder: (contex) {
          //             return CustomerBookingHistory();
          //           }),
          //         );
          //       },
          //       child: Text(
          //         "My Bookings",
          //         style: TextStyle(fontSize: 16, color: Colors.black),
          //       ),
          //     )),
          ListTile(
            leading: Icon(Icons.payment),
            title: TextButton(onPressed: (){ Navigator.of(context).push(
              MaterialPageRoute(builder: (contex) {
                return  UserPaymentPage();
              }),
            );},child: Text(
              "Payments",
              style: TextStyle(fontSize: 16,color: Colors.black),
            ),)
          ),

          Divider(
            thickness: 2,
            height: 100,
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: TextButton(onPressed: (){
              Navigator.of(context).push(
              MaterialPageRoute(builder: (contex) {
                return CustomerBookingHistory();
              }),
            );
              },child: Text(
              "History",
              style: TextStyle(fontSize: 16,color: Colors.black),
            ),)
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: TextButton(onPressed: (){
              Navigator.of(context).push(
              MaterialPageRoute(builder: (contex) {
                return LoginPage();
              }),
            );
              },child: Text(
              "Settings",
              style: TextStyle(fontSize: 16,color: Colors.black),
            ),)
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: TextButton(onPressed: (){  Navigator.of(context).push(
              MaterialPageRoute(builder: (contex) {
                return LoginPage();
              }),
            );},child: Text(
              "Log Out",
              style: TextStyle(fontSize: 16,color: Colors.black),
            ),)
          ),
        ],
      )),
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Column(
            children: [
              Text(
                "Customer name",
                style: TextStyle(color: Colors.green[800], fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "How can we help you?",
                  style: TextStyle(color: Colors.green[800], fontSize: 15),
                ),
              ),
            ],
          ),
          actions: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn6la0dOXP7G7oy6b1-xmmmZSTvY2y612sYg&usqp=CAU"))),
            )
          ]),
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10.0, left: 20, right: 20, bottom: 20),
          child: TextFormField(
              controller: searchcontroller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.green)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                suffixIcon: Icon(Icons.search, color: Colors.greenAccent),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.greenAccent),
              )),
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return Column(
              children: [
                CarouselSlider(
                    items: images
                        .map((e) => Container(
                              child: Center(
                                  child: Image.network(
                                e,
                                fit: BoxFit.cover,
                                width: 1000,
                              )),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true)),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 5),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assetfile/deepcleaning3.jpg")),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.green, width: 2)),
                                  ),
                                ),
                              ],
                            ),
                            Text("Cleaning"),
                          ],
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,),
                  child: Row(
                    children: [
                      Text(
                        "  Experiences",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                      //scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return AppoinmentUI();
                                      }),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                                    child: Container(
                                      height: 200,
                                      //width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assetfile/deepcleaning3.jpg")),
                                          border: Border.all(
                                              color: Colors.green, width: 2)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text("deep cleaning"),
                          ],
                        );
                      }),
                ),
                // SizedBox(height: 300,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 5,
                //       itemBuilder: (context, index) {
                //         return Column(
                //           children: [
                //             Stack(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       top: 8.0, bottom: 5, left: 5),
                //                   child: Container(
                //                     height: 200,
                //                     width: 200,
                //                     decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                //                         image: DecorationImage(
                //                             image: AssetImage(
                //                                 "assetfile/deepcleaning3.jpg")),
                //                         border:
                //                         Border.all(color: Colors.green, width: 2)),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Text("kitchen cleaning"),
                //           ],
                //         );
                //       }),
                // ),
              ],
            );
          }),
        ),
      ]),
    );
  }
}
