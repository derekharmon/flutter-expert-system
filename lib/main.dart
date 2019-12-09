import 'dart:io';

import 'package:flutter/material.dart';

final String rsTitle = 'Flutter Expert System';
final TextStyle whT48 = TextStyle(color: Colors.white, fontSize: 48);
final TextStyle bkT48 = TextStyle(color: Colors.black, fontSize: 48);

void main() => runApp(App());

class YesNoLayout extends StatefulWidget {
  YesNoLayout({Key key, this.tree, this.ki}) : super(key: key);
  final Map<int,String> tree;
  final int ki;

  @override
  _YesNoState createState() => _YesNoState();

  int next(bool b) {
    print('next(' + b.toString() + '): k_(i+1) is ' + (2*ki + (b ? 1 : 0)).toString() + ' = 2*' + ki.toString() + '+' + (b ? 1 : 0).toString() + ')\n');
    return 2*ki + (b ? 1 : 0);
  }

  String vi(int ki) {
    return tree.containsKey(ki) ? tree[ki] : null;
  }
}

class _YesNoState extends State<YesNoLayout> {
  Widget makeMaterialButton(bool b, double w, double h) {
    return MaterialButton(
              height: h,
              minWidth: w,
              child: Text(b ? 'Yes' : 'No', style: whT48),
              color: b ? Colors.green : Colors.deepOrange,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YesNoLayout(
                          tree: widget.tree,
                          ki: widget.next(b))
                  )
              ),
            );
  }

  Text getBodyText(Orientation o) {
    var lead = (o == Orientation.portrait) ? '\n\n\n' : '\n';
    var v = widget.vi(widget.ki);
    return Text((v == null) ? 'IDK' : lead + v, style: bkT48);
  }

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.of(context).size;
    final wBtn = sz.width/2.2;
    final hBtn = sz.height/10.2;

    return Scaffold(
      appBar: AppBar(
        title: Text(rsTitle),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: getBodyText(MediaQuery.of(context).orientation),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              makeMaterialButton(false, wBtn, hBtn),
              makeMaterialButton(true, wBtn, hBtn),
            ]
          )
        ],
      ),
    );
  }
}

class App extends StatelessWidget {
  final Map<int,String> _tree = const<int,String> {
    1: 'Is it an animal?',
    2: 'apple',
    3: 'cat',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: rsTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: YesNoLayout(tree: _tree, ki: 1),
    );
  }
}
