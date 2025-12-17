part of '{{name.snakeCase()}}_cubit.dart';


class {{name.pascalCase()}}State {
  final StateBox<{{name.pascalCase()}}Model> get{{name.pascalCase()}};
 
  const {{name.pascalCase()}}State({
    required this.get{{name.pascalCase()}},
  });

{{name.pascalCase()}}State.initial()
      : this(
          get{{name.pascalCase()}}: const StateBox.initial(),
        );

  @override
  String toString() {
    return "\n{{name.pascalCase()}}State( "
        "get{{name.pascalCase()}}: ${get{{name.pascalCase()}}.type.name.toUpperCase()}, "
        ")";
  }

  {{name.pascalCase()}}State copyWith({
    StateBox<{{name.pascalCase()}}Model>? get{{name.pascalCase()}},
  }) {
    return {{name.pascalCase()}}State(
      get{{name.pascalCase()}}: get{{name.pascalCase()}} ?? this.get{{name.pascalCase()}},
    );
  }
}

