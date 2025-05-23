import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final Color color;
  final String? icon; // Could be an icon code or asset path

  Category({
    required this.id,
    required this.name,
    required this.color,
    this.icon,
  });
}