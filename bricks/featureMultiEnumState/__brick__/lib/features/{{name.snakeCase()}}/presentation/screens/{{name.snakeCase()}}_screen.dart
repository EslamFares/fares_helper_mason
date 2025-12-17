import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../data/repo/{{name.snakeCase()}}_repo.dart';
import '../../cubit/{{name.snakeCase()}}_cubit.dart';
import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../../../core/utils/app_utils/app_toast.dart';
import '../../../../core/shared/bloc/state_box.dart';
import '../../../../core/shared_widgets/app_loader.dart';
import '../../../../core/shared_widgets/app_error/app_error.dart';
import '../widgets/{{name.snakeCase()}}_screen_body.dart';


class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //TODO add {{name.pascalCase()}}Repo in getIt
      //  getIt.registerSingleton<{{name.pascalCase()}}Repo>({{name.pascalCase()}}Repo(getIt<ApiService>()));
      create: (context) => {{name.pascalCase()}}Cubit(getIt<{{name.pascalCase()}}Repo>()),
      child: 
       Scaffold(
            appBar: AppBar(title: const Text("{{name.pascalCase()}}Screen")),
            body: BlocConsumer<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
        listenWhen: (previous, current) =>
              previous.getAllData != current.getAllData,
          listener: (context, state) {
            if (state.getAllData.isError) {
              AppToast.toast("Get All Data Error");
            }
            if (state.getAllData.isSuccess) {
              AppToast.toast("Get All Data Success");
            }
            },
            buildWhen: (previous, current) =>
              previous.getAllData != current.getAllData,
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = {{name.pascalCase()}}Cubit.get(context);
             if (state.getAllData.isLoading) {
              return AppLoader();
            } else if (state.getAllData.isError) {
              return AppError(
                text: state.getAllData.errorMessage,
              );
            } else if (state.getAllData.isSuccess) {
              return RefreshIndicator(
                  onRefresh: () async {
                    await {{name.pascalCase()}}Cubit.get(context).init();
                  },
                  child: {{name.pascalCase()}}ScreenBody());
            } else {
              return Text(".....");
            }
        },
      ),
      ),
    );
  }
}