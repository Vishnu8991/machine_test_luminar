
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/storage/auth_store_manager.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/route_constants.dart';
import '../../../utils/app_color.dart';
import '../../lead_profile.dart/view/lead_profile.dart';
import '../controller/leads_controller.dart';
import '../model/leads_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late LeadsController provider;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    provider = Provider.of<LeadsController>(context, listen: false);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                 MyAppRoute.router.pushNamed(MyAppConstants.userProfile);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.2),
                radius: 20,
                child: const Icon(
                  Icons.person_2_outlined,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                _showLogoutDialog(context);
              },
              child: const Icon(
                Icons.logout,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: AppColors.appBar,
        title: const Text(
          "LEADS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      provider.applySearch(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.filledTextFieldColor,
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                provider.applySearch('');
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search by name, phone, email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   flex: 1,
                //   child: Padding(
                //     padding: const EdgeInsets.only(right: 8),
                //     child: IconButton(
                //       onPressed: () => _showFilterDialog(context),
                //       icon: const Icon(Icons.filter_list, color: Colors.black),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),

          Consumer<LeadsController>(
            builder: (_, controller, __) {
              final hasFilters = controller.statusFilter != null ||
                  controller.sourceFilter != null ||
                  (controller.searchQuery?.isNotEmpty ?? false);

              if (!hasFilters) return const SizedBox.shrink();

              return Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          if (controller.searchQuery?.isNotEmpty ?? false)
                            _buildFilterChip(
                              'Search: ${controller.searchQuery}',
                              () => {
                                _searchController.clear(),
                                controller.applySearch('')
                              },
                            ),
                          if (controller.statusFilter != null)
                            _buildFilterChip(
                              'Status: ${controller.statusFilter}',
                              () => controller.applyStatusFilter(null),
                            ),
                          if (controller.sourceFilter != null)
                            _buildFilterChip(
                              'Source: ${controller.sourceFilter}',
                              () => controller.applySourceFilter(null),
                            ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _searchController.clear();
                        controller.clearFilters();
                      },
                      child: const Text('Clear All'),
                    ),
                  ],
                ),
              );
            },
          ),

          // Leads List
          Expanded(
            child: Consumer<LeadsController>(
              builder: (_, controller, __) {
                return RefreshIndicator(
                  onRefresh: () => controller.refreshLeads(),
                  child: _buildLeadsList(controller),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadsList(LeadsController controller) {
    if (controller.isLoading && controller.leads.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (controller.leads.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "No leads found",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              "Try adjusting your search or filters",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: controller.scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: controller.leads.length + (controller.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == controller.leads.length) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final Result lead = controller.leads[index];
        return _buildLeadCard(lead);
      },
    );
  }

  Widget _buildLeadCard(Result lead) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            backgroundColor: AppColors.appBackground,
            child: Text(
              (lead.name?.isNotEmpty ?? false)
                  ? lead.name![0].toUpperCase()
                  : '?',
              style: TextStyle(
                color: AppColors.appGrapesColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            lead.name ?? "No Name",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (lead.phoneNumber?.isNotEmpty ?? false)
                Text(
                  lead.phoneNumber!,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              if (lead.email?.isNotEmpty ?? false)
                Text(
                  lead.email!,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              if (lead.city?.isNotEmpty ?? false)
                Text(
                  lead.city!,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
            ],
          ),
          onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LeadProfile(leadId: lead.id ?? ''),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, VoidCallback onDelete) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        color: WidgetStatePropertyAll(AppColors.appBackground),
        label: Text(label, style: const TextStyle(fontSize: 12)),
        deleteIcon: const Icon(Icons.close, size: 16),
        onDeleted: onDelete,
        backgroundColor: AppColors.appGrapesColor.withOpacity(0.1),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          "Logout",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Are you sure you want to logout?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              LocalStorageManager().clear();
              MyAppRoute.router.goNamed(MyAppConstants.appSplashScreen);              
            },
            child: Text("Logout"),
          ),
        ],
      );
    },
  );
}

  // void _showFilterDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Filter Leads'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             // Status Filter
  //             ListTile(
  //               title: const Text('Filter by Status'),
  //               trailing: const Icon(Icons.arrow_forward_ios),
  //               onTap: () {
  //                 Navigator.pop(context);
  //                 _showStatusFilterDialog(context);
  //               },
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text('Close'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _showStatusFilterDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Select Lead Status'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ListTile(
  //               title: const Text('All Statuses'),
  //               onTap: () {
  //                 provider.applyStatusFilter(null);
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             ListTile(
  //               title: const Text('New Lead'),
  //               onTap: () {
  //                 provider.applyStatusFilter('new_lead');
  //                 Navigator.pop(context);
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}