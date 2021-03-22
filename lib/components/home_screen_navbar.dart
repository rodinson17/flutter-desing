import 'package:flutter/material.dart';

import '../constants.dart';
import 'searchfield_widget.dart';
import 'sidebar_button.dart';

class HomeScreenNavBar extends StatelessWidget {
  HomeScreenNavBar({@required this.triggerAnimation});
  final Function triggerAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(triggerAnimation: triggerAnimation,),
          SearchFieldWidget(),
          Icon(
            Icons.notifications, 
            color: kPrimaryLabelColor,
          ),
          SizedBox(width: 16.0,),
          CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage('asset/images/profile.jpg'),
          )
        ]
      ),
    );
  }
}

