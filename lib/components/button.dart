import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 2);

  final text;
  final bool big;
  final Color cor;
  final void Function(String) cb;

  Button({
    @required this.text,
    this.big = false,
    this.cor = DEFAULT,
    required this.cb,
  });

  Button.big({
    @required this.text,
    this.big = true,
    this.cor = DARK,
    required this.cb,
  });

  Button.operacao({
    @required this.text,
    this.big = false,
    this.cor = OPERATION,
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: cor,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ),
        onPressed: () => cb(text),
      ),
    );
  }
}
