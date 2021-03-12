import 'package:after_layout/after_layout.dart';
import 'package:animals_app/styleguide.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:animals_app/models/characters.dart';

class CharachterDetailScreen extends StatefulWidget {
  final Characters_widgets character;

  CharachterDetailScreen(this.character);

  final double expandeBottom = 0;

  final double collapsedbottomSheet = -250;

  final double fullcollapsedbottomSheet = -330;

  @override
  State<StatefulWidget> createState() {
    return _CharachterDetailScreen();
  }
}

class _CharachterDetailScreen extends State<CharachterDetailScreen>
    with AfterLayoutMixin<CharachterDetailScreen> {
  double _currentButtomSheet = -330;

  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: "background-${widget.character.name}",
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
              colors: widget.character.colors,
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ))),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 8, left: 16),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.white.withOpacity(0.9),
                      iconSize: 40,
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 250),(){
                          setState(() {
                            _currentButtomSheet = widget.fullcollapsedbottomSheet;
                          });
                        });

                        Navigator.of(context).pop();
                      },
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag: "image-${widget.character.name}",
                      child: Image(
                        image: AssetImage(widget.character.imagepath),
                        height: screenHeight * 0.45,
                      ),
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Hero(
                    tag: "name-${widget.character.name}",
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        widget.character.name,
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8,100),
                  child: Text(
                    widget.character.descriptions,
                    style: AppTheme.subHeading,
                  ),
                )
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.decelerate,
            bottom: _currentButtomSheet,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: _onTap,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      height: 80,
                      child: Text(
                        "Clips",
                        style: AppTheme.subHeading.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: clipsWidget(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  _onTap(){
    setState(() {
      _currentButtomSheet= isCollapsed? widget.expandeBottom:widget.collapsedbottomSheet;
      isCollapsed = !isCollapsed;
    });
  }
  Widget clipsWidget() {
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            children: [
              roundedContainer(Colors.redAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.greenAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: [
              roundedContainer(Colors.orangeAccent),
              SizedBox(height: 20),
              roundedContainer(Colors.purpleAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: [
              roundedContainer(Colors.blue),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.lightGreenAccent),
            ],
          ),
          SizedBox(width: 16),
          Column(
            children: [
              roundedContainer(Colors.pink),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.brown),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedContainer(Color color) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isCollapsed = true;
        _currentButtomSheet = widget.collapsedbottomSheet;
      });
    });
  }
}
