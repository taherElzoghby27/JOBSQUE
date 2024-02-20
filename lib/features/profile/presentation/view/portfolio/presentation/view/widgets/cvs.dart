import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/models/user_profile_model/portfolio.dart';
import 'package:jobsque/core/widgets/fading_list_view.dart';
import 'package:jobsque/features/home/presentation/view/widgets/loading_listview_fading.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/initial_cv_widget.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/custom_cv_widget_loading.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view/widgets/cvs_listview.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view_models/portfolio_cubit/portfolio_cubit.dart';

class PortfoliosBlocConsumer extends StatelessWidget {
  const PortfoliosBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PortfolioCubit, PortfolioState>(
      builder: (context, state) {
        if (state is GetFilesSuccess) {
          List<PortfolioModel> cvs = state.cvs!;
          return Center(
            child: cvs.isEmpty
                ? const InitialCvWidget()
                : CvsListView(
                    cvs: cvs,
                  ),
          );
        } else if (state is GetFilesLoading) {
          return const CustomFadingLoadingAnimation(
            widget: FadingListView(
              scrollDirc: Axis.vertical,
              widget: CustomCvWidgetLoading(),
            ),
          );
        } else {
          return Center(
            child: const InitialCvWidget(),
          );
        }
      },
      listener: (context, state) {
        if (state is GetFilesFailure) {
          showSnack(
            context,
            message: state.message,
            background: AppConsts.danger500,
          );
        }
        if (state is DeletedFailure) {
          showSnack(
            context,
            message: state.message,
            background: AppConsts.danger500,
          );
        }
        if (state is DeletedSuccess) {
          showSnack(context, message: state.message);
        }
      },
    );
  }
}
