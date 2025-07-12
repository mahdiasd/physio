import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ui/ui.dart';

import 'bloc/search_bloc.dart';
import 'bloc/search_effect.dart';
import 'bloc/search_event.dart';
import 'bloc/search_state.dart';

class SearchPage extends StatelessWidget {
  final VoidCallback navigateBack;

  const SearchPage({
    super.key,
    required this.navigateBack,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchBloc>();
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: (_) => navigateBack(),
      },
      child: isMobile ? SearchContent() : WebSidebar(child: SearchContent()),
    );
  }
}

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Column(
        children: [_buildHeader(context)],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final theme = Theme.of(context);

    if (isMobile) {
      return _buildSearchBar(context);
    } else {
      return SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadlineMediumText(
              "Search Result",
              color: theme.colorScheme.primary,
            ),
            SizedBox(width: 450, child: _buildSearchBar(context)),
          ],
        ),
      );
    }
  }

  Widget _buildSearchBar(BuildContext context) {
    final bloc = context.read<SearchBloc>();
    final theme = Theme.of(context);
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Row(
          spacing: 8,
          children: [
            AppImage(
              source: "assets/images/ic_filter.svg",
              tintColor: theme.colorScheme.secondary,
              radius: theme.radius.full,
              backgroundPadding: EdgeInsetsGeometry.all(8),
              backgroundColor: theme.colorScheme.secondaryContainer,
              onTap: () {},
            ),
            AppTextField(
                value: state.searchText,
                borderRadius: theme.radius.xxLargeAll,
                hint: "Search videos, pains, or body parts",
                trailingIcon: Icon(Icons.search, color: theme.customColors.disabled),
                onChanged: (text) {
                  bloc.add(SearchTextChanged(text));
                }),
          ],
        );
      },
    );
  }
}
