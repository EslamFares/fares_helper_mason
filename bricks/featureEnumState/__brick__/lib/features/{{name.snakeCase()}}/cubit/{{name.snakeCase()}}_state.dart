part of '{{name.snakeCase()}}_cubit.dart';

enum {{name.pascalCase()}}Status {
  initial,
  loading,
  success,
  error,
}
extension {{name.pascalCase()}}TypeExtension on {{name.pascalCase()}}State {
  bool get isInitial => type == {{name.pascalCase()}}Status.initial;
  bool get isLoading => type == {{name.pascalCase()}}Status.loading;
  bool get isSuccess => type == {{name.pascalCase()}}Status.success;
  bool get isError => type == {{name.pascalCase()}}Status.error;
}

@immutable
class {{name.pascalCase()}}State extends Equatable {
  final {{name.pascalCase()}}Status type;
  final String? errorMessage;
  final {{name.pascalCase()}}Model? data;
  const {{name.pascalCase()}}State({
    this.type = {{name.pascalCase()}}Status.initial,
    this.errorMessage,
    this.data,
  });

  {{name.pascalCase()}}State copyWith({
    {{name.pascalCase()}}Status? type,
    String? errorMessage,
    {{name.pascalCase()}}Model? data,
  }) {
    return {{name.pascalCase()}}State(
      type: type ?? this.type,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }
  @override 
  String toString() {
    return type.name.toUpperCase();
  }
  
  @override
  List<Object?> get props => [type, errorMessage, data];
}

