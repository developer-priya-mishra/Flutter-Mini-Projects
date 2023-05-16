import 'package:flutter/material.dart';

class Social {
  final String title;
  final String path;
  const Social({required this.title, required this.path});
}

class GridViewData extends StatefulWidget {
  static const String path = "/grid-view-data";
  const GridViewData({super.key});

  @override
  GridViewDataState createState() => GridViewDataState();
}

class GridViewDataState extends State<GridViewData> {
  List socials = [
    Social(title: "Facebook", path: "social/facebook.png"),
    Social(title: "Twitter", path: "social/twitter.png"),
    Social(title: "Instagram", path: "social/instagram.png"),
    Social(title: "Linkedin", path: "social/linkedin.png"),
    Social(title: "Google Plus", path: "social/google_plus.png"),
    Social(title: "Launcher Icon", path: "ic_launcher.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Data"),
      ),
      body: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(5.0),
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: socials
            .map(
              (item) => GestureDetector(
                onTap: () {
                  debugPrint("onTap called on ${item.title}");
                },
                child: Card(
                  elevation: 1.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image(
                          image: AssetImage('data_repo/img/${item.path}'),
                        ),
                        SizedBox(height: 15.0),
                        Center(
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Color.fromARGB(255, 97, 98, 102),
                              fontFamily: 'ProductSans',
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList()
          ..add(
            GestureDetector(
              onTap: () => debugPrint('flutter logo'),
              child: GridTile(child: FlutterLogo()),
            ),
          ),
      ),
    );
  }
}
