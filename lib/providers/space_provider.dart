// ignore_for_file: file_names

import 'dart:convert';

import 'package:cozy_app/models/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  Future<List<Space>> getRecommendedSpaces() async {
    var result = await http
        .get(Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'));

    if (result.statusCode == 200) {
      List data = json.decode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();

      return spaces.toList();
    } else {
      return <Space>[];
    }
  }
}
