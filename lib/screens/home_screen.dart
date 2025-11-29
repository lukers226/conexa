import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../constants/app_fonts.dart';
import '../constants/colors.dart';
import '../service/community_service.dart';
import '../widgets/app_nav_bar.dart';
import '../widgets/category_chips.dart';
import '../models/community_model.dart';
import '../widgets/community_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool isLoading = true;

  List<CommunityModel> communityList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      communityList = await CommunityService().getAllCommunities();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching communities: $e");
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = isDark ? AppColors.dark : AppColors.light;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: colors.background,

      appBar: AppBar(
        backgroundColor: colors.primary,
        elevation: 0,
        title: Text(
          "FitMom Community",
          style: AppFonts.h2(colors.textPrimary),
        ),
        centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 110),
          CategoryChips(onSelected: (String p1) {}),
          const SizedBox(height: 10),

          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: communityList.length,
              itemBuilder: (context, index) {
                return CommunityListItem(
                  name: communityList[index].communityName,
                  description: communityList[index].description,
                  onTap: () {
                    Get.toNamed('/chat', arguments: {
                      'name': communityList[index].communityName,
                      'description': communityList[index].description,
                    });
                  },
                );
              },
            ),
          ),

        ],
      ),

      bottomNavigationBar: AppNavBar(
        selectedIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
