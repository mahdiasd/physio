import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';
import 'bloc/search_bloc.dart';
import 'bloc/search_effect.dart';
import 'bloc/search_event.dart';
import 'bloc/search_state.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SearchPage extends StatelessWidget {
  final VoidCallback navigateBack;

  // TODO: Add more navigation callbacks as needed

  const SearchPage({
    super.key,
    required this.navigateBack,
    // TODO: Add more required callbacks
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchBloc>();
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return BlocListenerWidget(
      effectsStream: bloc.effectsStream,
      messageStream: bloc.messageStream,
      effectHandlers: {
        NavigateBack: navigateBack,
      },
      child: isMobile ? WebSidebar(child: SearchContent()) : SearchContent(),
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
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineMediumText(
            "Library",
            color: theme.colorScheme.primary,
          ),
          const Spacer(),
          SizedBox(
            width: 400,
            child: _buildSearchBar(context),
          ),
        ],
      );
    }
  }

  Widget _buildSearchBar(BuildContext context) {
    final bloc = context.read<SearchBloc>();

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return AppTextField(
            value: state.searchText,
            hint: "Search videos, pains, or body parts",
            leadingIcon: const Icon(Icons.search),
            onChanged: (text) {
              context.read<SearchBloc>().add(SearchTextChanged(text));
            });
      },
    );
  }
}
