import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Display extends StatelessWidget{

  final String text;
  Display(this.text);



  @override
  Widget build(BuildContext context){
    return Expanded(
      flex: 1, /*usado para expandir o tamanho da tela para pegar todo o espaço disponivel*/
        child:Container(
          color: Color.fromRGBO(48, 48, 48, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, /*Eixo da coluna*/
            crossAxisAlignment: CrossAxisAlignment.stretch, /*Eixo da Linha*/
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                    text,
                    minFontSize: 20,
                    maxFontSize: 80,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      decoration: TextDecoration.none,
                      fontSize: 80,
                      color: Colors.white,
                    ),

                ),

              )
            ],
          ),
          ),
        );
  }
}