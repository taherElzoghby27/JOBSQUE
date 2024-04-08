import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'type_of_work_state.dart';

class TypeOfWorkCubit extends Cubit<TypeOfWorkState> {
  TypeOfWorkCubit() : super(TypeOfWorkInitial());
  List<String> _typeOfWorks = [
    'Senior Ui Designer',
    'Graphic designer',
    'Senior Ux Designer',
    'Senior Flutter Developer',
    'Front End Developer',
    'Senior .Net Developer',
  ];
  String _group = 'cv';

  set typeOfWorks(List<String> typeOfWorks) {
    this._typeOfWorks = typeOfWorks;
  }

  List<String> get typeOfWorks => this._typeOfWorks;

  set group(String group) {
    this._group = group;
  }

  String get group => this._group;

//change type of work
  changeTypeOfWork({required String value}) {
    group = value;
    emit(ChangedRadioButtonTypeOfWorkState(typeOfWork: group));
  }
}
