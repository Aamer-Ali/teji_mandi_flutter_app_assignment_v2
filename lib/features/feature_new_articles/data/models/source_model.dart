import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/entities/source.dart';

class SourceModel extends Source {
  SourceModel({
    this.id,
    this.name,
  }) : super(id: id, name: name);

  SourceModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  @override
  List<Object?> get props => [id, name];
}
