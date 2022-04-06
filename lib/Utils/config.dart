import 'dart:convert';

import 'package:care_monitor/Models/medication_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

String BASE_URL = "http://marutiplywood.erbansal.com/EinixPocket.asmx/";
const Color appColor = Colors.blue;
const String appIcon = "assets/images/logo.png";

double horizontalPadding = 10;
double verticalPadding = 10;
double radiusLight = 5;
const double radiusMedium = 5;
const double dropDownBottomMargin = 10;


class Common {
  static final APP_NAME = "Care Monitor";
  static final String SUCCESS_KEY = "Result";
  static final String MESAGE_KEY = "message";
  static final String DATA_KEY = "data";
  static final int DURATION_SNACKBAR = 1500;
}

// Future<http.Response> GetMedications(Map<String, String> data) async {
//   final response =
//   await http.post(Uri.https(BASE_URL, "GetSaleByBillWise"), body: data);
//   return response;
// }

Future<MedicationModel> GetMedications (Map<String, String> data) async {
  var response = await rootBundle.loadString('assets/Data/medications_sample_data.json');
  final data = MedicationModel.fromJson(json.decode(response));
  return data ;
}

class Consts {
  Consts._();

  static const double padding = 5.0;
  static const double avatarRadius = 30.0;
}

