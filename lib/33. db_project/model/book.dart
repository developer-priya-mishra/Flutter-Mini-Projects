class Book {
  static const dbTitle = "title";
  static const dbUrl = "url";
  static const dbId = "id";
  static const dbNotes = "notes";
  static const dbStar = "star";

  String title, url, id, notes;

  bool starred;

  Book({
    required this.title,
    required this.url,
    required this.id,
    this.notes = "",
    this.starred = false,
  });

  Book.fromMap(Map<String, dynamic> map)
      : this(
          title: map[dbTitle],
          url: map[dbUrl],
          id: map[dbId],
          starred: map[dbStar] == 1,
          notes: map[dbNotes],
        );

  Map<String, dynamic> toMap() {
    return {
      dbTitle: title,
      dbUrl: url,
      dbId: id,
      dbNotes: notes,
      dbStar: starred ? 1 : 0,
    };
  }
}
