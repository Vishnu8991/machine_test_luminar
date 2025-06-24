
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../core/dio/dio_authorized.dart';
import '../model/leads_model.dart';

class LeadsController extends ChangeNotifier {
  List<Result> _allLeads = [];
  List<Result> _filteredLeads = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _searchQuery;
  String? _statusFilter;
  String? _sourceFilter;
  Timer? _searchTimer;
  
  final ScrollController scrollController = ScrollController();
  
  List<Result> get leads => _filteredLeads;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String? get searchQuery => _searchQuery;
  String? get statusFilter => _statusFilter;
  String? get sourceFilter => _sourceFilter;

  LeadsController() {
    scrollController.addListener(_scrollListener);
    fetchLeads(reset: true);
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _hasMore) {
      fetchLeads();
    }
  }

  Future<void> fetchLeads({bool reset = false}) async {
    if (reset) {
      _allLeads.clear();
      _filteredLeads.clear();
      _currentPage = 1;
      _hasMore = true;
    }

    if (!_hasMore || _isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final client = await DioUtilAuthorized.createApiClient();
      final response = await client.leadList(
        _searchQuery ?? '',
        _currentPage,
        _statusFilter ?? '',
        _sourceFilter ?? '',
      );

      if (response.results != null && response.results!.isNotEmpty) {
        final newResults = List<Result>.from(response.results!);
        
        if (reset) {
          _allLeads = newResults;
          _filteredLeads = List<Result>.from(newResults);
        } else {
          _allLeads.addAll(newResults);
          if (_searchQuery == null || _searchQuery!.isEmpty) {
            _filteredLeads.addAll(newResults);
          } else {
            _filterLocalLeads();
          }
        }
        
        _currentPage++;
        _hasMore = response.next != null;
      } else {
        _hasMore = false;
      }
    } catch (e) {
      print('Fetch leads error: $e');
      if (reset) {
        _allLeads = [];
        _filteredLeads = [];
      }
      _hasMore = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void applySearch(String search) {
    _searchTimer?.cancel();
    
    final newQuery = search.trim();
    
    if (_searchQuery == newQuery) return;
    
    _searchQuery = newQuery;
    
    _searchTimer = Timer(const Duration(milliseconds: 300), () {
      _performSearch();
    });
  }

  void _performSearch() {
    _filterLocalLeads();
    
    fetchLeads(reset: true);
  }

  void _filterLocalLeads() {
    if (_searchQuery == null || _searchQuery!.isEmpty) {
      _filteredLeads = List<Result>.from(_allLeads);
    } else {
      final query = _searchQuery!.toLowerCase();
      _filteredLeads = _allLeads.where((lead) {
        final name = _safeString(lead.name).toLowerCase();
        final phone = _safeString(lead.phoneNumber).toLowerCase();
        final email = _safeString(lead.email).toLowerCase();
        final city = _safeString(lead.city).toLowerCase();
        
        return name.contains(query) ||
               phone.contains(query) ||
               email.contains(query) ||
               city.contains(query);
      }).toList();
    }
    notifyListeners();
  }

  String _safeString(String? input) {
    if (input == null) return '';
    
    try {
      return String.fromCharCodes(
        input.runes.where((rune) => rune <= 0xFFFF)
      ).trim();
    } catch (e) {
      print('String encoding error: $e');
      return '';
    }
  }

  void applyStatusFilter(String? status) {
    _statusFilter = status;
    _currentPage = 1;
    _hasMore = true;
    fetchLeads(reset: true);
  }

  void applySourceFilter(String? source) {
    _sourceFilter = source;
    _currentPage = 1;
    _hasMore = true;
    fetchLeads(reset: true);
  }

  void clearFilters() {
    _searchQuery = null;
    _statusFilter = null;
    _sourceFilter = null;
    _searchTimer?.cancel();
    _currentPage = 1;
    _hasMore = true;
    fetchLeads(reset: true);
  }

  Future<void> refreshLeads() async {
    _currentPage = 1;
    _hasMore = true;
    await fetchLeads(reset: true);
  }

  @override
  void dispose() {
    scrollController.dispose();
    _searchTimer?.cancel();
    super.dispose();
  }
}