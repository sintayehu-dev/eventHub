import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = 'Music';

  @override
  void initState() {
    super.initState();
    _searchController.text = 'Music Festivals';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Search Bar
            _buildSearchBar(),
            
            // Category Chips
            _buildCategoryChips(),
            
            // Results Header
            _buildResultsHeader(),
            
            // Events List
            Expanded(
              child: _buildEventsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFF2A1B3D),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.arrow_back,
                color: const Color(0xFF8B5CF6),
                size: 20.sp,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Search Events',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFF2A1B3D),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.tune,
              color: const Color(0xFF8B5CF6),
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: const Color(0xFF8B5CF6),
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: TextField(
                controller: _searchController,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search events...',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.close,
              color: Colors.grey[400],
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ['Music', 'Tech', 'Arts', 'Food'];
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: categories.map((category) {
          final isSelected = category == selectedCategory;
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? const Color(0xFF8B5CF6)
                      : const Color(0xFF2A1B3D),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getCategoryIcon(category),
                      color: isSelected ? Colors.white : const Color(0xFF8B5CF6),
                      size: 14.sp,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF8B5CF6),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildResultsHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        children: [
          Text(
            '24 Results Found',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              _buildFilterIcon(Icons.calendar_today),
              SizedBox(width: 12.w),
              _buildFilterIcon(Icons.location_on),
              SizedBox(width: 12.w),
              _buildFilterIcon(Icons.tune),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        color: const Color(0xFF8B5CF6),
        size: 16.sp,
      ),
    );
  }

  Widget _buildEventsList() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: 3,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return _buildEventCard(index);
      },
    );
  }

  Widget _buildEventCard(int index) {
    final events = [
      {
        'id': 'neon-pulse-festival',
        'title': 'Neon Pulse Electronic Festival',
        'description': 'Experience the biggest EDM lineup of the summer with immersive light shows and world-class DJs.',
        'date': 'AUG 24',
        'location': 'LONDON, UK',
        'price': '\$49-\$120',
        'attendees': '+1.2k attending',
        'isBookmarked': false,
      },
      {
        'id': 'rhythm-bloom-concert',
        'title': 'Rhythm & Bloom Outdoor Concert',
        'description': 'A magical outdoor concert featuring indie and alternative artists in a beautiful garden setting.',
        'date': 'SEP 15',
        'location': 'MANCHESTER, UK',
        'price': 'Free Entry',
        'attendees': '+850 attending',
        'isBookmarked': true,
      },
      {
        'id': 'urban-beats-festival',
        'title': 'Urban Beats Street Festival',
        'description': 'Street music festival celebrating hip-hop, R&B, and urban culture with local and international artists.',
        'date': 'OCT 02',
        'location': 'BIRMINGHAM, UK',
        'price': '\$25-\$75',
        'attendees': '+2.1k attending',
        'isBookmarked': false,
      },
    ];

    final event = events[index];
    
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteName.eventDetail,
          pathParameters: {'eventId': event['id'] as String},
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2A1B3D),
              Color(0xFF1A0B2E),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image with Concert Scene
            Container(
              height: 280.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: Stack(
                children: [
                  // Concert background
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF0F172A),
                          Color(0xFF1E293B),
                          Color(0xFF334155),
                        ],
                      ),
                    ),
                  ),
                  
                  // Stage lights effect
                  Positioned(
                    top: 40.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 120.h,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.center,
                          radius: 0.8,
                          colors: [
                            Colors.white.withValues(alpha: 0.9),
                            Colors.cyan.withValues(alpha: 0.6),
                            Colors.blue.withValues(alpha: 0.3),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // Price tag
                  Positioned(
                    top: 20.h,
                    right: 20.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B5CF6),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Text(
                        event['price'] as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Event Details
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date, Location and Bookmark
                  Row(
                    children: [
                      Text(
                        '${event['date']} • ${event['location']}',
                        style: TextStyle(
                          color: const Color(0xFF8B5CF6),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        (event['isBookmarked'] as bool) 
                            ? Icons.bookmark 
                            : Icons.bookmark_border,
                        color: const Color(0xFF8B5CF6),
                        size: 24.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  
                  // Event Title
                  Text(
                    event['title'] as String,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  
                  // Event Description
                  Text(
                    event['description'] as String,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15.sp,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16.h),
                  
                  // Attendees with profile pictures
                  Row(
                    children: [
                      // Profile pictures stack
                      SizedBox(
                        width: 80.w,
                        height: 32.h,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              child: _buildAttendeeAvatar(const Color(0xFF64748B)),
                            ),
                            Positioned(
                              left: 20.w,
                              child: _buildAttendeeAvatar(const Color(0xFF475569)),
                            ),
                            Positioned(
                              left: 40.w,
                              child: _buildAttendeeAvatar(const Color(0xFF334155)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        event['attendees'] as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendeeAvatar(Color color) {
    return Container(
      width: 32.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF1A0B2E),
          width: 3,
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Music':
        return Icons.music_note;
      case 'Tech':
        return Icons.computer;
      case 'Arts':
        return Icons.palette;
      case 'Food':
        return Icons.restaurant;
      default:
        return Icons.category;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}