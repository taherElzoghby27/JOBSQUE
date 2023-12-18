import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'type_of_work_state.dart';

class TypeOfWorkCubit extends Cubit<TypeOfWorkState> {
  TypeOfWorkCubit() : super(TypeOfWorkInitial());
  List<String> typeOfWorks = [
    'Senior Ui Designer',
    'Graphic designer',
    'Senior Ux Designer',
    'Senior Flutter Developer',
    'Front End Developer',
    'Senior .Net Developer',
  ];
  String group = 'cv';

//change type of work
  changeTypeOfWork({required String value}) {
    group = value;
    emit(ChangedRadioButtonTypeOfWorkState(typeOfWork: group));
  }
}
