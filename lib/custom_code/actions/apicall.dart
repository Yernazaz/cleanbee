// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

Future apicall() async {
  final String API_KEY = "bbdee5e2-5cff-4dda-b3d7-284709848e9c";
  final String SECRET_KEY =
      "af55dafd54a386ea96da712b13398ca5c9e59bfd02d50e261c2a43521f5628c5";
  final String ENDPOINT = "https://api.onevisionpay.com/payment/direct";
  // In this example, I'm ignoring the PROXY_URL, you'll need additional configuration for it

  int amount = 100;
  String order_id = "hbuhbukjh223423";
  String description = "sded";
  String pan = "4111111111111111";
  String holder = "qwe qwe";
  String cvc = "111";
  String month = "01";
  String year = "2023";
  String phone = "string";
  String pan_to = "4111111111111111";
  String holder_to = "wqewqe wqeqwe";
  String phone_to = "string";

  Map<String, dynamic> payload = {
    "amount": amount,
    "currency": "KZT",
    "order_id": order_id,
    "description": description,
    "payment_type": "pay",
    "payment_method": "ecom",
    "items": [
      {
        "merchant_id": "baaa5294-9af3-4604-b51b-fb80307edc40",
        "service_id": "eaa43c43-99fe-440d-b589-dbe20f3c622b",
        "merchant_name": "Qleen bee",
        "name": "Уборка квартиры",
        "quantity": 1,
        "amount_one_pcs": amount,
        "amount_sum": amount
      }
    ],
    "merchant_term_url": "http://example.com",
    "payment_lifetime": 3600,
    "create_recurrent_profile": false,
    "payment_data": {
      "pan": pan,
      "holder": holder,
      "cvc": cvc,
      "month": month,
      "year": year,
      "phone": phone,
      "wallet_identifier": {"id": "string", "phone": "string"},
      "save_data": false
    },
    "payout_data": {
      "pan_to": pan_to,
      "holder": holder_to,
      "save_data": false,
      "phone_to": phone_to,
      "card_token": "string",
      "wallet_identifier": {"id": "string", "phone": "string"}
    },
    "extra_params": {},
    "test_mode": 1
  };

  String dataJson = jsonEncode(payload);
  String dataEncoded = base64Encode(utf8.encode(dataJson));

  // Generate the signature
  var key = utf8.encode(SECRET_KEY);
  var bytes = utf8.encode(dataEncoded);
  var hmacSha512 = Hmac(sha512, key);
  var digest = hmacSha512.convert(bytes);

  // Prepare the headers
  Map<String, String> headers = {
    "Authorization": "Bearer ${base64Encode(utf8.encode(API_KEY))}",
    "Content-Type": "application/json"
  };

  // Prepare the request data
  Map<String, String> requestData = {
    "data": dataEncoded,
    "sign": digest.toString()
  };

  // Make the API request
  var response = await http.post(Uri.parse(ENDPOINT),
      body: jsonEncode(requestData), headers: headers);

  print(jsonDecode(response.body));
  print(dataEncoded);
  print(digest);
  print("Bearer ${base64Encode(utf8.encode(API_KEY))}");
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
