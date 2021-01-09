import 'package:flutter/material.dart';
import 'MyBottomNavigationBar.dart';
import 'detail.dart';
import 'Data.dart';



class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  List<Place> places = getPlaceList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
                  color: Colors.white,
                  size: 28,
                ),
              ),
              child: Container(
                height: 93,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.blue[900],
                      Colors.blue[900],
                      Colors.blue[900],
                      Colors.blue[900],
                      Colors.blue[900],
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
                          },
                          child: Icon(Icons.arrow_back)),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'BANGKOK',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              'Dec 28 - Dec 31',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          // Icon(Icons.swap_vert),
                          SizedBox(width: 10),
                          GestureDetector(
                              onTap: (){
                                print("XXXX3");
                              },
                              child: Icon(Icons.filter_list)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  physics: BouncingScrollPhysics(),

                  children: buildPlaces(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildPlaces(){
    List<Widget> list = [];
    for (var place in places) {
      list.add(buildPlace(place));
    }
    return list;
  }


  Widget buildPlace(Place place){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(place: place)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 270,
          width: 386,
          child: Card(
            elevation: 8,
            margin: EdgeInsets.all(0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 190,
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(place.images[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  place.country,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "THAILAND",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "\$ ${place.price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "XXX",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 15,
                  bottom: 70,
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue[800],
                          Colors.blue[700],
                          Colors.blue[300],
                        ],
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          place.favorite = !place.favorite;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left:3.5, top: 5,),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            place.favorite ? Icons.favorite : Icons.favorite_border,
                            color: Color(0xFFEFF4F8),
                            size: 36,
                          ),
                        ),
                      ),


                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



