import 'package:first_app/things/butons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons=[
    'AC','DEL','%','/',
    '7','8','9','X',
    '4','5','6','-',
    '1','2','3','+',
    '00','0','.','='
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index){
                    return MyButton(
                    buttonText: buttons[index],
                    color: isSpecial(buttons[index])?Colors.deepPurple[300]:Colors.deepPurple[200],
                    textColor: Colors.black,
                    );
                    }),
              ))
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  bool isSpecial(String s){
    if(s=='AC'||s=='%'||s=='DEL'||s=='/'||s=='X'||s=='-'||s=='+'||s=='=')
      return true;
    return false;
  }
}
