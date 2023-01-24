import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom/mycard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// WEBPAGE ACCESS



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void>? _launched; ///web
  @override
  void initState() {
    super.initState();
    // Check for phone call support.
  }
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri(scheme: 'https', host: 'www.youtube.com');
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/sky.jpg',
              ),
              fit: BoxFit.fill),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.red.shade900,
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.green,
              Colors.blue,
              Colors.indigo,
            ],
          ),
        ),
        child: PageView(
          children: [
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: EdgeInsets.only(
                top: 40,
                left: 30,
                right: 30,
              ),
              children: [
                /// Calendar
                Container(
                  color: Colors.white,
                  //padding: EdgeInsets.all(5.0),
                  child: TableCalendar(
                    daysOfWeekVisible: true,
                    weekendDays: [
                      DateTime.friday,
                    ],
                    firstDay: DateTime.now(),
                    focusedDay: DateTime.now(),
                    lastDay: DateTime.now(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: AnalogClock(
                    markingColor: Colors.grey,
                    markingWidthFactor: 0.5,
                    hourHandLengthFactor: 0.9,
                    hourNumberSizeFactor: 0.7,
                    hourHandWidthFactor: 0.8,
                    minuteHandLengthFactor: 0.9,
                    secondHandLengthFactor: 0.8,
                    secondHandColor: Colors.blue,
                  ),
                ),
                myCard(title: 'Weather',),
                Container(
                  padding: EdgeInsets.all(25),
                  color: Colors.white.withOpacity(0.5),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(leading: Image(
                          image: AssetImage('assets/images/y.png',),
                        ),title: Text('Shopping'),),
                        ListTile(leading: Image(
                          image: AssetImage('assets/images/y.png',),
                        ),title: Text('Shopping'),),
                        ListTile(leading: Image(
                          image: AssetImage('assets/images/y.png',),
                        ),title: Text('Shopping'),),
                        ListTile(leading: Image(
                          image: AssetImage('assets/images/y.png',),
                        ),title: Text('Shopping'),),
                        ListTile(leading: Image(
                          image: AssetImage('assets/images/y.png',),
                        ),title: Text('Shopping'),),
                        ListTile(leading: Image(
                          image: AssetImage('assets/images/y.png',),
                        ),title: Text('Shopping'),),
                      ],
                    ),
                  ),
                ),
                myCard(title: 'Recipes',),
                Expanded(
                  child: Container(
                    color: Colors.white.withOpacity(0.5),
                    child: ItemWithLink(directoryName: 'Walcart',image: Image(
                      image: AssetImage('assets/images/y.png',),
                    ),),),
                  ),
              ],
            ),
            GridView.count(
              /// second page
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: EdgeInsets.only(
                top: 40,
                left: 30,
                right: 30,
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.5),
                ),
                Container(
                  color: Colors.white.withOpacity(0.5),
                ),
                Container(
                  color: Colors.white.withOpacity(0.5),
                ),
              ],
            ),

            /// 2nd Page
          ],
        ),
      ),
    );
  }
}

class ItemWithLink extends StatefulWidget {
  const ItemWithLink({Key? key,required this.directoryName,required this.image});
final String directoryName;
final Widget image;
//final String url;

  @override
  State<ItemWithLink> createState() => _ItemWithLinkState();
}

class _ItemWithLinkState extends State<ItemWithLink> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: InkWell(
                // onTap: () => setState(() {
                //   _launched = _launchInBrowser(url);
                // }),
                child: widget.image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class Card extends StatelessWidget {
//
// final String title;
//   const Card({super.key, required this.title});
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 1,
//       child: Container(
//         color: Colors.white.withOpacity(0.5),
//         child: Center(
//           child: Text(
//             title,
//             style: TextStyle(
//               fontSize: 50.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
