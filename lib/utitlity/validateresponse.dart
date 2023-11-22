import 'dart:developer';

import 'package:dio/dio.dart';

ValidatorResponse(Response response) {
  if (response.statusCode == 200) {
    log('$response');
  } else {
    throw Exception();
  }
}
