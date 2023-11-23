// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';

ValidatorResponse(Response response) {
  if (response.statusCode == 200) {
    log('$response');
  } else {
    throw Exception();
  }
}
