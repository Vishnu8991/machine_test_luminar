import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../core/dio/dio_authorized.dart';
import '../model/leads_profile_model.dart';

class LeadProfileController extends ChangeNotifier {
  LeadsProfileModel? _leadProfile;
  bool _isLoading = false;
  String? _error;

  LeadsProfileModel? get leadProfile => _leadProfile;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getLeadProfile(String id) async {
    print('Starting to load lead profile for ID: $id');
    
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final client = await DioUtilAuthorized.createApiClient();
      print('API client created successfully');
      
      final result = await client.leadProfileList(id);
      print('API response received: $result');
      
      _leadProfile = result;
      _error = null;
      
      print('Lead profile set: ${_leadProfile?.lead?.name}');
    } catch (e) {
      print('Error in getLeadProfile: $e');
      _error = 'An unexpected error occurred: ${e.toString()}';
      _leadProfile = null;
    } finally {
      _isLoading = false;
      print('Loading completed - isLoading: $_isLoading');
      notifyListeners();
    }
  }

  // Method to clear the current lead profile
  void clearProfile() {
    _leadProfile = null;
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}