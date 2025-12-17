import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/{{name.snakeCase()}}_repo.dart';
import '../../../core/utils/log/logger.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this.{{name.camelCase()}}Repo) : super({{name.pascalCase()}}Initial());
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
     emit({{name.pascalCase()}}Loading()); 
       final res = await {{name.camelCase()}}Repo.get{{name.pascalCase()}}();
  res.fold(
    (l) =>  emit({{name.pascalCase()}}Error(l)),
    (r) {
      logPro.s("res: $r");
      emit({{name.pascalCase()}}Success());
      },
  );
  }
}