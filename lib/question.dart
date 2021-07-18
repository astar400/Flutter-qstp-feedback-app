class Question{
  String text;
  int answer=0,question_no;
  Question({this.text,this.question_no});
}
//To add question just add Question(text:"enter your text here",question_no:number) and then add route in main material app
List <Question>  Question_list =[
  Question(text:"Q1",question_no: 1)
  ,
  Question(text:"Q2",question_no: 2)
  ,
  Question(text:"Q3",question_no: 3)
  ,
  Question(text:"Q4",question_no: 4)
  ,
  Question(text:"Q5",question_no: 5)
  ,
  Question(text:"Q6",question_no: 6)
  ,
];