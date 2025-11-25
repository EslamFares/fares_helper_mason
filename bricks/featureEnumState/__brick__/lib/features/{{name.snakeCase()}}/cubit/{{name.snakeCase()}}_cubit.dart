import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../data/repo/{{name.snakeCase()}}_repo.dart';
import '../../../const/locale_keys.g.dart';
import '../../../core/network/errors/server_failure.dart';
import '../data/model/{{name.snakeCase()}}_model.dart'; 
import '../../../core/utils/log/logger.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this.{{name.camelCase()}}Repo) : super(const {{name.pascalCase()}}State(status: {{name.pascalCase()}}Status.initial));
  static {{name.pascalCase()}}Cubit get(context) => BlocProvider.of(context);
  final {{name.pascalCase()}}Repo {{name.camelCase()}}Repo;
  //===========================================
  @override
  void emit({{name.pascalCase()}}State state) {
    if (!isClosed) super.emit(state);
  }

//===========================================
  Future<void> init() async{
    await go();
  }

//======================================================
  Future<void>  go() async {
     emit(const {{name.pascalCase()}}State(status: {{name.pascalCase()}}Status.loading)); 
    try {
      final res = await {{name.camelCase()}}Repo.go();
      debugPrint('res: $res');
      emit({{name.pascalCase()}}State(status: {{name.pascalCase()}}Status.success, {{name.camelCase()}}Model: res)); 
    } catch (e) {
      if (e is ServerFailure) {
         logPro.error("ServerFailure : ${e.toString()}");
        emit({{name.pascalCase()}}State(status: {{name.pascalCase()}}Status.error, errorMessage: e.msgApi)); 
      } else {
        logPro.error("e.toString() : ${e.toString()}");
        emit({{name.pascalCase()}}State(status: {{name.pascalCase()}}Status.error, errorMessage: LocaleKeys.anErrorOccurred.tr())); 
      }
    }
  }
}