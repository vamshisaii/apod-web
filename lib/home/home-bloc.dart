import 'dart:async';

import 'package:apod/core/data-service.dart';
import 'package:apod/models/picture.model.dart';
import 'package:intl/intl.dart';

class HomeBloc {
  Picture picture;

  HomeBloc() {
    loadAPOD(DateFormat('yyyy-MM-dd').format(DateTime.now()));
  }

  StreamController<Picture> pictureController =
      StreamController<Picture>.broadcast();
  Stream<Picture> get pictureStream => pictureController.stream;

  void dispose() {
    pictureController.close();
  }

  void loadAPOD(String date) async {
    var data = await DataService.get('apod', params: <String, dynamic>{
      "api_key": "aWPhODExHc5j48m59viPzCysv1jkoaN7ID2dchPw",
      "date": date
    });

    if (data != null) {
      var picture = Picture.fromJson(data);
      pictureController.add(picture);
    }
  }
}
