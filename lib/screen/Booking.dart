import 'package:flutter/material.dart';


class Booking extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: Text('Tour & Travel'),
          backgroundColor: Colors.blue[900],
        ),
        backgroundColor: Colors.blueAccent,
        body: Padding(
          padding: EdgeInsets.only(top: 30, right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200, width: 320,
                    //color: Colors.white,
                    child: Image.network(
                      'https://i2.wp.com/travelblog.expedia.co.th/wp-content/uploads/2020/01/cover-dec01.jpg?fit=1200%2C550&ssl=1',
                      height: 500,
                      width: 400
                      ,),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'ทัวร์เชียงใหม่ สุขใจ 3 วัน 2 คืน (รถตู้ VIP)',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 00,),
              Center(
                child: Container(
                  height: 200,
                  // color: Colors.red,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                          height: 70,
                          // color: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Transform.rotate(
                                  angle: 180 * 100 / 180,
                                  child: Icon(
                                    Icons.airplanemode_active,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'การเดินทาง',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        'รถตู้(VIP)',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 135),
                        child: Container(
                          height: 70,
                          // color: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Transform.rotate(
                                  angle: 0,
                                  child: Icon(
                                    Icons.article_rounded,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'สิ่งที่คุณจะได้รับ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        'อาหาร 6 มื้อ // โรงแรม 5 ดาว',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 70),
                        child: Container(
                          height: 70,
                          // color: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Transform.rotate(
                                  angle: 0,
                                  child: Icon(
                                    Icons.date_range_rounded,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'จำนวนวัน',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        '3 วัน 2 คืน',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new RaisedButton(
                  color: Colors.blue[900],
                  padding: EdgeInsets.all(5),
                  onPressed: ()
                  {

                  },
                  child: (
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'จองทัวร์',
                            style: TextStyle(color: Colors.white , fontSize: 20,),
                          )
                        ],
                      )
                  )
              )
            ],
          ),

        ),
      ),
    );
  }


}