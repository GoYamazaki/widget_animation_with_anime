import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  late MyAnimeWidget _animeWidget;

  @override
  Widget build(BuildContext context) {
    _animeWidget = MyAnimeWidget();

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
        home: Scaffold(
          appBar: AppBar(title: Text('Anime'),),
          body: _animeWidget,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _animeWidget.hideButton();
          }, child: Icon(Icons.add),),
        )
    );
  }
}

class MyAnimeWidget extends StatefulWidget {

  MyAnimeWidget({Key? key}) : super(key: key);
  late _MyAnimePageState _state;

  final TextButton button = TextButton(
    style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
    onPressed: null,
    child: const Text('Hello World'),
  );

  void hideButton() {
    _state.hide();
  }

  @override
  _MyAnimePageState createState() {
    _state = _MyAnimePageState();
    return _state;
  }
}

class _MyAnimePageState extends State<MyAnimeWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  void hide() {
    _controller.forward();
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 1, end: 0).animate(_controller);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.button,);
  }
}
