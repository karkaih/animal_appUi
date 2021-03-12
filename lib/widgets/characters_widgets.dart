import 'package:animals_app/Pages/charactere_details.dart';
import 'package:animals_app/styleguide.dart';
import 'package:flutter/cupertino.dart';
import 'package:animals_app/models/characters.dart';
import 'package:flutter/material.dart';

class CharachterWidgets extends StatelessWidget {
  Characters_widgets characters_widgets;

  PageController pageController;
  int currentPage;

  CharachterWidgets(
      this.characters_widgets, this.pageController, this.currentPage);

  @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (context, _, __) =>
                CharachterDetailScreen(characters_widgets)));
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context,child) {
          double value = 1 ;
          if(pageController.position.haveDimensions){
            value = pageController.page - currentPage ;
            value = (1-(value.abs()* 0.6)).clamp(0.0, 1);
            if(currentPage==0) print(value);
          }
          return  Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: CharacterCardBackgroundClipper(),
                  child: Hero(
                    tag: "background-${characters_widgets.name}",
                    child: Container(
                      height: 0.55 * ScreenHeight,
                      width: 0.9 * ScreenWidth,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: characters_widgets.colors,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft)),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(0, -0.5),
                  child: Hero(
                    tag: "image-${characters_widgets.name}",
                    child: Image(
                        image: AssetImage(
                          characters_widgets.imagepath,
                        ),
                        height: ScreenHeight * 0.55 * value),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 48, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Hero(
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          characters_widgets.name,
                          style: AppTheme.heading,
                        ),
                      ),
                      tag: "name-${characters_widgets.name}",
                    ),
                    Text(
                      "Tap To read more",
                      style: AppTheme.subHeading,
                    ),
                  ],
                ),
              )
            ],
          );
        },

      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveDistance = 40;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curveDistance);
    path.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
    path.lineTo(size.width - curveDistance, size.height);
    path.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    path.lineTo(size.width, 0 + curveDistance);
    path.quadraticBezierTo(size.width - 1, 0, size.width - curveDistance - 5,
        0 + curveDistance / 3);
    path.lineTo(curveDistance, size.height * 0.29);
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
