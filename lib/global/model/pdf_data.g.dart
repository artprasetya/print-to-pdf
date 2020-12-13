// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PDFDataAdapter extends TypeAdapter<PDFData> {
  @override
  final int typeId = 0;

  @override
  PDFData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PDFData(
      fileName: fields[0] as String,
      path: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PDFData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fileName)
      ..writeByte(1)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PDFDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
