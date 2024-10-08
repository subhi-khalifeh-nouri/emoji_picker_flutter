import 'package:flutter/material.dart';

/// A class to store data for each individual emoji
@immutable
class Emoji {
  /// Emoji constructor
  const Emoji(this.emoji, this.name, this.emojiUnicode,
      {this.hasSkinTone = false});

  /// The unicode string for this emoji
  ///
  /// This is the string that should be displayed to view the emoji
  final String emoji;

  /// The name or description for this emoji
  final String name;

  /// Flag if emoji supports multiple skin tones
  final bool hasSkinTone;

  /// The name or description for this emoji
  final String emojiUnicode;

  @override
  String toString() {
    return 'Emoji: $emoji, Name: $name, HasSkinTone: $hasSkinTone';
  }

  /// Parse Emoji from json
  static Emoji fromJson(Map<String, dynamic> json) {
    return Emoji(
      json['emoji'] as String,
      json['name'] as String,
      json['emojiUnicode'] != null ? json['emojiUnicode'] as String : '',
      hasSkinTone:
          json['hasSkinTone'] != null ? json['hasSkinTone'] as bool : false,
    );
  }

  ///  Encode Emoji to json
  Map<String, dynamic> toJson() {
    return {
      'emoji': emoji,
      'name': name,
      'hasSkinTone': hasSkinTone,
      "emojiUnicode": emojiUnicode,
    };
  }

  /// Copy method
  Emoji copyWith(
      {String? name, String? emoji, bool? hasSkinTone, String? emojiUnicode}) {
    return Emoji(
      emoji ?? this.emoji,
      name ?? this.name,
      emojiUnicode ?? this.emojiUnicode,
      hasSkinTone: hasSkinTone ?? this.hasSkinTone,
    );
  }
}
