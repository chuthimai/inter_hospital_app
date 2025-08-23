import 'dart:convert';

import 'package:inter_hospital_app/features/view_health_insurance/data/models/health_insurance_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HealthInsuranceLocalDataSource {
  Future<HealthInsuranceModel?> getLocalHealthInsurance();
  Future<void> saveLocalHealthInsurance(HealthInsuranceModel healthInsurance);
  Future<void> deleteLocalHealthInsurance();
}

class HealthInsuranceLocalDataSourceImpl implements HealthInsuranceLocalDataSource {
  static const String _healthInsuranceKey = 'healthInsurance';

  @override
  Future<HealthInsuranceModel?> getLocalHealthInsurance() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_healthInsuranceKey);
    if (jsonString == null) return null;

    final Map<String, dynamic> json = jsonDecode(jsonString);
    return HealthInsuranceModel.fromJson(json);
  }

  @override
  Future<void> deleteLocalHealthInsurance() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_healthInsuranceKey);
  }

  @override
  Future<void> saveLocalHealthInsurance(HealthInsuranceModel healthInsurance) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(healthInsurance.toJson());
    await prefs.setString(_healthInsuranceKey, jsonString);
  }

}