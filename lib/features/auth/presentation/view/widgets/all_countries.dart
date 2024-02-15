import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/data.dart';
import 'package:jobsque/features/auth/presentation/view_model/work_location_cubit/work_location_cubit.dart';

import 'country_widget.dart';

class AllCountryWidget extends StatelessWidget {
  const AllCountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkLocationCubit, WorkLocationState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<WorkLocationCubit>(context);

        return Column(
          children: countries.map(
            (rowCountries) {
              return Row(
                children: rowCountries.map(
                  (country) {
                    String label = country["label"]!;
                    String flag = country["flag"]!;
                    return CountryWidget(
                      label: label,
                      flag: flag,
                      onTap: () => bloc.toggleWorkInterest(
                        key: label,
                        status: bloc.workLocation[label] == true ? false : true,
                      ),
                      isSelected: bloc.getStatus(key: label),
                    );
                  },
                ).toList(),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
