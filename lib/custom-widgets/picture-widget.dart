import 'package:apod/custom-widgets/spinner.dart';
import 'package:apod/models/picture.model.dart';
import 'package:flutter/material.dart';

class PictureWidget extends StatelessWidget {
  const PictureWidget({Key key, @required this.picture}) : super(key: key);
  final Picture picture;

  showAlertDialog(BuildContext context, Picture details) {
    AlertDialog alert = AlertDialog(
      title: Text("Explanation"),
      content:
          Text("${details.explanation}\n\ncopyright: ${details.copyright??''}"),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Center(
          child: Container(
            height: size.height,
            width: size.width,
            child: Image.network(
              picture.hdurl,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null)
                  return FittedBox(fit: BoxFit.fitHeight, child: child);
                return Center(
                  child: Spinner(),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 150,
          width: size.width,
          child: Center(
            child: Text(picture.title,
                style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                    fontSize: 80)),
          ),
        ),
        Positioned(
          bottom: 10,
          width: size.width,
          child: Center(
            child: TextButton(
              child: Text('Show Details', style: TextStyle(fontSize: 15)),
              onPressed: () {
                showAlertDialog(context, picture);
              },
            ),
          ),
        )
      ],
    );
  }
}
