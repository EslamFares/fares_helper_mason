import '../../../../core/network/api/api_consumer.dart';

class {{name.pascalCase()}}Repo{
  final  ApiConsumer api ;
  {{name.pascalCase()}}Repo(this.api);
  //=====================
  get{{name.pascalCase()}}() async {
    // final res = await api.get(path: 'users');
    // debugPrint('res: $res');
  }
}
