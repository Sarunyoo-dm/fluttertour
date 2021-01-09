import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'More.dart';
import 'Search.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,this.title}) : super(key:key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  int pageCount = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if(!pageController.hasClients){
        return;
      }
      if (pageController.page >= pageCount - 1 ){
        pageController.animateToPage(0,
            duration: Duration(microseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn);
      }else{
        pageController.nextPage(
            duration: Duration(microseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Tour & Travel'),
        actions:<Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),));
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(children: [
          LimitedBox(
            maxHeight: 220,
            child: Stack(
              children: [
                PageView(
                  controller: pageController,
                  children: [
                    AdsSlideCard(
                      slideImage:"https://www.chillpainai.com/src/wewakeup/scoop/scoopfb/10889.jpg"
                      ,),
                    AdsSlideCard(
                      slideImage:"https://www.paiduaykan.com/travel/wp-content/uploads/2018/08/%E0%B8%9B%E0%B8%81%E0%B9%80%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%8A%E0%B8%B5%E0%B8%A2%E0%B8%87%E0%B9%83%E0%B8%AB%E0%B8%A1%E0%B9%88-800x533.jpg"
                      ,),
                    AdsSlideCard(
                      slideImage:"https://my.kapook.com/imagescontent/fb_img/435/s_199835_4615.jpg"
                      ,),
                  ],
                ),
                Positioned(
                  bottom: 18.0,
                  left: 0.0,
                  right: 0.0,
                  child: Center(
                    child: SlideIndicator(
                      pageController: pageController,
                    ),
                  ),
                )
              ],
            ),
          ),

          Container(
            color: Colors.grey[200],
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),

          Column(
            children: <Widget>[
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Recomended",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 0,
                      ),
                    ),
                    GestureDetector(
                      //onTap: ()=>print("Test"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>More()));
                      },
                      child: Text("More",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ],),
              ),
            ],
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LimitedBox(maxHeight: 150,
              child:ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TrendingCard(img: "https://www.chillpainai.com/src/wewakeup/scoop/scoopfb/10889.jpg",),
                  TrendingCard(img: "https://my.kapook.com/imagescontent/fb_img/435/s_199835_4615.jpg",),
                  TrendingCard(img: "https://my.kapook.com/imagescontent/fb_img/435/s_199835_4615.jpg",),
                  TrendingCard(img: "https://www.chillpainai.com/src/wewakeup/scoop/scoopfb/10889.jpg",),
                  TrendingCard(img: "https://my.kapook.com/imagescontent/fb_img/435/s_199835_4615.jpg",),
                ],

              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 8,
          ),
          PromoteShopCard(image: "https://www.chillpainai.com/src/wewakeup/scoop/scoopfb/10889.jpg",),
          PromoteShopCard(image: "https://my.kapook.com/imagescontent/fb_img/435/s_199835_4615.jpg",),
        ],
        ),
      ),
    );
  }
}

class SlideIndicator extends AnimatedWidget{
  final PageController pageController;
  SlideIndicator({this.pageController}):super(listenable : pageController);
  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3,builIndicator),
    );
  }

  Widget  builIndicator(int index){

    double select = max(
      0.0,
      1.0 - ((pageController.page ?? pageController.initialPage) - index).abs(),
    );
    double decrease = 10*select;
    return Container(
      width: 35,
      child: Center(
        child: Container(
          width: 25 - decrease,
          height: 5,
          decoration: BoxDecoration( color: decrease == 10.0 ? Colors.white : Colors.black87,borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );


  }
}



class PromoteShopCard extends StatelessWidget {
  final String image;
  PromoteShopCard({this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/2,
        child: ClipRRect(
            borderRadius:BorderRadius.circular(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}


class TrendingCard extends StatelessWidget {
  final String img;
  TrendingCard({this.img});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 200,
        width: 250,
        child: ClipRRect(borderRadius: BorderRadius.circular(10),
            child: Image.network(
              img ,
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }
}


class AdsSlideCard extends StatelessWidget {
  final String slideImage;
  AdsSlideCard({this.slideImage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 200,
          child: ClipRRect(borderRadius: BorderRadius.circular(10),
              child: Image.network(
                slideImage,
                fit: BoxFit.cover,)),
        ),
      ),
    );
  }
}



