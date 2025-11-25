part of '{{name.snakeCase()}}_cubit.dart';


class {{name.pascalCase()}}State {
  final StateBox<void> getAllData;
  final StateBox<{{name.pascalCase()}}Model> get{{name.pascalCase()}};
  final StateBox<void> send{{name.pascalCase()}};
 
  const {{name.pascalCase()}}State({
    required this.getAllData,
    required this.get{{name.pascalCase()}},
    required this.send{{name.pascalCase()}},
  });

{{name.pascalCase()}}State.initial()
      : this(
          getAllData: const StateBox.initial(),
          get{{name.pascalCase()}}: const StateBox.initial(),
          send{{name.pascalCase()}}: const StateBox.initial(),
        );

  @override
  String toString() {
    return "\n{{name.pascalCase()}}State( "
        "getAllData: ${getAllData.type.name.toUpperCase()}, "
        "get{{name.pascalCase()}}: ${get{{name.pascalCase()}}.type.name.toUpperCase()}, "
        "send{{name.pascalCase()}}: ${send{{name.pascalCase()}}.type.name.toUpperCase()}, "
        ")";
  }

  {{name.pascalCase()}}State copyWith({
    StateBox<void>? getAllData,
    StateBox<{{name.pascalCase()}}Model>? get{{name.pascalCase()}},
    StateBox<void>? send{{name.pascalCase()}},
  }) {
    return {{name.pascalCase()}}State(
      getAllData: getAllData ?? this.getAllData,
      get{{name.pascalCase()}}: get{{name.pascalCase()}} ?? this.get{{name.pascalCase()}},
      send{{name.pascalCase()}}: send{{name.pascalCase()}} ?? this.send{{name.pascalCase()}},
    );
  }
}

