import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../data/repo/{{name.snakeCase()}}_repo.dart';
import '../../cubit/{{name.snakeCase()}}_cubit.dart';

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
            body:
       BlocConsumer<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
        listener: (context, state) {
         if (state is {{name.pascalCase()}}Success) {}  
        },
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = {{name.pascalCase()}}Cubit.get(context);
          return Center(
              child: Text("{{name.pascalCase()}}Screen"),
            );
        },
      ),
      ),
    );
  }
}