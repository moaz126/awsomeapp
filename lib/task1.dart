import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
];

final List<String> img = [
  'assets/images/alexander-popov-kx1r9Fgqe7s-unsplash.jpg'
];
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
          title: Text(widget.title, style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.alarm,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                ))
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider(
                        items: [
                          for (int i = 0; i < imgList.length; i++)
                            //1st Image of Slider
                            Container(
                              margin: EdgeInsets.all(0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                                image: DecorationImage(
                                  image: NetworkImage(imgList[i]),
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
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 1.0,
                        ),
                      ),
                      AnimatedSmoothIndicator(
                          activeIndex: activeIndex, count: 5),
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
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text("Symptom-Specific",
                        style: TextStyle(), textDirection: TextDirection.ltr),
                  ),
                  alignment: AlignmentDirectional.topStart,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(20),
                              child: Image.asset(img[0],fit: BoxFit.fill)),
                           ),
                            Text("Treatment")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.abc,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Cold")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.account_tree,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Mild")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.add_chart,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Chart")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.add_link,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Add link ")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.add_reaction,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Reaction")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text("Departmentalization",
                        style: TextStyle(), textDirection: TextDirection.ltr),
                  ),
                  alignment: AlignmentDirectional.topStart,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.adf_scanner,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Scannar")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.air_sharp,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Treatment")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.add_road,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Road")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.add_sharp,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Sharp")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.ads_click,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Click")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 238, 238),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 151, 149, 149),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                            )
                          ]),
                      height: 90,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 221, 237, 241),
                              child: Icon(Icons.edit_location,
                                  color: Color.fromARGB(255, 36, 206, 248)),
                              radius: 25,
                            ),
                            Text("Location")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(),
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
              label: 'Favourite',
              icon: Icon(Icons.music_note),
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
