import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:myapp/model/course.dart';
import 'package:myapp/screens/course_sections_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({this.course});
  final Course course;

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Widget indicators() {
    List<Widget> indicators = [];

    for (var i = 0; i < 9; i++) {
      indicators.add(Container(
        width: 7.0,
        height: 7.0,
        margin: EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: i == 0 ? Color(0xFF0971FE) : Color(0xFFA6AEBD)
        ),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  PanelController panelController;

  @override
  void initState() {
    super.initState();
    panelController = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SlidingUpPanel(
          controller: panelController,
          backdropEnabled: true,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.0),
          ),
          color: kCardPopupBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, -12),
              blurRadius: 32.0,
            ),
          ],
          minHeight: 0.0,
          maxHeight: MediaQuery.of(context).size.height * 0.95,          
          panel: CourseSectionScreen(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  overflow: Overflow.clip, //TODO: revisar esto
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          gradient: widget.course.background,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.0, ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(18.0),
                                      ),
                                      child: Hero(
                                        tag: widget.course.logo,
                                        child: Image.asset('asset/logos/${widget.course.logo}'),
                                      ),
                                    ),
                                    SizedBox(width: 20.0,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Hero(
                                            tag: widget.course.courseSubtitle,
                                            child: Text(
                                              widget.course.courseSubtitle, 
                                              style: kSecondaryCalloutLabelStyle.copyWith(color: Colors.white70),
                                            ),
                                          ),
                                          Hero(
                                            tag: widget.course.courseTitle, 
                                            child: Text(
                                              widget.course.courseTitle, 
                                              style: kLargeTitleStyle.copyWith(color: Colors.white),
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.0),
                                          color: kPrimaryLabelColor.withOpacity(0.8),
                                        ),
                                        child: Icon(
                                          Icons.close, 
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 28.0,),
                              Expanded(
                                child: Hero(
                                  tag: widget.course.illustration,
                                  child: Image.asset(
                                    'asset/illustrations/${widget.course.illustration}',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 28.0),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 12.5,
                          bottom: 13.5,
                          left: 20.5,
                          right: 14.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: kShadowColor,
                              blurRadius: 16.0,
                              offset: Offset(0, 4),
                            )
                          ]
                        ),
                        width: 60.0,
                        height: 60.0,
                        child: Image.asset('asset/icons/icon-play.png'),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 12.0,
                    left: 28.0,
                    right: 28.0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  child: Icon(
                                    Platform.isAndroid ? Icons.people : CupertinoIcons.group_solid,
                                    color: Colors.white,
                                  ),
                                  radius: 21.0,
                                  backgroundColor: kCourseElementIconColor,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                              ),
                            ),
                            height: 58.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                              gradient: widget.course.background,
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                          ),
                          SizedBox(width: 12.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "28.7K", 
                                style: kTitle2Style,
                              ),
                              Text(
                                "Estudiantes", 
                                style: kSearchPlaceholderStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  child: Icon(
                                    Platform.isAndroid ? Icons.format_quote : CupertinoIcons.news_solid,
                                    color: Colors.white,
                                  ),
                                  radius: 21.0,
                                  backgroundColor: kCourseElementIconColor,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                              ),
                            ),
                            height: 58.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                              gradient: widget.course.background,
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                          ),
                          SizedBox(width: 12.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "12.4K", 
                                style: kTitle2Style,
                              ),
                              Text(
                                "Comentarios", 
                                style: kSearchPlaceholderStyle,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      indicators(),
                      GestureDetector(
                        onTap: () {
                          panelController.open();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: kShadowColor,
                                offset: Offset(0, 12),
                                blurRadius: 16.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          width: 80.0,
                          height: 40.0,
                          child: Text(
                            "Ver todo",
                            style: kSearchTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hace 5 a??os, no pod??a escribir una sola l??nea de Swift. Lo aprend?? y me mud?? a React, Flutter mientras usaba herramientas de dise??o cada vez m??s complejas. No me arrepiento de haberlos aprendido porque SwiftUI toma todos sus mejores conceptos. Sin duda, es la mejor manera para que los dise??adores den un primer paso hacia el c??digo.",
                        style: kBodyLabelStyle,
                      ),
                      SizedBox(height: 24.0,),
                      Text(
                        "Sobre este curso",
                        style: kTitle1Style,
                      ),
                      SizedBox(height: 24.0,),
                      Text(
                        "Este curso fue escrito para personas apasionadas por el dise??o y por SwiftUI de Apple. Es amigable para principiantes, pero tambi??n est?? repleto de trucos y flujos de trabajo geniales sobre c??mo construir la mejor interfaz de usuario. Actualmente, Xcode 11 todav??a est?? en versi??n beta, por lo que el proceso de instalaci??n puede ser un poco dif??cil. Sin embargo, una vez que todo funcione, ??ser?? mucho m??s amigable!",
                        style: kBodyLabelStyle,
                      ),
                      SizedBox(height: 24.0,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
