import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eward_frontend/globals/globalvar.dart' as globals;

String ipaddress = globals.ipaddress;

Future<Map<String, dynamic>> singinapi(username, password) async {
  print("dsssssssssssssssssssssssssssssss");
  var url = Uri.parse('${ipaddress}/auths/signin/');
  var request = http.MultipartRequest('POST', url);
  request.fields['email'] = username;
  request.fields['password'] = password;
  request.headers['Content-Type'] = 'multipart/form-data';

  var response = await request.send();
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    var jsonresps = jsonDecode(jsonresp);
    return jsonresps;
  } else {
    return {"error": "requst not completed"};
  }
}

Future<List<dynamic>> notification() async {
  final sharedpref = await SharedPreferences.getInstance();
  String token = sharedpref.getString('token') as String;
  String user = sharedpref.getString('utype') as String;
  var url = Uri.parse('${ipaddress}/funs/get_noti/');
  var request = http.MultipartRequest('POST', url);
  request.fields['utype'] = user;
  request.fields['token'] = token;
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresps = jsonDecode(jsonresp);
    if (jsonresps['msg'] == 'sucess') {
      return jsonresps['notifications'];
    } else {
      return ["requst not completed"];
    }
  } else {
    return ["requst not completed"];
  }
}

Future<List<dynamic>> complaints() async {
  final sharedpref = await SharedPreferences.getInstance();
  String token = sharedpref.getString('token') as String;
  String user = sharedpref.getString('utype') as String;
  var url = Uri.parse('${ipaddress}/funs/get_comp/');
  var request = http.MultipartRequest('POST', url);
  request.fields['utype'] = user;
  request.fields['token'] = token;
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresps = jsonDecode(jsonresp);
    if (jsonresps['msg'] == 'sucess') {
      return jsonresps['complaints'];
    } else {
      return ["requst not completed"];
    }
  } else {
    return ["requst not completed"];
  }
}

Future<String> Logout() async {
  final shreprf = await SharedPreferences.getInstance();
  int? id = shreprf.getInt('id');

  var url = Uri.parse('${ipaddress}/auths/signout/${id}/');
  var request = http.MultipartRequest('GET', url);
  var response = await request.send();
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresponse = jsonDecode(jsonresp);
    if (jsonresponse['msg'] == 'sucess') {
      return "Logout sucessful";
    } else {
      return "Invaild user";
    }
  } else {
    return "Request failed";
  }
}

Future<String> complaints_reg(String title, String desc, dynamic img_path,
    {String status = 'Active', String remark = ' '}) async {
  final sharedpref = await SharedPreferences.getInstance();
  String token = sharedpref.getString('token') as String;
  String user = sharedpref.getString('utype') as String;
  var url = Uri.parse('${ipaddress}/funs/post_comp/');
  var request = http.MultipartRequest('POST', url);
  request.fields['utype'] = user;
  request.fields['token'] = token;
  request.fields['name'] = title;
  request.fields['desc'] = desc;
  request.files
      .add(await http.MultipartFile.fromPath('img_path', img_path.path));
  request.fields['img_path'] = img_path.path;
  if (user == "memb") {
    request.fields['status'] = status;
    request.fields['remark'] = remark;
  }
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    return "complaint Registered";
  } else {
    return "complaint not Registered";
  }
}
