import 'package:flutter_web/material.dart';
import 'package:portfolio/utils/app_clip_path.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/widgets/contact.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'dart:html' as html;
import '../data/projects.dart' as dataprojects;

class Footer extends StatelessWidget {
  final double iconSize = 35;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          dataprojects.projects.length.isEven ? Colors.black87 : Colors.white,
      child: ClipPath(
        clipper: AppClipPath(AppClipPath.CLICP_TOP),
        child: ResponsiveWidget(
          largeScreen: _largeScreen(context),
          smallScreen: _smallScreen(context),
        ),
      ),
    );
  }

  Widget _largeScreen(BuildContext context) {
    return Container(
      height: 500,
      child: Stack(children: [
        Image.asset(
          'images/cover.jpg',
          alignment: Alignment.bottomLeft,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / 5,
              left: MediaQuery.of(context).size.width / 5,
              top: 100,
              bottom: 10),
          color: AppColors.blackTransparent,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('images/me.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        _socialIcons(),
                      ],
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(width: 600, child: Contact()))),
                  ],
                ),
              ),
              _copyRight()
            ],
          ),
        ),
      ]),
    );
  }

  Widget _smallScreen(BuildContext context) {
    return Container(
        color:
            dataprojects.projects.length.isEven ? Colors.black87 : Colors.white,
        height: 600,
        child: Stack(children: [
          Image.asset(
            'images/cover.jpg',
            alignment: Alignment.bottomLeft,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 20,
                left: MediaQuery.of(context).size.width / 20,
                top: 60,
                bottom: 10),
            color: AppColors.blackTransparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('images/me.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _socialIcons(),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(width: 600, child: Contact()))),
                    ],
                  ),
                ),
                _copyRight()
              ],
            ),
          ),
        ]));
  }

  Widget _socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () =>
              html.window.open('https://github.com/GeekAbdelouahed', 'Github'),
          child: Image.asset(
            'images/github.png',
            height: iconSize,
            width: iconSize,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () => html.window.open(
              'https://www.linkedin.com/in/abdelouahed-medjoudja/', 'Linkedin'),
          child: Image.asset(
            'images/linkedin.png',
            height: iconSize,
            width: iconSize,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () => html.window.open(
              'https://www.facebook.com/AbdelouahedMedjoudja', 'Facebook'),
          child: Image.asset(
            'images/facebook.png',
            height: iconSize,
            width: iconSize,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () =>
              html.window.open('https://twitter.com/MedAbdelouahed', 'Twitter'),
          child: Image.asset(
            'images/twitter.png',
            height: iconSize,
            width: iconSize,
          ),
        ),
      ],
    );
  }

  Widget _copyRight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Abdelouahed Medjoudja . 2019',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.copyright,
          size: 15,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () =>
              html.window.open('https://github.com/GeekAbdelouahed', 'Github'),
          child: Text(
            'Github',
            style: TextStyle(
                decoration: TextDecoration.underline, color: Colors.white),
          ),
        )
      ],
    );
  }
}
