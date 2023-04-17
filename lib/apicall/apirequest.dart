import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eward_frontend/globals/globalvar.dart' as globals;

String ipaddress = globals.ipaddress;

Future<void> clear_cache() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}

Future<Map<String, dynamic>> singinapi(username, password) async {
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

void approval(String email) async {
  final sharedpref = await SharedPreferences.getInstance();
  var url = Uri.parse('${ipaddress}/auths/approve/');
  var request = http.MultipartRequest('POST', url);
  request.headers['Content-Type'] = 'multipart/form-data';
  request.fields['email'] = email;
  var response = await request.send();
}

Future<String> updateRemark(remark, idss) async {
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
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresps = jsonDecode(jsonresp);
    return jsonresps['msg'];
  } else {
    return "error occoured ";
  }
}

Future<List<dynamic>> notapproved() async {
  final sharedpref = await SharedPreferences.getInstance();
  String user = sharedpref.getString('utype') as String;
  String email = sharedpref.getString('email') as String;
  var url = Uri.parse('${ipaddress}/auths/not_regs_user/');
  var request = http.MultipartRequest('POST', url);
  request.fields['utype'] = user;
  request.fields['email'] = email;
  request.headers['Content-type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    print(response);
    var jsonresp = await response.stream.bytesToString();
    final jsonresps = jsonDecode(jsonresp);
    if (jsonresps['msg'] == 'sucess') {
      print(jsonresps['data']);
      return jsonresps['data'];
    } else {
      return ["requst not completed"];
    }
  } else {
    return ["requst not completed"];
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

Future<List<dynamic>> getmembers() async {
  final sharedpref = await SharedPreferences.getInstance();
  String user = sharedpref.getString('utype') as String;
  var url = Uri.parse('${ipaddress}/auths/get_member/');
  var request = http.MultipartRequest('POST', url);
  request.fields['utype'] = user;
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresps = jsonDecode(jsonresp);
    if (jsonresps['msg'] == 'sucess') {
      return jsonresps['data'];
    } else {
      return [jsonresps['msg']];
    }
  } else {
    return ["requst not completed"];
  }
}

Future<dynamic> getcompstaus() async {
  final sharedpref = await SharedPreferences.getInstance();
  String token = sharedpref.getString('token') as String;
  var url = Uri.parse('${ipaddress}/funs/compstatus/');
  var request = http.MultipartRequest('POST', url);
  request.fields['token'] = token;
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresps = jsonDecode(jsonresp);
    return jsonresps['status'];
  }
}

Future<List<dynamic>> profile(selecteddata, selecteditem) async {
  print(selecteddata);
  print(selecteditem);
  if (selecteddata != '' && selecteditem != '') {
    final sharedpref = await SharedPreferences.getInstance();
    String usermail = sharedpref.getString('email') as String;
    var url = Uri.parse('${ipaddress}/funs/analysis/');
    var request = http.MultipartRequest('POST', url);
    request.fields['selectedData'] = selecteddata;
    request.fields['selectedItem'] = selecteditem;
    request.fields['user'] = usermail;
    request.headers['Content-Type'] = 'multipart/form-data';
    var response = await request.send();
    print(response);
    if (response.statusCode == 200) {
      var jsonresp = await response.stream.bytesToString();
      final jsonresps = jsonDecode(jsonresp);
      if (jsonresps['msg'] == 'sucess') {
        return jsonresps['data'];
      } else {
        return ["requst not completed"];
      }
    } else {
      return ["requst not completed"];
    }
  } else {
    return [];
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

Future<List<dynamic>> get_chat(compId) async {
  print(compId);
  var url = Uri.parse('${ipaddress}/funs/messages/');
  var request = http.MultipartRequest('POST', url);
  request.fields['id'] = compId;
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresps = jsonDecode(jsonresp);
    if (jsonresps['msg'] == 'sucess') {
      return jsonresps['messages'];
    } else {
      return ["requst not completed"];
    }
  } else {
    return ["requst not completed"];
  }
}

Future<String> closeComplaint(compId) async {
  var url = Uri.parse('${ipaddress}/funs/closeComplaint/');
  var request = http.MultipartRequest('POST', url);
  request.fields['id'] = compId;
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  Future.delayed(Duration(milliseconds: 30));
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresps = jsonDecode(jsonresp);

    return jsonresps['msg'];
  } else {
    return "requst not completed";
  }
}

Future<String> getStatus(compId) async {
  var url = Uri.parse('${ipaddress}/funs/getstatus/');
  var request = http.MultipartRequest('POST', url);
  request.fields['id'] = compId;
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresps = jsonDecode(jsonresp);
    if (jsonresps['msg'] == 'sucess') {
      print("********************************");
      print(jsonresps['status']);
      return jsonresps['status'];
    } else {
      return "requst not completed";
    }
  } else {
    return "requst not completed";
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

Future<String> memberRegistration(Map memb_obj) async {
  final sharedpref = await SharedPreferences.getInstance();
  String user = sharedpref.getString('utype') as String;
  var url = Uri.parse('${ipaddress}/auths/member_signup/');
  var request = http.MultipartRequest('POST', url);
  request.fields['utype'] = user;
  memb_obj.forEach((key, value) {
    request.fields[key] = value;
  });
  var response = await request.send();

  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresponse = jsonDecode(jsonresp);
    print(jsonresponse['msg']);
    print("______________________________________________");
    return jsonresponse['msg'];
  } else {
    return "Registration Not Sucessful";
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
  request.headers['Content-Type'] = 'multipart/form-data';
  var response = await request.send();
  if (response.statusCode == 200) {
    var jsonresp = await response.stream.bytesToString();
    final jsonresponse = jsonDecode(jsonresp);
    return jsonresponse['msg'];
  } else {
    return "userRegistration Not Sucessful";
  }
}

Future<String> postnotification(
    String title, String desc, dynamic img_path) async {
  final sharepref = await SharedPreferences.getInstance();
  String token = sharepref.getString('token') as String;
  String user = sharepref.getString('utype') as String;
  var url = Uri.parse('$ipaddress/funs/post_noti/');
  var request = http.MultipartRequest('POST', url);
  request.fields['utype'] = user;
  request.fields['token'] = token;
  request.fields['name'] = title;
  request.fields['desc'] = desc;
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
