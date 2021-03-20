
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';

class DataService {//client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  var dio = Dio();

  static Future<Map> get(String url, {Map params}) async {
    Response response = await Dio().get("https://api.nasa.gov/planetary/" + url,
        queryParameters: params,
        options: Options(contentType: 'application/json'));

    if (response.statusCode != 200) {
      Fluttertoast.showToast(
        msg: 'error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return {'data': []};
    }

    return response.data;
  }
}
