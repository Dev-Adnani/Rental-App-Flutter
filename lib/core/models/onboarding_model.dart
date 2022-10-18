// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OnboardingModel {
  final String title;
  final String description;
  final String image;
  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });

  OnboardingModel copyWith({
    String? title,
    String? description,
    String? image,
  }) {
    return OnboardingModel(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingModel.fromJson(String source) =>
      OnboardingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OnboardingModel(title: $title, description: $description, image: $image)';
}
