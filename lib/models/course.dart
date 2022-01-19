class Course {
  String name;
  String place;
  int start;
  int end;
  int weekday;
  bool isActive;

  Course(
      {required this.name,
      required this.place,
      required this.start,
      required this.end,
      required this.weekday,
      this.isActive = false});

  @override
  String toString() {
    return name + "\n@" + place;
  }
}
