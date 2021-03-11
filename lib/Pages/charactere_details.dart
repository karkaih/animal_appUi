
import 'package:flutter/material.dart';
import 'package:animals_app/models/characters.dart';

class CharachterDetailScreen extends StatefulWidget {
final  Characters_widgets character;

 CharachterDetailScreen(this.character);

  @override
  State<StatefulWidget> createState() {
    return _CharachterDetailScreen();
  }
}

class _CharachterDetailScreen extends State<CharachterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
            colors: widget.character.colors,
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8, left: 16),
                  child: IconButton(
                    icon : Icon (Icons.close),
                    color: Colors.white.withOpacity(0.9),
                    iconSize: 40,
                    onPressed: (){
Navigator.of(context).pop();
                    },
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
