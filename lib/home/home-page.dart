import 'package:apod/custom-widgets/spinner.dart';
import 'package:apod/home/home-bloc.dart';
import 'package:apod/custom-widgets/picture-widget.dart';
import 'package:apod/home/search-box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black87,
            child: StreamBuilder(
                stream: bloc.pictureStream,
                builder: (context, snapshot) => snapshot.hasData
                    ? PictureWidget(picture: snapshot.data)
                    : Center(child: Spinner())),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SearchBox(bloc: bloc),
              ))
        ],
      ),
    );
  }
}
