import 'package:awsomeapp/task1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
final themeMode = ValueNotifier(2);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Today's Doctor D"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.

          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back_ios_new),
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
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).

              children: <Widget>[
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
                                  fit: BoxFit.fitHeight,
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
                          Text('$_counter'),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: _incrementCounter,
                            icon: Icon(
                              Icons.message_outlined,
                            ),
                            iconSize: 20.0,
                          ),
                          Text('$_counter'),
                          IconButton(
                            padding: EdgeInsets.zero,
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
                        count: 5,
                        curve: Curves.bounceInOut,
                        effect: SlideEffect(
                          radius: 2,
                          dotHeight: 3,
                          dotWidth: 15,
                          activeDotColor: Colors.orange,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),

                      /*  SmoothPageIndicator(  
                        controller: ,  // PageController  
                        count:  imgList.length,  
                        effect:  SlideEffect(
                            radius: 2,
                            dotHeight: 3,
                            dotWidth: 15,
                            activeDotColor: Colors.orange,
                            paintStyle:PaintingStyle.fill,
                          ),  // your preferred effect  
                        onDotClicked: (index){  
                              
                        }  
                      )    */
                    ],
                  ),
                ),
                /* CarouselSlider(
                  items: [
                    for (int i = 0; i < imgList.length;i++)
                      //1st Image of Slider
                      Container(
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                imgList[i]),
                            fit: BoxFit.cover,
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
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1.0,
                  ),
                ),
                AnimatedSmoothIndicator(activeIndex: activeIndex, count: 5), */
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
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
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
                    child: Text("5,509,00 W",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                        textDirection: TextDirection.ltr),
                  ),
                  alignment: AlignmentDirectional.topStart,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.add_moderator,
                        color: Color.fromARGB(255, 248, 133, 66)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("No Exchange No refuns",
                          style: TextStyle(
                              color: Color.fromARGB(255, 248, 133, 66))),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: FlatButton(
                    child: Text(
                      'Contact seller',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    color: Color.fromARGB(255, 0, 0, 0),
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                  width: 2000,
                ),
                SizedBox(
                  height: 20,
                ),

                /* Container(  
              
              child: ElevatedButton(onPressed: () {}, 
              child:Row(
                children: [
                  Icon(Icons.add),
                  Text('Contact seller', style: TextStyle(fontSize: 15.0,color: Colors.black),
              ),
                ],
              ),
              style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
                    )
                  )
                ),
              
               ),
              width: 2000, 
              
            ),   */
                Container(
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add,
                          color: Color.fromARGB(255, 124, 123, 123)),
                      label: Text(
                        "Add Description",
                        style: TextStyle(
                            color: Color.fromARGB(255, 124, 123, 123)),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 202, 200, 200)))),
                      )),
                  width: 2000,
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Create Alert for similar items",
                        style: TextStyle(
                            color: Color.fromARGB(255, 124, 123, 123)),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 202, 200, 200)))),
                      )),
                  width: 2000,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Color.fromARGB(255, 202, 200, 200),
                  height: 40,
                  width: 2000,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text("Quality Control"),
                      SizedBox(
                        width: 170,
                      ),
                      Icon(Icons.arrow_forward_ios_outlined)
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
                        backgroundColor: Color.fromARGB(255, 255, 158, 12),
                        maxRadius: 30,
                        child: Image.asset(
                          'assets/images/crown.jpg',
                          height: 50,
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: [
                        Text("Madam Queen Shop"),
                        Row(
                          children: [
                            Icon(Icons.flag_outlined),
                            Text("Czech Republic")
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Follow"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
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
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text("L***y",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                              textDirection: TextDirection.ltr),
                        ),
                        alignment: AlignmentDirectional.topStart,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "06-15-2022",
                          style: TextStyle(),
                        ),
                      ),
                     
                      Container(
                        width: 190,
                        height: 32,
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.message),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Color.fromARGB(26, 116, 114, 114),
                  child: Column(
                    children: [
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
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.black12,
                            filled: true,
                            suffixIcon: Icon(Icons.send),
                            labelText: "Leave the first comment.",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(25))),
                        style: TextStyle(height: 0.1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
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
