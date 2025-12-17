import 'dart:convert';

import 'package:equatable/equatable.dart';

class {{name.pascalCase()}}Model extends Equatable {
  final String? data;
  const {{name.pascalCase()}}Model({this.data});

  {{name.pascalCase()}}Model copyWith({String? data}) {
    return {{name.pascalCase()}}Model(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory {{name.pascalCase()}}Model.fromMap(Map<String, dynamic> map) {
    return {{name.pascalCase()}}Model(
      data: map['data'] != null ? map['data'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory {{name.pascalCase()}}Model.fromJson(String source) =>
      {{name.pascalCase()}}Model.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
