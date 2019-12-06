import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expert System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Query'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _qId = 0;

  void _incrementQuestions() {
    setState(() {
      _qId++;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'I have asked this many questions:',
            ),
            Text(
              '$_qId',
              style: Theme.of(ctx).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementQuestions,
        tooltip: 'Answer question',
        child: Icon(Icons.add),
      ),
    );
  }
}
