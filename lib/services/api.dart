import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  void request() {
    String url =
        'https://myshop-dd26b-default-rtdb.europe-west1.firebasedatabase.app/';

    Uri uri = Uri.parse(url, null);
    http.post(uri, body: json.encode({})).then((response) => {});
  }

  // create future example
  Future<String> futureTest() {
    return Future(() {
      return 'Hello';
    }).then((value) => null).catchError((error) => throw error);
  }

  Future<String> asyncTest() async {
    await futureTest();
  }

  //THIS SHOULD GO IN STATEFULL WIDGETS
  void forInitState() {
    Future.delayed(Duration.zero).then((_) {
      //use providers context here
    });
  }
}
