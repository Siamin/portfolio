import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/models/dataModel.dart';

class JsonController {
  Future<DataModel> readDataJson({required String fileName}) async {
    await Future.delayed(Duration(seconds: 2));
    final String resp =
        await rootBundle.loadString('assets/jsons/$fileName.json');
    final data = await json.decode(resp);
    return DataModel.fromJson(data);
  }
}
