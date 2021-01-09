import 'package:flutter/material.dart';
import 'package:test_error/main.dart';


Widget nameText() {
  return TextFormField(

    decoration: InputDecoration(

      enabledBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      focusedBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),


      icon: Icon(
        Icons.home_outlined,
        size: 35.0,

      ),
      labelText: "คำค้นหา :",
      labelStyle: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
      helperText: "ประเทศ,เมือง,สถานที่",
      helperStyle: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),

    ),
  );
}

Widget countryText() {
  return TextFormField(
    decoration: InputDecoration(
      enabledBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      focusedBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      icon: Icon(
        Icons.flag,
        size: 35.0,
      ),
      labelText: "เลือกประเทศ :",
      labelStyle: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
      helperText: "เช่น ทัวร์ญี่ปุ่น",
      helperStyle: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
  );
}

Widget dateText() {
  return TextFormField(
    keyboardType: TextInputType.datetime,
    decoration: InputDecoration(
      enabledBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      focusedBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      icon: Icon(
        Icons.calendar_today,
        size: 35.0,
      ),
      labelText: "เดินทางตั้งแต่ :",
      labelStyle: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
      helperText: "เช่น DD/MM/YYYY",
      helperStyle: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
  );
}

Widget dateEndText() {
  return TextFormField(
    keyboardType: TextInputType.datetime,
    decoration: InputDecoration(
      enabledBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      focusedBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      icon: Icon(
        Icons.calendar_today_outlined,
        size: 35.0,
      ),
      labelText: "เดินทางถึง :",
      labelStyle: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
      helperText: "เช่น DD/MM/YYYY",
      helperStyle: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
  );
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "CM Layout",
      home: Scaffold(
        backgroundColor: Colors.lightBlue[200],
        appBar: AppBar(
          title: Text("การค้นหา",style: TextStyle(fontSize: 22.0),),

          backgroundColor: Colors.blue[900],
          centerTitle: true,
          actions:<Widget>[
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),));
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(30.00),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 17),
                  child: Center(
                      child: Text(
                        "ค้นหาทัวร์ต่างประเทศ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      ))),
              Container(
                margin: EdgeInsets.only(top: 17),
                child: nameText(),
              ),
              Container(
                margin: EdgeInsets.only(top: 17, bottom: 17),
                child: countryText(),
              ),
              dateText(),
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 30),
                child: dateEndText(),
              ),
              RawMaterialButton(
                onPressed: null,
                fillColor: Colors.blue[900],
                child: Text('ค้นหา', style: TextStyle(color: Colors.white,fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
