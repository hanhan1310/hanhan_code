void main() {

  ///               BAI 1
  List<List<int>> matrix = [
    [1, 2, 3, 4, 5],
    [2, 3, 4, 1, 1],
    [1, 2, 1, 3, 1],
    [2, 1, 1, 4, 2],
    [3, 2, 4, 1, 3],
  ];
  print(totalOfTwoLine(matrix: matrix));
  print("==================================\n");

  ///                   BAI 2

  List<Student> studentList = [
    Student(1, name: "an", age: 19, score: 4),
    Student(2, name: "han", age: 20, score: 6),
    Student(3, name: "van", age: 21, score: 8),
    Student(4, name: "hn", age: 23, score: 10),
    Student(5, name: "vn", age: 18, score: 3),
    Student(6, name: "vh", age: 20, score: 9),
  ];


  ///           BAI 3
  print(totalResult(x: 1, y: 13));
  print(totalResult(x: 15, y: 2));
  print("==================================\n");

  ///           BAI 4
  print(finalResult(firstNum: "1234453251515515425815115535235", secNum: "12334462251515565448155376427642"));
  print("==================================\n");
}




///             BAI 1
double totalOfTwoLine({required List<List<int>> matrix}) {
  double finalResult = 0;
  int countingLine = 0;
  for (int i = 0; i < matrix.length; i++) {
    countingLine += 1;
    for (int j = 0; j < matrix[i].length; j++) {
      if (matrix[i].length != matrix.length) {
        print("sai dieu kien");
        return 0;
      } else {
        if (i == j) {
          finalResult += matrix[i][j];
        } else if (j == (matrix[i].length - countingLine)) {
          finalResult += matrix[i][j];
        }
      }
    }
  }
  return finalResult;
}

///              BAI 2
class Student {
  int _id;
  String name;
  int age;
  double score;
  bool? isGruaduated;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Student(this._id,
      {required this.age, required this.name, required this.score, this.isGruaduated});
}

class ManageStudent{
  List<Student> student;

  ManageStudent(this.student);

  List<Student> checkingStudent ({required List<Student> studentList}){
    for(int i = 0; i < studentList.length; i++){
      if(studentList[i].score < 5){
        studentList[i].isGruaduated = true;
      } else {
        studentList[i].isGruaduated = false;
      }
    }
    return studentList;
  }

  List<Student> outputSearch ({required String searchingWord, required List<Student> studentList}){
    List<Student> outputList = List<Student>.from(studentList);

    for(int i = 0; i < studentList.length; i++){
      if(studentList[i].name.contains(searchingWord)){
        outputList.add(studentList[i]);
      }
    }

    return outputList;
  }
}

///              BAI 3
int totalResult({required int x, required int y}) {
  int result = 0;
  if (x < y) {
    for (int i = x; i <= y; i++) {
      if (i % 13 != 0) {
        result += i;
      }
    }
  } else {
    print("vui long nhap lai so sao cho x < y");
  }
  return result;
}

///             BAI 4
String finalResult({required String firstNum, required String secNum}) {
  String finalAnswer =
      (BigInt.parse(firstNum) + BigInt.parse(secNum)).toString();
  return finalAnswer;
}
