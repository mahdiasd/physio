import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

class SearchPage extends StatefulWidget {
  final VoidCallback navigateBack;

  const SearchPage({
    super.key,
    required this.navigateBack,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          _buildHeader(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Search Result',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),

          // Search Bar
          _buildSearchBar(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, bool isMobile) {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            value: _searchQuery,
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            hint: 'Search videos, programs or body parts...',
            leadingIcon: AppImage(
              source: 'assets/images/ic_search.svg',
              width: 20,
              height: 20,
              tintColor: Theme.of(context).customColors.placeholder,
              backgroundColor: Colors.transparent,
            ),
            showClearIcon: _searchQuery.isNotEmpty,
            borderRadius: BorderRadius.circular(12),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
            borderColor: Theme.of(context).colorScheme.outline.withOpacity(0.3),
            focusedBorderColor: Theme.of(context).colorScheme.primary,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Filter Button
        AppImage(
          source: 'assets/images/ic_filter.svg',
          width: 48,
          height: 48,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
          backgroundPadding: const EdgeInsets.all(12),
          tintColor: Theme.of(context).colorScheme.onSurfaceVariant,
          onTap: () {
          },
        ),
      ],
    );
  }


}

