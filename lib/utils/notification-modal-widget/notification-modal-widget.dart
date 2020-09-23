import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

enum MessageType { success, warning, error }

class NotificationModalWidget extends StatelessWidget {
  const NotificationModalWidget({
    Key key,
    @required this.message,
    @required this.messageType,
  }) : super(key: key);
  final String message;
  final MessageType messageType;
  static Map<MessageType, Stack> circleIcon = {
    MessageType.success: Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          width: 140.0,
          height: 140.0,
          decoration: BoxDecoration(
            color: (Colors.green),
            shape: BoxShape.circle,
          ),
        ),
        Icon(Icons.check, size: 130, color: Colors.white),
      ],
    ),
    MessageType.error: Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          width: 140.0,
          height: 140.0,
          decoration: BoxDecoration(
            color: (Colors.red),
            shape: BoxShape.circle,
          ),
        ),
        Icon(Icons.close, size: 130, color: Colors.white),
      ],
    ),
    MessageType.warning: Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          width: 140.0,
          height: 140.0,
          decoration: BoxDecoration(
            color: (Colors.yellowAccent),
            shape: BoxShape.circle,
          ),
        ),
        Icon(Icons.priority_high, size: 130, color: Colors.white),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.all(0),
      content: Container(
        padding: EdgeInsets.all(32),
        width: 300,
        height: 300,
        child: Column(
          children: <Widget>[
            circleIcon[messageType],
            SizedBox(height: 24),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AutoSizeText(message, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28), textAlign: TextAlign.center, maxLines: 3) 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}