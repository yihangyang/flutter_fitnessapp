  
import 'package:fitness_app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:slide_to_confirm/slide_to_confirm.dart';


class AddCart extends StatelessWidget {
  const AddCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFCBF1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/funi_chat.svg",
            height: 18,
          ),
          SizedBox(width: kDefaultPadding / 2),
          Text(
            "Chat",
            style: TextStyle(color: Colors.white),
          ),
          // it will cover all available spaces
          Spacer(),
          FlatButton.icon(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            icon: SvgPicture.asset(
              "assets/icons/funi_shopping_bag.svg",
              height: 18,
            ),
            label: Text(
              "Add to Cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Container(
          alignment: Alignment.center,
          height: 120.0,
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          child: ConfirmationSlider(
            text: 'Slide to purchase ',
            foregroundColor: kPrimaryColor,
            onConfirmation: () {
              print('slider Comfirmation');
              Navigator.pop(context);
            }
          )
        ),
      ),
    );
  }
}