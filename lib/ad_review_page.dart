import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.green),
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Review",
          style: TextStyle(color: Colors.green[800], fontSize: 25),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return Container(
              decoration:
                  UnderlineTabIndicator(borderSide: BorderSide(width: .5)),
              // height: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 8.0,right: 20,bottom: 8),
                    child: Row(children: [
                      Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn6la0dOXP7G7oy6b1-xmmmZSTvY2y612sYg&usqp=CAU")))),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "customer name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 10),
                        child: Text(
                          "comment 1",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 8),
                        child: Text(
                          "comment 2",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
        )
      ]),
    );
  }
}
