import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/log/logger.dart';
import '../data/model/{{name.snakeCase()}}_model.dart'; 
import '../data/repo/{{name.snakeCase()}}_repo.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this.{{name.camelCase()}}Repo) : super(const {{name.pascalCase()}}State(type: {{name.pascalCase()}}Status.initial));
  static {{name.pascalCase()}}Cubit get(context) => BlocProvider.of(context);
  final {{name.pascalCase()}}Repo {{name.camelCase()}}Repo;
  //===========================================
  @override
  void emit({{name.pascalCase()}}State state) {
    if (!isClosed) super.emit(state);
  }

//===========================================
  Future<void> init() async{}

//======================================================
  Future<void> get{{name.pascalCase()}}() async {
     emit(state.copyWith(type: {{name.pascalCase()}}Status.loading)); 
   
     final res = await {{name.camelCase()}}Repo.get{{name.pascalCase()}}();
     res.fold(
    (l) => emit(state.copyWith(type: {{name.pascalCase()}}Status.error, errorMessage: l)),
    (r)  {
      logPro.s("res : $r");
      emit(state.copyWith(type: {{name.pascalCase()}}Status.success, data: r));
    },
  );
  }
}