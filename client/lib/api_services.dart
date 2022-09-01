import 'package:client/shared_services.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'dart:convert' as convert;

class APIServices{

  static Future<Map> getUserProfile() async {

    var loginDetails = await SharedService.loginDetails();


    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.data.token}'
    };

    var url = Uri.http(Config.apiURL,"${Config.usersAPI}${loginDetails.data.id}");

    var response = await http.get(
      url,
      headers: requestHeaders,
    );

    Map data = convert.jsonDecode(response.body);
    //print("${data} this is data in getUserProfile");

    //print("${response.body} this is response.body in getUserprofile");

    if (response.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }
}