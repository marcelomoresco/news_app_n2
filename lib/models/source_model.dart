// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String id;
  final String name;

  const Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
