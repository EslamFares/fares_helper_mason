import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/{{name.snakeCase()}}_repo.dart';
import '../data/model/{{name.snakeCase()}}_model.dart'; 
import '../../../../../core/network/errors/catch_error_message.dart';
import '../../../core/shared/bloc/state_box.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this.{{name.camelCase()}}Repo) : super({{name.pascalCase()}}State.initial());
  static {{name.pascalCase()}}Cubit get(context) => BlocProvider.of(context);
  final {{name.pascalCase()}}Repo {{name.camelCase()}}Repo;
  //===========================================
  @override
  void emit({{name.pascalCase()}}State state) {
    if (!isClosed) super.emit(state);
  }

//===========================================
  Future<void> init() async{
    emit(state.copyWith(
      getAllData: StateBox.loading(),
    ));
    await _getData();
    emit(state.copyWith(
      getAllData: StateBox.successWithoutData(),
    ));
  }

Future<void> _getData() {
    List<Future<void>> futures = [
      get{{name.pascalCase()}}(),
      
      ];
    return Future.wait(futures);
  }
//======================================================
  Future<void>  get{{name.pascalCase()}}() async {
     emit(state.copyWith(
      get{{name.pascalCase()}}: StateBox.loading(),
    ));
    try {
      final res = await {{name.camelCase()}}Repo.get{{name.pascalCase()}}();
    //  {{name.pascalCase()}}Model model = {{name.pascalCase()}}Model.fromJson(res);
      emit(state.copyWith(
        get{{name.pascalCase()}}: StateBox.success(data: res),
      )
      );
    } catch (e) {
      String errorMessage = e.catchErrorMessage();
    emit(state.copyWith(
        get{{name.pascalCase()}}: StateBox.error(errorMessage: errorMessage),
      )
      );
    }
  }
}