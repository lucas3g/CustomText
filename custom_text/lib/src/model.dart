import 'dart:convert';

import 'package:flutter/foundation.dart';

class CustomText {
  final String text;
  final List<String> tags;
  final bool? isBold;
  final bool? isItalic;
  final bool? isUnderline;
  CustomText({
    required this.text,
    required this.tags,
    this.isBold,
    this.isItalic,
    this.isUnderline,
  });

  CustomText copyWith({
    String? text,
    List<String>? tags,
    bool? isBold,
    bool? isItalic,
    bool? isUnderline,
  }) {
    return CustomText(
      text: text ?? this.text,
      tags: tags ?? this.tags,
      isBold: isBold ?? this.isBold,
      isItalic: isItalic ?? this.isItalic,
      isUnderline: isUnderline ?? this.isUnderline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'tags': tags,
      'isBold': isBold,
      'isItalic': isItalic,
      'isUnderline': isUnderline,
    };
  }

  factory CustomText.fromMap(Map<String, dynamic> map) {
    return CustomText(
      text: map['text'],
      tags: List<String>.from(map['tags']),
      isBold: map['isBold'] != null ? map['isBold'] : null,
      isItalic: map['isItalic'] != null ? map['isItalic'] : null,
      isUnderline: map['isUnderline'] != null ? map['isUnderline'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomText.fromJson(String source) =>
      CustomText.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomText(text: $text, tags: $tags, isBold: $isBold, isItalic: $isItalic, isUnderline: $isUnderline)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomText &&
        other.text == text &&
        listEquals(other.tags, tags) &&
        other.isBold == isBold &&
        other.isItalic == isItalic &&
        other.isUnderline == isUnderline;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        tags.hashCode ^
        isBold.hashCode ^
        isItalic.hashCode ^
        isUnderline.hashCode;
  }
}
