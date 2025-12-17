import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';
import '../../../../core/network/errors/catch_error_message_extension.dart';
import '../model/{{name.snakeCase()}}_model.dart';

class {{name.pascalCase()}}Repo {
  final ApiConsumer api;
  {{name.pascalCase()}}Repo(this.api);

  //=====================
  Future<Either<String, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}() async {
    try {
      // final res = await api.get(path: ApiConsts.get{{name.pascalCase()}});
      Map<String, dynamic> res = {{name.pascalCase()}}Model(data: 'data').toMap();
      // debugPrint('res: $res');

      {{name.pascalCase()}}Model model = {{name.pascalCase()}}Model.fromMap(res);
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
