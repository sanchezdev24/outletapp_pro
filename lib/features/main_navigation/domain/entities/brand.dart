import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final int id;
  final String name;
  final String logo;
  final String description;

  const Brand({
    required this.id,
    required this.name,
    required this.logo,
    required this.description,
  });

  @override
  List<Object> get props => [id, name, logo, description];
}