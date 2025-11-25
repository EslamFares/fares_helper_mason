part of '{{name.snakeCase()}}_cubit.dart';

enum {{name.pascalCase()}}Status {
  initial,
  loading,
  success,
  error,
}
extension {{name.pascalCase()}}StatusX on {{name.pascalCase()}}State {
  bool get isInitial => status == {{name.pascalCase()}}Status.initial;
  bool get isLoading => status == {{name.pascalCase()}}Status.loading;
  bool get isSuccess => status == {{name.pascalCase()}}Status.success;
  bool get isError => status == {{name.pascalCase()}}Status.error;
}

@immutable
class {{name.pascalCase()}}State {
  final {{name.pascalCase()}}Status status;
  final String? errorMessage;
  final {{name.pascalCase()}}Model? {{name.camelCase()}}Model;
  const {{name.pascalCase()}}State({
    this.status = {{name.pascalCase()}}Status.initial,
    this.errorMessage,
    this.{{name.camelCase()}}Model,
  });

  {{name.pascalCase()}}State copyWith({
    {{name.pascalCase()}}Status? status,
    String? errorMessage,
    {{name.pascalCase()}}Model? {{name.camelCase()}}Model,
  }) {
    return {{name.pascalCase()}}State(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      {{name.camelCase()}}Model: {{name.camelCase()}}Model ?? this.{{name.camelCase()}}Model,
    );
  }
  @override 
  String toString() {
    return status.name.toUpperCase();
  }
  @override
  bool operator ==(covariant {{name.pascalCase()}}State other) {
    if (identical(this, other)) return true;
    return other.status == status && 
    other.errorMessage == errorMessage && 
    other.{{name.camelCase()}}Model == {{name.camelCase()}}Model;
  }
@override
  int get hashCode {
    return status.hashCode ^
    errorMessage.hashCode ^
    {{name.camelCase()}}Model.hashCode;
  }
}

