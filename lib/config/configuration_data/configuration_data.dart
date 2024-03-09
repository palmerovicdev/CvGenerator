import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ConfigurationData {
  ConfigurationData();

  String _connectionBaseUrl = '';
  String _connectionContentType = '';
  Map<String, dynamic> configData = {};
  Map<String, dynamic> resumeTemplate = {};

  Future<String> get connectionBaseUrl async {
    if (_connectionBaseUrl.isNotEmpty) return _connectionBaseUrl;
    _connectionBaseUrl = (await configDataMap)['connection']['base_url'];
    debugPrint('Connection Base URL: $_connectionBaseUrl');
    return _connectionBaseUrl;
  }

  Future<String> get connectionContentType async {
    if (_connectionContentType.isNotEmpty) return _connectionContentType;
    _connectionContentType = (await configDataMap)['connection']['content_type'];
    debugPrint('Connection Content Type: $_connectionContentType');
    return _connectionContentType;
  }

  Future<Map<String, dynamic>> get resumeTemplateData async {
    if (resumeTemplate.isNotEmpty) return resumeTemplate;
    resumeTemplate = await jsonDecode(await rootBundle.loadString('assets/resume_template.json'));
    debugPrint('Resume Template: $resumeTemplate');
    return resumeTemplate;
  }

  Future<Map<String, dynamic>> get configDataMap async {
    if (configData.isNotEmpty) return configData;
    configData = await jsonDecode(await rootBundle.loadString('assets/config.json'));
    debugPrint('Config Data: $configData');
    return configData;
  }
}