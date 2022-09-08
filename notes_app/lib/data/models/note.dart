class Note {
  final String date;
  final String name;

  Note({required this.date, required this.name});

  factory Note.fromMap(Map<String, dynamic> json) => Note(
        date: json['date'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': date,
      'name': name,
    };
  }
}

class Grocery {
  final String date;
  final String name;

  Grocery({required this.date, required this.name});

  factory Grocery.fromMap(Map<String, dynamic> json) => Grocery(
        date: json['date'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'name': name,
    };
  }
}
