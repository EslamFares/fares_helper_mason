import 'package:flutter/material.dart';
import '../../cubit/{{name.snakeCase()}}_cubit.dart';
import 'package:asset_inventory/core/utils/extensions/spacing_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class {{name.pascalCase()}}ScreenBody extends StatelessWidget {
  const {{name.pascalCase()}}ScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          double.infinity.gapW,
          {{name.pascalCase()}}ScreenBodyData(),
          1500.h.gapH,
        ],
      ),
    );
  }
}
class {{name.pascalCase()}}ScreenBodyData extends StatelessWidget {
  const {{name.pascalCase()}}ScreenBodyData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
        buildWhen: (previous, current) => previous.get{{name.pascalCase()}} != current.get{{name.pascalCase()}},
        builder: (context, state) {
          return Column(
            children: [
              Text("{{name.pascalCase()}}Screen: ${state.get{{name.pascalCase()}}.data}"),
            ],
          );
        });
  }
}