import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/config.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, positiveBtnTxt, negativeBtnTxt;
  final String image;
  final void Function() onCancel;
  final void Function() onClick;
  final void Function() onDialogClose;
  bool showBtns = false;

  CustomDialog({
    required this.title,
    required this.description,
    required this.positiveBtnTxt,
    required this.negativeBtnTxt,
    required this.image,
    required this.onCancel,
    required this.onDialogClose,
    required this.onClick,
    required this.showBtns,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              InkWell(
                onTap: onDialogClose,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.close),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Visibility(
                visible: showBtns,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: onClick, child: Text(positiveBtnTxt)),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      child: Text(negativeBtnTxt),
                      onPressed: onCancel,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, onPrimary: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: Consts.avatarRadius,
            child: ClipOval(
              child: Image.asset(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        //...top circlular image part,
      ],
    );
  }
}
