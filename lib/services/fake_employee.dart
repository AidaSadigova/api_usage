import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

import '../models/employees_fakestore.dart';

Future<List<FakeUsers>?> getFakeStoreEmployeesWithHttp() async {
  var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var res = await http.get(uri);

  try {
    if (res.statusCode == 200) {
      var body = json.decode(res.body) as List;
      return body.map((e) => FakeUsers.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}

Future<List<FakeUsers>?> getFakeStoreEmployeesWithDio() async {
  var url = 'https://jsonplaceholder.typicode.com/users';
  var res = await Dio().get(url);

  try {
    if (res.statusCode == 200) {
      var body = res.data as List;
      return body.map((e) => FakeUsers.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}
