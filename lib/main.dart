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
  var userEqn='';
  var userRes='';
  final List<String> buttons=[
    'AC','DEL','%','/',
    '7','8','9','×',
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
          Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerRight,
                          child: Text(userEqn, style: TextStyle(fontSize: 40),)),
                      Container(
                          alignment: Alignment.bottomRight,
                          child: Text(userRes, style: TextStyle(fontSize: 20),))
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index){
                    if(buttons[index]=='='){
                      return MyButton(
                        onButtonTap: (){
                          setState(() {
                            userEqn ='';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.deepPurple[50],
                        textColor: Colors.black,
                      );
                    }
                    else if(buttons[index]=='AC'){
                      return MyButton(
                        onButtonTap: (){
                          setState(() {
                            userEqn='';
                            userRes='';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.deepPurple[300],
                        textColor: Colors.black,
                      );
                    }
                    else if(buttons[index]=='DEL'){
                      return MyButton(
                        onButtonTap: (){
                          setState(() {
                            try{
                              userEqn = userEqn.substring(0, userEqn.length - 1);
                            }
                            catch(e){
                              userEqn='';
                            }

                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.deepPurple[300],
                        textColor: Colors.black,
                      );
                    }
                    else{
                      return MyButton(
                        onButtonTap: (){
                          setState((){
                            userEqn+=buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isSpecial(buttons[index])?Colors.deepPurple[300]:Colors.deepPurple[200],
                        textColor: Colors.black,
                      );
                    }
                    }),
              ))
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  bool isSpecial(String s){
    if(s=='AC'||s=='%'||s=='DEL'||s=='/'||s=='×'||s=='-'||s=='+'||s=='=')
      return true;
    return false;
  }
}
