import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class screen2 extends StatefulWidget {
  const screen2({Key? key}) : super(key: key);

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1594223274512-ad4803739b7c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=757&q=80',
    'https://images.unsplash.com/photo-1591561954557-26941169b49e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1591561954555-607968c989ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=596&q=80',
    'https://images.unsplash.com/photo-1605733513597-a8f8341084e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=929&q=80',
    'https://images.unsplash.com/photo-1605733513597-a8f8341084e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=929&q=80',
  ];
  final List<String> message = [
    'I really want to buy this',
    'Are you sure',
    'Yes',
    'I will get you the payment link'
  ];
  final List<String> text2 = [
    'L***y',
    'Seller',
  ];

  final List<String> img = [
    'assets/images/alexander-popov-kx1r9Fgqe7s-unsplash.jpg'
  ];
  final controller1 = CarouselController();
  int count = 3;
  int activeIndex = 0;
  int _counter = 0;
  int _counter2 = 0;
  _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.badge,
                ))
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            CarouselSlider(
                              carouselController: controller1,
                              items: [
                                for (int i = 0; i < imgList.length; i++)
                                  //1st Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(0.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      image: DecorationImage(
                                        image: NetworkImage(imgList[i]),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                              ],

                              //Slider Container properties
                              options: CarouselOptions(
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                },
                                height: 230.0,
                                enlargeCenterPage: true,
                                autoPlay: false,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                viewportFraction: 1.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '$_counter',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.all(2),
                                  color: Colors.black.withOpacity(0.4),
                                  constraints: BoxConstraints(),
                                  onPressed: _incrementCounter,
                                  icon: Icon(
                                    Icons.message_outlined,
                                  ),
                                  iconSize: 20.0,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '$_counter',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.all(2),
                                  color: Colors.black.withOpacity(0.4),
                                  constraints: BoxConstraints(),
                                  onPressed: _incrementCounter,
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                  ),
                                  iconSize: 20.0,
                                ),
                              ],
                            ),
                            AnimatedSmoothIndicator(
                              activeIndex: activeIndex,
                              count: imgList.length,
                              curve: Curves.bounceInOut,
                              effect: SlideEffect(
                                radius: 2,
                                dotHeight: 3,
                                dotWidth: 15,
                                activeDotColor: Colors.black.withOpacity(0.7),
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text("Louis Vuitton",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 30),
                              textDirection: TextDirection.ltr),
                        ),
                        alignment: AlignmentDirectional.topStart,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text("Monogram M43154",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                              textDirection: TextDirection.ltr),
                        ),
                        alignment: AlignmentDirectional.topStart,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Row(
                            children: [
                              Text("5,509,00",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textDirection: TextDirection.ltr),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "W",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                        ),
                        alignment: AlignmentDirectional.topStart,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add_moderator,
                                  color: Color.fromARGB(255, 248, 133, 66)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("No Exchange No refuns",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 248, 133, 66))),
                              )
                            ],
                          ),
                          Container(
                            child: Icon(
                              Icons.message_rounded,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: FlatButton(
                          child: Text(
                            'Contact seller',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          color: Color.fromARGB(255, 0, 0, 0),
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(2)),
                        height: 50,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "+ More Description",
                            style: TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123)),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(2)),
                        height: 50,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Create Alert for similar items",
                            style: TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123)),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.1),
                        height: 40,
                        width: 2000,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Quality Control",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.4)),
                            ),
                            SizedBox(
                              width: 170,
                            ),
                            Icon(Icons.arrow_forward_ios_outlined,
                                color: Colors.black.withOpacity(0.4))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text("Seller",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 30),
                              textDirection: TextDirection.ltr),
                        ),
                        alignment: AlignmentDirectional.topStart,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 255, 158, 12),
                              maxRadius: 30,
                              child: Image.asset(
                                'assets/images/crown.jpg',
                                height: 50,
                              )),
                          SizedBox(
                            width: 6,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Madam Queen Shop"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.flag_outlined),
                                  Text("Czech Republic    ")
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 92,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Follow"),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text("Comment",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 30),
                              textDirection: TextDirection.ltr),
                        ),
                        alignment: AlignmentDirectional.topStart,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.5),
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text("L***y",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                        textDirection: TextDirection.ltr),
                                  ),
                                  alignment: AlignmentDirectional.topStart,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 25,
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "06-15-2022",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 32,
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                width: 60,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.message,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black.withOpacity(0.4),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    for (int i = 0; i < message.length; i++)
                      for (int j = 0; j < text2.length; j++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 50, child: Text(text2[j])),
                            Text(":  "),
                            SizedBox(width: 200, child: Text(message[i])),
                          ],
                        ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.send),
                          hintText: "  Leave the first comment.",
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        style: TextStyle(height: 0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(.60),
          selectedFontSize: 12,
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'News Feed',
              icon: Icon(Icons.file_copy_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Add',
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: 'Notification',
              icon: Icon(Icons.notifications_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.person),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
