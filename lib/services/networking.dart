import 'package:http/http.dart' as http;
import 'dart:convert';
class Networking {
  Future networking(String uRL) async {
    try {
      var url = Uri.parse(uRL);
      http.Response response = await http.get(url);
      if(response.statusCode==200)
      {
        var decodeData= jsonDecode(response.body);
        return decodeData;
      }
      else
      {
        networking(uRL);
      }
    }
    catch(e)
    {
      print(e);
    }
  }
}