import 'package:hive/hive.dart';

part 'pdf_data.g.dart';

@HiveType(typeId: 0)
class PDFData {
  @HiveField(0)
  final String fileName;
  @HiveField(1)
  final String path;

  PDFData({
    this.fileName,
    this.path,
  });
}
