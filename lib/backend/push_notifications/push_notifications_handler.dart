import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/WhatsApp_Image_2023-08-05_at_11.39.55.jpeg',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'CreateProfilePage': ParameterData.none(),
  'EditProfileInformation': (data) async => ParameterData(
        allParams: {
          'user': getParameter<DocumentReference>(data, 'user'),
        },
      ),
  'Login': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'AptType': ParameterData.none(),
  'ChooseSize': (data) async => ParameterData(
        allParams: {
          'aptType': getParameter<DocumentReference>(data, 'aptType'),
          'edit': getParameter<bool>(data, 'edit'),
        },
      ),
  'Additional': (data) async => ParameterData(
        allParams: {
          'aptType': getParameter<DocumentReference>(data, 'aptType'),
          'aptSize': getParameter<DocumentReference>(data, 'aptSize'),
        },
      ),
  'ResultPage': (data) async => ParameterData(
        allParams: {
          'aptType': getParameter<DocumentReference>(data, 'aptType'),
          'aptSize': getParameter<DocumentReference>(data, 'aptSize'),
        },
      ),
  'RequestPage': (data) async => ParameterData(
        allParams: {
          'request': getParameter<DocumentReference>(data, 'request'),
        },
      ),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'AllChatsPage': ParameterData.none(),
  'ProfilePage': ParameterData.none(),
  'UserInformationPage': (data) async => ParameterData(
        allParams: {
          'user': getParameter<DocumentReference>(data, 'user'),
        },
      ),
  'EditPage': (data) async => ParameterData(
        allParams: {
          'aptType': getParameter<DocumentReference>(data, 'aptType'),
          'aptSize': getParameter<DocumentReference>(data, 'aptSize'),
          'ref': await getDocumentParameter<RequestsRecord>(
              data, 'ref', RequestsRecord.fromSnapshot),
        },
      ),
  'ChooseSizeCopy': (data) async => ParameterData(
        allParams: {
          'aptType': getParameter<DocumentReference>(data, 'aptType'),
          'edit': getParameter<bool>(data, 'edit'),
          'ref': await getDocumentParameter<RequestsRecord>(
              data, 'ref', RequestsRecord.fromSnapshot),
        },
      ),
  'AptTypeCopy': ParameterData.none(),
  'AdditionalCopy': (data) async => ParameterData(
        allParams: {
          'aptType': getParameter<DocumentReference>(data, 'aptType'),
          'aptSize': getParameter<DocumentReference>(data, 'aptSize'),
          'ref': await getDocumentParameter<RequestsRecord>(
              data, 'ref', RequestsRecord.fromSnapshot),
        },
      ),
  'CreateStreet': ParameterData.none(),
  'CreateService': ParameterData.none(),
  'AllOrders': ParameterData.none(),
  'RejectReq': (data) async => ParameterData(
        allParams: {
          'requestRef': getParameter<DocumentReference>(data, 'requestRef'),
        },
      ),
  'AllRejects': ParameterData.none(),
  'RejectedPage': (data) async => ParameterData(
        allParams: {
          'supportRef': getParameter<DocumentReference>(data, 'supportRef'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
