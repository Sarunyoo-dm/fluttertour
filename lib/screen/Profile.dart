import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  get bottomNavigationBar => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        leading: Icon(Icons.arrow_back), //onPressed: () {},
      ),
      body: profileView(),
      backgroundColor: Colors.cyanAccent[50],     // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airport_shuttle),
            title: Text('Booking'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue[900],
      ),
    );
  }
  Widget profileView() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10,0 ,10),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                child: ClipOval(child: Image.network('https://f.ptcdn.info/072/068/000/q5hkd7kiblULmrfir3C-o.jpg',
                  height: 140, width: 140, fit: BoxFit.cover,),),
              ),
              Positioned(bottom: 1, right: 1 ,child: Container(
                height: 40, width:40,
                child: Icon(Icons.add_a_photo, color: Colors.white,),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 30, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(height: 0, width: 0,
              ),
              Text('my name is ...', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(height: 0,width: 0)
            ],
          ),
        ),
        Expanded(child: Container(
          height: 0, width: 600,
          padding: EdgeInsets.all(25.0),
          child : Center(
              child: Column(
                  children: <Widget>[
                    // Text('Profile', style: TextStyle(fontSize: 30.0,color: Colors.black),),
                    Padding(padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget> [
                          Icon(Icons.supervised_user_circle),
                          Expanded(child: new TextField(decoration: InputDecoration(hintText: "   Private"),),),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ] ,
                      ),
                    ), Padding(padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget> [
                          Icon(Icons.history_edu_rounded),
                          Expanded(child: new TextField(decoration: InputDecoration(hintText: "   Purchase History"),),),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ] ,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget> [
                          Icon(Icons.contact_support),
                          Expanded(child: new TextField(decoration: InputDecoration(hintText: "   Help & Sup port"),),),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ] ,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget> [
                          Icon(Icons.settings),
                          Expanded(child: new TextField(decoration: InputDecoration(hintText: "   Settings"),),),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ] ,
                      ),
                    ),

                  ]
              )
          ),
        ),
        )
      ],
    );
  }
}
/* Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container( height: 70, width: 200,
                    child: Align(child: Text('Save', style: TextStyle(color: Colors.white70, fontSize: 20),),),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),)
                    ),
                  ),
                ),
              )*/

/* Padding(padding: const EdgeInsets.all(8.0),
    child: Row(
    children: <Widget>[
      Icon(Icons.person),
    Expanded(child: new TextField(decoration: InputDecoration(hintText: "Profile"),),)
    ],
    ),
    ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('อีเมล์', style: TextStyle(color: Colors.white70),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('เบอร์์โทรศัพท์', style: TextStyle(color: Colors.white70),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('เกี่ยวกับฉัน', style: TextStyle(color: Colors.white70),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              )*/