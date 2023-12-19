// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApplyUserAdapter extends TypeAdapter<ApplyUser> {
  @override
  final int typeId = 1;

  @override
  ApplyUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApplyUser(
      name: fields[0] as String,
      email: fields[1] as String,
      phone: fields[2] as String,
      typeOfWork: fields[3] as String,
      cv: fields[4] as String,
      otherFiles: fields[5] as String,
      userId: fields[6] as String,
      jobId: fields[7] as String,
      status: fields[8] as String,
      reviewed: fields[9] as bool,
      updatedAt: fields[10] as String,
      createdAt: fields[11] as String,
      id: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ApplyUser obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.typeOfWork)
      ..writeByte(4)
      ..write(obj.cv)
      ..writeByte(5)
      ..write(obj.otherFiles)
      ..writeByte(6)
      ..write(obj.userId)
      ..writeByte(7)
      ..write(obj.jobId)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.reviewed)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplyUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
