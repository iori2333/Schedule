class Course {
  int? id;
  String name;
  String place;
  String weeks;
  int start;
  int end;
  int weekday;

  Course({
    this.id,
    required this.name,
    required this.place,
    required this.weeks,
    required this.start,
    required this.end,
    required this.weekday,
  });

  Course.fromMap(Map<String, dynamic> m)
      : id = m["id"],
        name = m["name"],
        place = m["place"],
        weeks = m["weeks"],
        start = int.parse( m["start"]),
        end = int.parse(m["end"]),
        weekday = int.parse(m["weekday"]);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "name": name,
      "place": place,
      "weeks": weeks,
      "start": start,
      "end": end,
      "weekday": weekday
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  @override
  String toString() {
    return name + "\n@" + place;
  }

  bool get isActive => false;
}
