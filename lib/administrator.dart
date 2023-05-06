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
                      shape: BoxShape.circle, color: Colors.green),
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
            leading: Icon(Icons.notifications,size: 25,),title:  TextButton(onPressed: (){ Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return NotificationPage();
            }),
          );},child: Text( "Notification",
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
          Divider(
            thickness: 2,
            height: 100,
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 25,),title: TextButton(onPressed: (){ Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return LoginPage();
            }),
          );},child: Text( "Settings",
            style: TextStyle(fontSize: 16,color: Colors.black),),

          ),
          ),
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
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10.0, right: 20, left: 20, bottom: 20),
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
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      height: 150,
                      width: 150,
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
                          Text(
                            "480",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          )
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
                      height: 150,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Employees",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            "80",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          )
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
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return ReviewPage();
                        }),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 50),
                        child: Column(
                          children: [
                            Text(
                              "Reviews",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.eighteen_up_rating)
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
                      height: 150,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 50),
                        child: Column(
                          children: [
                            Text(
                              "Payment",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.payment)
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
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Rating",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                          ],
                        ),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return NotificationPage();
                        }),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Notification",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            "20",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          )
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
                )
              ],
            ),
          ],
        ),

        // bottomselect==0?LoginPage():bottomselect==1?AdministratorPage():LoginPage(),
        // pages[bottomselect],
      ]),
    );
  }
}
