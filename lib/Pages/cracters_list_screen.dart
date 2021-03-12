import 'package:animals_app/styleguide.dart';
import 'package:animals_app/widgets/characters_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animals_app/models/characters.dart';

class CharactersListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CharactersListScreen();
  }
}

class _CharactersListScreen extends State<CharactersListScreen> {
  PageController pageController;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 8),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Animals Kingdom", style: AppTheme.display1),
                  TextSpan(text: "\n"),
                  TextSpan(text: "Characteres", style: AppTheme.display2)
                ])),
              ),
              Expanded(
                  child: PageView(
                    controller: pageController,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  for (var j = 0; j < chracters.length; j++)
                    CharachterWidgets(chracters[j],pageController,j),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
