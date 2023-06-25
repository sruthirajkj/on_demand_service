import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housekeeping/service_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<Map<String, dynamic>> cleaningsections = [
    {
      "service": "Deep cleaning ",
      "image": "assetfile/deep cleaning 3.jpg",
      "details1": "bedroom cleaning",
      "details2": "kitchen cleaning",
      "details3": "bathroom cleaning",
      "details4": "floor cleaning",
      "details5": "Rs 300/-",
    },
    {
      "service": "Kitchen ",
      "image": "assetfile/kitchen cleaning 2.jpg",
      "details1": "stove cleaning",
      "details2": "dishwash cleaning",
      "details3": "kitchenfloor cleaning",
      "details4": "countertop cleaning",
      "details5": "Rs 300/-",
    },
    {
      "service": "Car wash",
      "image": "assetfile/car wash2.jpg",
      "details1": "wash and dry",
      "details2": "vaccum",
      "details3": "hand polish",
      "details4": "tyre polish",
      "details5": "Rs 300/-",
    },
    {
      "service": "Loundry ",
      "image": "assetfile/loundry 2.jpg",
      "details1": "Ladies garments",
      "details2": "Gents garments",
      "details3": "kids garments",
      "details4": "House hold",
      "details5": "Rs 300/-",
    }
  ];

  shareddisplay() async {
    final SharedPreferences display = await SharedPreferences.getInstance();

    var n = await display.getString("name");
    var i = await display.getString("image");

    setState(() {
      name = n;
      //  address = a;
      img = i;
      //adrs = a;
    });

    // print(name);
    // print("homepageeeeeeeeeee  ${img}");
  }

  String? name;
  // String? address;
  String? img;
  //String? adrs;

  @override
  void initState() {
    // TODO: implement initState
    shareddisplay();
    super.initState();
  }

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
                          fit: BoxFit.cover, image: NetworkImage(img!)),
                      shape: BoxShape.circle,
                      color: Colors.green),
                ),
                Text(
                  name!,
                  //"administrator@gmail.com",
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
                  MaterialPageRoute(builder: (context) {
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
          // ListTile(
          //     leading: Icon(Icons.notifications),
          //     title: TextButton(
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(builder: (contex) {
          //             return NotificationCustomer();
          //           }),
          //         );
          //       },
          //       child: Text(
          //         "Notification",
          //         style: TextStyle(fontSize: 16, color: Colors.black),
          //       ),
          //     )),
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
          // ListTile(
          //     leading: Icon(Icons.payment),
          //     title: TextButton(
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(builder: (contex) {
          //             return UserPaymentPage();
          //           }),
          //         );
          //       },
          //       child: Text(
          //         "Payments",
          //         style: TextStyle(fontSize: 16, color: Colors.black),
          //       ),
          //     )),


          ListTile(
              leading: Icon(Icons.history),
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return CustomerBookingHistory();
                    }),
                  );
                },
                child: Text(
                  "History",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              )),
          // ListTile(
          //     leading: Icon(Icons.settings),
          //     title: TextButton(
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(builder: (contex) {
          //             return LoginPage();
          //           }),
          //         );
          //       },
          //       child: Text(
          //         "Settings",
          //         style: TextStyle(fontSize: 16, color: Colors.black),
          //       ),
          //     )),
          ListTile(
              leading: Icon(Icons.logout),
              title: TextButton(
                onPressed: () async {
                  final SharedPreferences display =
                      await SharedPreferences.getInstance();
                  await display.clear();

                  Navigator.of(context).pushAndRemoveUntil(
                    // the new route
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
                    ),

                    // this function should return true when we're done removing routes
                    // but because we want to remove all other screens, we make it
                    // always return false
                    (Route route) => false,
                  );
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              )),
        ],
      )),
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Column(
            children: [
              name != null
                  ? Text(
                      name!,
                      style: TextStyle(color: Colors.green[800], fontSize: 25),
                    )
                  : Text("Loading...."),
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
            img != null
                ? Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        image: DecorationImage(
                            image: NetworkImage(img!), fit: BoxFit.cover)),
                  )
                : Text("loading")
          ]),
      body: Column(children: [
        // Padding(
        //   padding:
        //       const EdgeInsets.only(top: 10.0, left: 20, right: 20, bottom: 20),
        //   child: Container(
        //     width: 350,
        //     height: 50,
            // child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //   Text(
            //     adrs!,
            //     style: TextStyle(color: Colors.greenAccent,fontSize: 20),
            //   ), Icon(Icons.location_on, color: Colors.greenAccent),
        //     // ]),
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.all(Radius.circular(25)),
        //         border: Border.all(color: Colors.green, width: 2)),
        //   ),
        // ),
        // Padding(
        //   padding:
        //       const EdgeInsets.only(top: 10.0, left: 20, right: 20, bottom: 20),
        //   child: TextFormField(
        //       controller: searchcontroller,
        //       decoration: InputDecoration(
        //         enabledBorder: OutlineInputBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(30)),
        //             borderSide: BorderSide(color: Colors.green)),
        //         border: OutlineInputBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(30))),
        //         suffixIcon: Icon(Icons.location_on, color: Colors.greenAccent),
        //         hintText: "Address",
        //         hintStyle: TextStyle(color: Colors.greenAccent),
        //       )),
        // ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: CarouselSlider(
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
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cleaningsections.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    //  print( cleaningsections[index].id);

                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: ((context) {
                                      return ServiceDetails(
                                          service: cleaningsections[index]
                                              ["service"],
                                          image: cleaningsections[index]
                                              ["image"],
                                          details1: cleaningsections[index]
                                              ["details1"],
                                          details2: cleaningsections[index]
                                              ["details2"],
                                          details3: cleaningsections[index]
                                              ["details3"],
                                          details4: cleaningsections[index]
                                              ["details4"]);
                                    })));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 10, right: 10),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  cleaningsections[index]
                                                      ["image"]!),
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.green, width: 2)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(cleaningsections[index]["service"]!),
                          ],
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "  Experiences",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("employee")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 500,
                          child: ListView.builder(
                              //scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // print(snapshot.data!.docs[index].id);

                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                return AppoinmentPage(
                                                    image: snapshot
                                                        .data!.docs[index]
                                                        .data()["image"],
                                                    name: snapshot
                                                        .data!.docs[index]
                                                        .data()["name"],
                                                    carwash: snapshot
                                                        .data!.docs[index]
                                                        .data()["car wash"],
                                                    kitchencleaning: snapshot
                                                            .data!.docs[index]
                                                            .data()[
                                                        "Kitchen cleaning"],
                                                    loundry: snapshot
                                                        .data!.docs[index]
                                                        .data()["Loundry"],
                                                    deepcleaning: snapshot
                                                        .data!.docs[index]
                                                        .data()["deep cleaning"],
                                                    employeeid: snapshot.data!.docs[index].id);
                                              }),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, right: 20),
                                            child: Container(
                                              height: 200,
                                              //width: 200,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .data()["image"]),
                                                      fit: BoxFit.cover),
                                                  border: Border.all(
                                                      color: Colors.green,
                                                      width: 2)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    snapshot.data!.docs[index]
                                                .data()["car wash"] ==
                                            true
                                        ? Text("Car Wash")
                                        : snapshot.data!.docs[index]
                                                    .data()["Loundry"] ==
                                                true
                                            ? Text("Loundry")
                                            : snapshot.data!.docs[index].data()
                                                        ["Kitchen cleaning"] ==
                                                    true
                                                ? Text("Kitchen cleaning")
                                                : snapshot.data!.docs[index]
                                                                .data()[
                                                            "deep cleaning"] ==
                                                        true
                                                    ? Text("Deep cleaning")
                                                    : Text(""),
                                  ],
                                );
                              }),
                        );
                      } else {
                        return Text("");
                      }
                    }),
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
