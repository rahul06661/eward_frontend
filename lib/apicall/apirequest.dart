import 'dart:convert';
import 'dart:ffi';
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

Future<String> updateRemark(remark, idss) async {
  print("_______________________________________");
  print(idss.runtimeType);
  final sharedpref = await SharedPreferences.getInstance();

  String user = sharedpref.getString('utype') as String;
  var url = Uri.parse('${ipaddress}/funs/update_comp/');
  var request = http.MultipartRequest('POST', url);
  request.headers['Content-Type'] = 'multipart/form-data';
  request.fields['utype'] = user;
  request.fields['remark'] = remark;
  request.fields['id'] = idss;
  var response = await request.send();
  print("___________________");
  print(response.statusCode);
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresps = jsonDecode(jsonresp);

    if (jsonresps['msg'] == 'sucess') {
      return "Remark updated";
    } else {
      return "error occoured updated";
    }
  } else {
    return "error occoured ";
  }
}

Future<List<dynamic>> notification() async {
  final sharedpref = await SharedPreferences.getInstance();
  String token = sharedpref.getString('token') as String;
  String user = sharedpref.getString('utype') as String;
  print(user);
  print("___________________________________      ____                ");
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

Future<String> familyMemberRegistration(Map fam_obj) async {
  final sharedpref = await SharedPreferences.getInstance();
  String token = sharedpref.getString('token') as String;
  String user = sharedpref.getString('utype') as String;
  var url = Uri.parse('${ipaddress}/funs/family_memb_reg/');
  var request = http.MultipartRequest('POST', url);
  request.fields['utype'] = user;
  request.fields['token'] = token;

  fam_obj.forEach((key, value) {
    request.fields[key] = value;
  });
  var response = await request.send();
  if (response.statusCode == 200) {
    return "FamilyMemberRegistration Sucessful";
  } else {
    return "FamilyMemberRegistration Not Sucessful";
  }
}

Future<String> userRegistrations(Map userObj) async {
  var url = Uri.parse('${ipaddress}/auths/user_signup/');
  var request = http.MultipartRequest('POST', url);
  userObj.forEach((key, value) {
    request.fields[key] = value;
  });
  var response = await request.send();
  if (response.statusCode == 200) {
    return "UserRegistration Sucessful";
  } else {
    return "userRegistration Not Sucessful";
  }
}

Future<String> postnotification(
    String title, String desc, dynamic img_path) async {
  final sharepref = await SharedPreferences.getInstance();
  String token = sharepref.getString('token') as String;
  String user = sharepref.getString('utype') as String;
  var url = Uri.parse('$ipaddress/funs/post_notifi/');
  var request = http.MultipartRequest('POST', url);
  request.fields['utype'] = user;
  request.fields['token'] = token;
  request.fields['name'] = title;
  request.files['desc'] = desc;
  if (img_path != null) {
    request.files
        .add(await http.MultipartFile.fromPath('img_path', img_path.path));
  }
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    return "Notification Posted";
  } else {
    return "Error occured";
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
  if (img_path != null) {
    request.files
        .add(await http.MultipartFile.fromPath('img_path', img_path.path));
    request.fields['img_path'] = img_path.path;
  }
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    return "complaint Registered";
  } else {
    return "complaint not Registered";
  }
}
