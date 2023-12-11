// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobAdapter extends TypeAdapter<Job> {
  @override
  final int typeId = 0;

  @override
  Job read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Job(
      id: fields[0] as int?,
      name: fields[1] as String?,
      image: fields[2] as String?,
      jobTimeType: fields[3] as String?,
      jobType: fields[4] as String?,
      jobLevel: fields[5] as String?,
      jobDescription: fields[6] as String?,
      jobSkill: fields[7] as String?,
      compName: fields[8] as String?,
      compEmail: fields[9] as String?,
      compWebsite: fields[10] as String?,
      aboutComp: fields[11] as String?,
      location: fields[12] as String?,
      salary: fields[13] as String?,
      favorites: fields[14] as int?,
      expired: fields[15] as int?,
      createdAt: fields[16] as String?,
      updatedAt: fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Job obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.jobTimeType)
      ..writeByte(4)
      ..write(obj.jobType)
      ..writeByte(5)
      ..write(obj.jobLevel)
      ..writeByte(6)
      ..write(obj.jobDescription)
      ..writeByte(7)
      ..write(obj.jobSkill)
      ..writeByte(8)
      ..write(obj.compName)
      ..writeByte(9)
      ..write(obj.compEmail)
      ..writeByte(10)
      ..write(obj.compWebsite)
      ..writeByte(11)
      ..write(obj.aboutComp)
      ..writeByte(12)
      ..write(obj.location)
      ..writeByte(13)
      ..write(obj.salary)
      ..writeByte(14)
      ..write(obj.favorites)
      ..writeByte(15)
      ..write(obj.expired)
      ..writeByte(16)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
