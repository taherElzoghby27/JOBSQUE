part of 'type_of_work_cubit.dart';

abstract class TypeOfWorkState extends Equatable {
  const TypeOfWorkState();
}

class TypeOfWorkInitial extends TypeOfWorkState {
  @override
  List<Object> get props => [];
}

//ChangedRadioButtonTypeOfWorkState
class ChangedRadioButtonTypeOfWorkState extends TypeOfWorkState {
  final String typeOfWork;

  const ChangedRadioButtonTypeOfWorkState({required this.typeOfWork});

  @override
  List<Object> get props => [typeOfWork];
}
