import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:myapp/model/course.dart';


class CourseScreen extends StatefulWidget {
  CourseScreen({this.course});
  final Course course;

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                overflow: Overflow.clip,
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
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hace 5 años, no podía escribir una sola línea de Swift. Lo aprendí y me mudé a React, Flutter mientras usaba herramientas de diseño cada vez más complejas. No me arrepiento de haberlos aprendido porque SwiftUI toma todos sus mejores conceptos. Sin duda, es la mejor manera para que los diseñadores den un primer paso hacia el código.",
                      style: kBodyLabelStyle,
                    ),
                    SizedBox(height: 24.0,),
                    Text(
                      "Sobre este curso",
                      style: kTitle1Style,
                    ),
                    SizedBox(height: 24.0,),
                    Text(
                      "Este curso fue escrito para personas apasionadas por el diseño y por SwiftUI de Apple. Es amigable para principiantes, pero también está repleto de trucos y flujos de trabajo geniales sobre cómo construir la mejor interfaz de usuario. Actualmente, Xcode 11 todavía está en versión beta, por lo que el proceso de instalación puede ser un poco difícil. Sin embargo, una vez que todo funcione, ¡será mucho más amigable!",
                      style: kBodyLabelStyle,
                    ),
                    SizedBox(height: 24.0,),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}