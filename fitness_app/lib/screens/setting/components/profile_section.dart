import 'package:fitness_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.grey,
              onPressed: () => Navigator.pop(context)
              // size: 24.0,
            ),
            Text(
              ' Setting',
              style: TextStyle(
                  color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        
        Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(50.0),
                  child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(50.0)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(profileImage),
            ),
          ),
        )
      ],
    );
  }
}