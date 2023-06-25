import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:housekeeping/ad_payment_page.dart';
import 'package:housekeeping/ad_review_page.dart';
import 'package:housekeeping/ad_total_customers.dart';
import 'package:housekeeping/ad_total_employees.dart';

import 'home_page.dart';
import 'login_page.dart';
import 'ad_notification_page.dart';

class AdministratorPage extends StatefulWidget {
  const AdministratorPage({Key? key}) : super(key: key);

  @override
  State<AdministratorPage> createState() => _AdministratorPageState();
}

class _AdministratorPageState extends State<AdministratorPage> {
  TextEditingController searchcontroller = TextEditingController();
  int bottomselect = 0;
  List pages = [LoginPage(), AdministratorPage(), LoginPage()];
  List<String> images = [
    "https://cdn.propertynest.com/images/cleaning-services.2e16d0ba.fill-685x343.format-jpeg.jpg",
    "https://thumbs.dreamstime.com/b/woman-cleaning-induction-stove-kitchen-young-smiling-janitor-dirty-94050172.jpg",
    "https://media.istockphoto.com/id/1287044692/photo/worker-washing-red-car-with-sponge-on-a-car-wash.jpg?s=612x612&w=0&k=20&c=_6WO9k1qkDub5CAEQgnORMduUoQJkU6w3jjVQTdTdwQ=",
    "https://media.istockphoto.com/id/1165135044/photo/row-of-industrial-laundry-machines-in-laundromat-in-a-public-laundromat-with-laundry-in-a.jpg?s=612x612&w=0&k=20&c=X_xOM4m_c8_4ubKcrHKJR_cEtrBXZi2HJos0KynhF5o="
  ];
  // adverticement()async{
  //   var image= await FirebaseStorage.instance
  //       .ref().child("images/");
  //   await image.putData(images!);
  // }
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
                  decoration: BoxDecoration(image: DecorationImage(
                      image: NetworkImage(
                          "https://content.gallup.com/origin/gallupinc/GallupSpaces/Production/Cms/CSFCMSEN/lve2rsx3xuexyymuhr_3wq.jpg"))
                     , shape: BoxShape.circle, color: Colors.green),
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
            title: TextButton(onPressed: (){ Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return HomePage();
              }),
            );},child: Text( "Home",
              style: TextStyle(fontSize: 16,color: Colors.black),),

            ),
          ),
          ListTile(
            leading: Icon(Icons.book_outlined,size: 25,),title:  TextButton(onPressed: (){ Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return PaymentPage();
            }),
          );},child: Text( "Booking details",
            style: TextStyle(fontSize: 16,color: Colors.black),),

          ),
          ),
          ListTile(
            leading:Icon(Icons.notifications,size: 25,),title: TextButton(onPressed: (){ Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return NotificationPage();
            }),
          );},child: Text( "Adverticement",
            style: TextStyle(fontSize: 16,color: Colors.black),),

          ),
          ),

          // ListTile(
          //   leading: Icon(Icons.settings,size: 25,),title: TextButton(onPressed: (){ Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) {
          //     return LoginPage();
          //   }),
          // );},child: Text( "Settings",
          //   style: TextStyle(fontSize: 16,color: Colors.black),),
          //
          // ),
          // ),
          ListTile(
            leading:Icon(Icons.logout,size: 25,),title: TextButton(onPressed: (){ Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return LoginPage();
            }),
          );},child: Text( "Log Out",
            style: TextStyle(fontSize: 16,color: Colors.black),),

          ),
          ),
        ],
      )),
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text(
            "Administrator",
            style: TextStyle(color: Colors.green[800], fontSize: 25),
          ),
          actions: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://content.gallup.com/origin/gallupinc/GallupSpaces/Production/Cms/CSFCMSEN/lve2rsx3xuexyymuhr_3wq.jpg"))),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
              children: [
            // Padding(
            //   padding:
            //       const EdgeInsets.only(top: 10.0, right: 20, left: 20, bottom: 20),
            //   child: TextFormField(
            //       controller: searchcontroller,
            //       decoration: InputDecoration(
            //         enabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(30)),
            //             borderSide: BorderSide(color: Colors.green)),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(30))),
            //         suffixIcon: Icon(Icons.search, color: Colors.greenAccent),
            //         hintText: "Search",
            //         hintStyle: TextStyle(color: Colors.greenAccent),
            //       )),
            // ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return TotalCustomers();
                        }),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              "Total ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              " Customers",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          // Text(
                          //   "480",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.w500, fontSize: 20),
                          // )
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                          // border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return TotalEmployees();
                        }),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [  Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Employees",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          // Text(
                          //   "80",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.w500, fontSize: 20),
                          // )
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                          // border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: InkWell(
                //     onTap: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context) {
                //           return ReviewPage();
                //         }),
                //       );
                //     },
                //     child: Container(
                //       height: 150,
                //       width: 150,
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 20.0, top: 50),
                //         child: Column(
                //           children: [
                //             Text(
                //               "Reviews",
                //               style: TextStyle(
                //                   fontSize: 20, fontWeight: FontWeight.w500),
                //             ),
                //             Icon(Icons.eighteen_up_rating)
                //           ],
                //         ),
                //       ),
                //       decoration: BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.greenAccent.withOpacity(0.5),
                //               spreadRadius: 2,
                //               blurRadius: 2,
                //               offset: Offset(0, 1),
                //             ),
                //           ],
                //           // border: Border.all(color: Colors.green, width: 2),
                //           borderRadius: BorderRadius.all(Radius.circular(10))),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return PaymentPage();
                        }),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 50),
                        child: Column(
                          children: [
                            Text(
                              "Booking details",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                           // Icon(Icons.payment)
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                          // border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(15.0),
                //       child: Container(
                //         height: 150,
                //         width: 150,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.only(left: 15.0),
                //               child: Text(
                //                 "Adverticement",
                //                 style: TextStyle(
                //                     fontSize: 20, fontWeight: FontWeight.w500),
                //               ),
                //             ),
                //             // Row(
                //             //   mainAxisAlignment: MainAxisAlignment.center,
                //             //   children: [
                //             //     Icon(
                //             //       Icons.star,
                //             //       color: Colors.yellow,
                //             //       size: 18,
                //             //     ),
                //             //     Icon(
                //             //       Icons.star,
                //             //       color: Colors.yellow,
                //             //       size: 18,
                //             //     ),
                //             //     Icon(
                //             //       Icons.star,
                //             //       color: Colors.yellow,
                //             //       size: 18,
                //             //     ),
                //             //     Icon(
                //             //       Icons.star,
                //             //       color: Colors.yellow,
                //             //       size: 18,
                //             //     ),
                //             //   ],
                //             // ),
                //           ],
                //         ),
                //         decoration: BoxDecoration(
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.greenAccent.withOpacity(0.5),
                //                 spreadRadius: 2,
                //                 blurRadius: 2,
                //                 offset: Offset(0, 1),
                //               ),
                //             ],
                //             // border: Border.all(color: Colors.green, width: 2),
                //             borderRadius: BorderRadius.all(Radius.circular(10))),
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(15.0),
                //       child: InkWell(
                //         onTap: () {
                //           Navigator.of(context).push(
                //             MaterialPageRoute(builder: (context) {
                //               return NotificationPage();
                //             }),
                //           );
                //         },
                //         child: Container(
                //           height: 150,
                //           width: 150,
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 20.0),
                //                 child: Text(
                //                   "Notification",
                //                   style: TextStyle(
                //                       fontSize: 20, fontWeight: FontWeight.w500),
                //                 ),
                //               ),
                //               Text(
                //                 "20",
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.w500, fontSize: 20),
                //               )
                //             ],
                //           ),
                //           decoration: BoxDecoration(
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: Colors.greenAccent.withOpacity(0.5),
                //                   spreadRadius: 2,
                //                   blurRadius: 2,
                //                   offset: Offset(0, 1),
                //                 ),
                //               ],
                //               // border: Border.all(color: Colors.green, width: 2),
                //               borderRadius: BorderRadius.all(Radius.circular(10))),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),

            // bottomselect==0?LoginPage():bottomselect==1?AdministratorPage():LoginPage(),
            // pages[bottomselect],
          ]),
        ),
      ),
    );
  }
}
