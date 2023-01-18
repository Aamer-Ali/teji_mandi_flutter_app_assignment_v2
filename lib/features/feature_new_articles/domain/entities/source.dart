import 'package:equatable/equatable.dart';

class Source extends Equatable {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  @override
  List<Object?> get props => [id, name];

  @override
  bool? get stringify => true;
}
