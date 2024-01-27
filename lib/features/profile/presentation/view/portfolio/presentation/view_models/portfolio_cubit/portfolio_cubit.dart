import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioInitial());
  //add portfolio
  addPortfolio() {}
  //get portfolios
  getPortfolios() {}
  //delete portfolios
  deletePortfolio() {}
}
