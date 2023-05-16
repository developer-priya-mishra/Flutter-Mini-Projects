import "package:flutter/material.dart";

class OpacityThemeDataGradientColorTransform extends StatelessWidget {
  static const String path = "/opacity-themedata-gradient-color-transform";
  const OpacityThemeDataGradientColorTransform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opacity, ThemeData, GradientColor, Transform"),
      ),
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Opacity(
              opacity: 0.5,
              child: Text("Faded"),
            ),
          ),
          Spacer(),
          Center(
            child: Theme(
              data: ThemeData(
                colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
              ),
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: Text(
                  "Text with a background color",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          Spacer(),
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [
                    Color(0xff673ab7),
                    Color.fromARGB(255, 161, 131, 211),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.repeated,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Text(
                  "Hello",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Center(
            child: Container(
              color: Colors.yellow,
              child: Transform(
                alignment: Alignment.bottomLeft,
                transform: Matrix4.skewY(0.4)..rotateZ(-3 / 12.0),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  color: Colors.red,
                  child: Text("Eat at Joe's!"),
                ),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
