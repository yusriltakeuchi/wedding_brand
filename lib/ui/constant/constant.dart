
// Block Spacing
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

const List<Condition> blockWidthConstraints = [
  Condition.equals(name: MOBILE, value: BoxConstraints(maxWidth: 600)),
  Condition.equals(name: TABLET, value: BoxConstraints(maxWidth: 700)),
  Condition.largerThan(name: TABLET, value: BoxConstraints(maxWidth: 1280)),
];

// Simple
const TextStyle styleTitle = TextStyle(
  fontSize: 44, 
  color: textPrimary
);

const TextStyle styleSubtitle = TextStyle(
  fontSize: 28, 
  color: textPrimary
);

const TextStyle styleCaption = TextStyle(
  fontSize: 16, 
  color: textPrimary, 
);

String getPath(str) {
  return (kIsWeb) ? 'assets/$str' : 'assets/$str';
}

const Color primary = Color(0xFF1389FD);
const Color textPrimary = Color(0xFF4A4A4A);
