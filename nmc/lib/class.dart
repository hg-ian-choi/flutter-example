class Person1 {
  String name;
  Person1(this.name);
}

class Person2 {
  String name;
  Person2({required this.name});
}

class Person3 {
  String? name;
  Person3();
}

void main(List<String> args) {
  var person1 = Person1('ian');
  var person2 = Person2(name: 'ian2');
  var person3 = Person3();
  print(person1.name);
  print(person2.name);
  print(person3.name);
}
