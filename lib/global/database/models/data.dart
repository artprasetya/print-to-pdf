class PDFData {
  int _id;
  String _title;
  String _content;
  String _path;

  PDFData(
    this._title,
    this._content,
    this._path,
  );

  PDFData.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._content = map['content'];
    this._path = map['path'];
  }

  int get id => _id;
  String get title => _title;
  String get content => _content;
  String get path => _path;

  // set title(String value) => _title = value;
  // set content(String value) => _content = value;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['title'] = title;
    map['content'] = content;
    map['path'] = path;
    return map;
  }
}
