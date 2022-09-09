import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValueListenable Builder Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 late final ValueNotifier<int> _counter;

  void _decrementCounter() {
    _counter.value--;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _counter =  ValueNotifier(10);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _counter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Value Listenable builder test"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (context, int value, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


               value > 0 ?  const Text(
                  'You have decremented this many times:',
                ) :  const Text(
                 "You can't decrement again\nYou have come to the end!",
               ),

                     Text(
                      '${value.toString()}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline4,
                    ),

              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          if(_counter.value > 0){

            _decrementCounter();
          }

        },
        tooltip: 'Decrement',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
