import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_color.dart';
import '../controller/lead_profile_controller.dart';
import '../model/leads_profile_model.dart';

class LeadProfile extends StatefulWidget {
  final String leadId;
  
  const LeadProfile({
    super.key,
    required this.leadId,
  });

  @override
  State<LeadProfile> createState() => _LeadProfileState();
}

class _LeadProfileState extends State<LeadProfile> {
  late LeadProfileController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Provider.of<LeadProfileController>(context, listen: false);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadLeadProfile();
    });
  }

  Future<void> _loadLeadProfile() async {
    await _controller.getLeadProfile(widget.leadId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Lead Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.appBar,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<LeadProfileController>(
        builder: (context, controller, child) {
          print('Consumer rebuilding - isLoading: ${controller.isLoading}');
          print('Error: ${controller.error}');
          print('Lead Profile: ${controller.leadProfile}');
          print('Lead Data: ${controller.leadProfile?.lead}');
          
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.error != null) {
            return _buildErrorWidget(controller.error!, controller);
          }

          if (controller.leadProfile == null) {
            return const Center(
              child: Text('No profile data available'),
            );
          }

          if (controller.leadProfile!.lead == null) {
            return const Center(
              child: Text('No lead data found'),
            );
          }

          return _buildLeadProfileContent(controller.leadProfile!.lead!);
        },
      ),
    );
  }

  Widget _buildErrorWidget(String error, LeadProfileController controller) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              'Error loading lead profile',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loadLeadProfile,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadProfileContent(Lead lead) {
    return RefreshIndicator(
      onRefresh: _loadLeadProfile,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderCard(lead),
            const SizedBox(height: 16),
            
            _buildSectionCard(
              title: 'Contact Information',
              children: [
                _buildInfoRow('Phone', lead.phoneNumber),
                _buildInfoRow('WhatsApp', lead.whatsappNumber?.toString()),
                _buildInfoRow('Email', lead.email),
                _buildInfoRow('City', lead.city),
                _buildInfoRow('Address', lead.address),
              ],
            ),
            const SizedBox(height: 7),

            _buildSectionCard(
              title: 'Lead Details',
              children: [
                _buildInfoRow('Lead Status', lead.leadStatusDetails?.name),
                _buildInfoRow('Lead Source', lead.leadSourceDetails?.label),
                _buildInfoRow('Created At', _formatDate(lead.createdAt)),
                _buildInfoRow('College', lead.college),
                _buildInfoRow('Parent Name', lead.parentName),
                _buildInfoRow('Parent Phone', lead.parentPhoneNumber?.toString()),
              ],
            ),
            const SizedBox(height: 7),

            _buildSectionCard(
              title: 'Follow-up Information',
              children: [
                _buildInfoRow('Total Follow-ups', lead.followupCount?.toString()),
                _buildInfoRow('Pending Follow-ups', lead.pendingFollowups?.toString()),
                _buildInfoRow('Completed Follow-ups', lead.completedFollowups?.toString()),
                _buildInfoRow('Last Follow-up', _formatDate(lead.lastFollowup)),
                _buildInfoRow('Next Follow-up', _formatDate(lead.nextFollowup)),
                _buildInfoRow('Reminder Date', _formatDate(lead.reminderDate)),
              ],
            ),
            const SizedBox(height: 7),

            if (lead.counselorDetails != null)
              _buildSectionCard(
                title: 'Counselor Information',
                children: [
                  _buildInfoRow('Name', lead.counselorDetails?.fullName),
                  _buildInfoRow('Email', lead.counselorDetails?.email),
                  _buildInfoRow('Phone', lead.counselorDetails?.phone),
                  _buildInfoRow('WhatsApp', lead.counselorDetails?.whatsappNumber),
                  _buildInfoRow('Role', lead.counselorDetails?.roleDetails?.label),
                ],
              ),
            const SizedBox(height: 7),

            _buildSectionCard(
              title: 'Additional Information',
              children: [
                _buildInfoRow('How did you hear about Luminar', lead.howDidYouHearAboutLuminar),
                _buildInfoRow('Facebook Campaign', lead.facebookCampaign),
                _buildInfoRow('Pass Out Year', lead.passOutYear?.toString()),
                _buildInfoRow('Website Form', lead.websiteFormDetails?.name),
                _buildInfoRow('Active', lead.isActive == true ? 'Yes' : 'No'),
                _buildInfoRow('Archived', lead.isArchived == true ? 'Yes' : 'No'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(Lead lead) {
    return Container(
       decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.appBar,
              radius: 30,
              child: Text(
                (lead.name?.isNotEmpty ?? false)
                    ? lead.name![0].toUpperCase()
                    : '?',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lead.name ?? 'No Name',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (lead.leadStatusDetails != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(lead.leadStatusDetails?.color),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        lead.leadStatusDetails?.name ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    if (value == null || value.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String? colorString) {
    if (colorString == null) return Colors.grey;
    try {
      String cleanColor = colorString.replaceFirst('#', '');
      if (cleanColor.length == 6) {
        cleanColor = 'FF$cleanColor';
      }
      return Color(int.parse(cleanColor, radix: 16));
    } catch (e) {
      return Colors.grey;
    }
  }

  String _formatDate(dynamic date) {
    if (date == null) return '';
    
    try {
      DateTime dateTime;
      if (date is String) {
        dateTime = DateTime.parse(date);
      } else if (date is DateTime) {
        dateTime = date;
      } else {
        return '';
      }
      
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } catch (e) {
      return '';
    }
  }
}