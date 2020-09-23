import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

  const DefaultButton({
    Key key,
    @required this.onPressed,
    @required this.children,
    this.width = 50,
    this.height = 50,
    this.borderRadius = 30,
    this.buttonColor = Colors.purple,
    this.elevation = 8,
  }) : super(key: key);
  final Function onPressed;
  final List<Widget> children;
  final double width;
  final double height;
  final double borderRadius;
  final Color buttonColor;
  final double elevation;
  
  factory DefaultButton.icon({
    @required Function onPressed,
    @required IconData iconData,
    double iconSize = 45,
    Color iconColor = Colors.red
  }) => DefaultButton(
    onPressed: onPressed,
    children: <Widget>[
      Flexible(
        child: Icon(
          iconData,
          size: iconSize,
          color: iconColor,
        ),
      ),
    ],
  );

  factory DefaultButton.text({
    @required Function onPressed,
    @required String text,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color textColor = Colors.red,
    double width = 100,
    double height = 40,
    double borderRadius = 31,
  }) => DefaultButton(
    onPressed: onPressed,
    width: width,
    height: height,
    borderRadius: borderRadius,
    children: <Widget>[
      Flexible(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    ],
  );

  factory DefaultButton.iconAndText({
    @required Function onPressed,
    @required IconData iconData,
    @required String text,
    double iconSize = 32,
    Color iconColor = Colors.red,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color textColor = Colors.red,
    double width = 100,
    double height = 40,
    double borderRadius = 20,
  }) => DefaultButton(
    height: height,
    width: width,
    onPressed: onPressed,
    children: <Widget>[
      Flexible(
        flex: 1,
        child: Icon(
          iconData,
          size: iconSize,
          color: iconColor,
        ),
      ),
      Flexible(
        flex: 2,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    ],
  );
  

  Widget buttonWidget([Widget customContent, Function customOnPressed]) => RawMaterialButton(
    constraints: BoxConstraints(
      minWidth: width,
      minHeight: height,
    ),
    child: Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      child: customContent ?? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    ),
    onPressed: customOnPressed ?? onPressed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    elevation: elevation,
    fillColor: buttonColor,
    padding: const EdgeInsets.all(5.0),
    splashColor: buttonColor,
  );

  @override
  Widget build(BuildContext context) {
    return buttonWidget();
  }
}