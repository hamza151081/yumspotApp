// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomCusture extends StatefulWidget {
  const CustomCusture({
    super.key,
    this.width,
    this.height,
    required this.actionLeft,
    required this.actionRghit,
  });

  final double? width;
  final double? height;
  final Future Function() actionLeft;
  final Future Function() actionRghit;

  @override
  State<CustomCusture> createState() => _CustomCustureState();
}

class _CustomCustureState extends State<CustomCusture> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onHorizontalDragEnd: (details) {
      if (details.velocity.pixelsPerSecond.dx > 0) {
        // Swipe Right
        print("swiping right");
        widget.actionRghit.call();
      } else if (details.velocity.pixelsPerSecond.dx < 0) {
        // Swipe Left
        print("swiping left");
        widget.actionLeft.call();
      }
    });
  }
}
