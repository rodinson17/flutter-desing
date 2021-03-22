import 'package:flutter/material.dart';
import 'package:myapp/components/cards/recent_course_card.dart';
import 'package:myapp/model/course.dart';
import 'package:myapp/screens/course_screen.dart';

class RecentCourselist extends StatefulWidget {
  @override
  _RecentCourselistState createState() => _RecentCourselistState();
}

class _RecentCourselistState extends State<RecentCourselist> {
  List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recentCourses.map((course) {
        var index = recentCourses.indexOf(course);
        return Container(
          width: 7.0,
          height: 7.0,
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Color(0xFF0971FE) : Color(0xFFA6AEBD),
          )
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CourseScreen(course: recentCourses[index]),
                      fullscreenDialog: true,
                    )
                  );
                },
                child: Opacity(
                  opacity: currentPage == index ? 1.0 : 0.5,
                  child: RecentCourseCard(
                    course: recentCourses[index],
                  ),
                ),
              );
            },
            itemCount: recentCourses.length,
            controller: PageController(
              initialPage: 0,
              viewportFraction: 0.63,
            ),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}