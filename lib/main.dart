

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';


void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) =>Home(),
      '/question1':(context)=>QuestionTemplate(id: 1,),
      '/question2':(context)=>QuestionTemplate(id: 2,),
      '/question3':(context)=>QuestionTemplate(id: 3,),
      '/question4':(context)=>QuestionTemplate(id: 4,),
      '/question5':(context)=>QuestionTemplate(id: 5,),
      '/question6':(context)=>QuestionTemplate(id: 6,),
      '/resultPage':(context)=>ResultPage(),

    }

  ));

}
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
int sum=0;
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text("Welcome to my feedback app"),
            SizedBox(height: 70.00,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width:100.00 ,
                height: 40.00,
                child: ElevatedButton(


                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/question1');
                  },
                  child: Row(
                    children: [
                      Text("Start"),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_outlined,),
                    ],
                  ),
                  // backgroundColor: Colors.blue,


                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class QuestionTemplate extends StatefulWidget {
  final int id;
  QuestionTemplate({Key key,this.id}) : super(key: key);

  @override
  _QuestionTemplateState createState() => _QuestionTemplateState(id: this.id);
}

class _QuestionTemplateState extends State<QuestionTemplate> {
  double answer=1;
  final int id;
  _QuestionTemplateState({this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Column(
        children: [Text(
          "${Question_list[this.id-1].text}"
        ),
          SizedBox(height: 60,),
          Text("Your Rating : ${this.answer.toInt()}"),
          SizedBox(height: 60,),
          Slider(
              value: answer,
              onChanged:(double newanswer){
                setState(() {this.answer=newanswer;
                print(this.answer);});},
              min: 1,
              max: 5,
              divisions: 4,

              activeColor: Colors.yellow[200*this.answer.toInt()-100],
              inactiveColor: Colors.purple[200*(6-this.answer.toInt())-100],

          ),
          SizedBox(height: 200,),
          ElevatedButton(
            onPressed: (){
            Question_list[this.id-1].answer=answer.toInt();
            sum+=answer.toInt();
            print(sum);
            print(Question_list[this.id-1].answer);
            if (this.id<6){
            Navigator.pushReplacementNamed(context, '/question${this.id+1}');}
            else{
              Navigator.pushReplacementNamed(context, '/resultPage');}
            },
           child: Text("Next"),

          ),

        ],
      ),

    );
  }

}
class ResultPage extends StatelessWidget {
  const ResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Center(child: Outputfunction()),
          // SizedBox(height: 60.00,),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width:125.00 ,
              height: 40.00,
              child: ElevatedButton(


                onPressed: (){
                  sum=0;
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Row(
                  children: [
                    Text("Restart"),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward_outlined,),
                  ],
                ),



              ),
            ),
          )


        ],
      ),

    );
  }
}

Widget Outputfunction(){
  if( 0<=sum && sum<=10){
    return Text("We are sorry for your inconvenience", style: TextStyle(color: Colors.red,),);
  }
  else if(11<=sum && sum<=20){
    return Text("Hope we serve you better next time", style: TextStyle(color: Colors.yellow,),);

  }
  else
    return Text("We hope you come back next time", style: TextStyle(color: Colors.green,),);
}

