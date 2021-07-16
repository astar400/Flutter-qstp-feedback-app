class Question{
  String text;
  int answer=0,question_no;
  Question({this.text,this.question_no});
}
//To add question just add Question(text:"enter your text here",question_no:number) and then add route in main material app
List <Question>  Question_list =[
  Question(text:"q1",question_no: 1)
  ,
  Question(text:"q2",question_no: 2)
  ,
  Question(text:"q3",question_no: 3)
  ,
  Question(text:"q4",question_no: 4)
  ,
  Question(text:"q5",question_no: 5)
  ,
  Question(text:"q6",question_no: 6)
  ,
];