import 'package:flutter/material.dart';

@immutable
sealed class NavigationItem {
  final String label;
  final String icon;
  final int index;

  const NavigationItem(
      {required this.index, required this.label, required this.icon});
}

class HomeNavigationItem extends NavigationItem {
  const HomeNavigationItem()
      : super(
    index: 0,
    label: 'Home',
    icon: "assets/images/ic_home.svg",
  );
}

class AppointmentsNavigationItem extends NavigationItem {
  const AppointmentsNavigationItem()
      : super(
    index: 1,
    label: 'Appointments',
    icon: "assets/images/ic_appointment.svg",
  );
}

class ProgramsNavigationItem extends NavigationItem {
  const ProgramsNavigationItem()
      : super(
    index: 2,
    label: 'Programs',
    icon: "assets/images/ic_program.svg",
  );
}

class LibraryNavigationItem extends NavigationItem {
  const LibraryNavigationItem()
      : super(
    index: 3,
    label: 'Library',
    icon: "assets/images/ic_library.svg",
  );
}

class AccountNavigationItem extends NavigationItem {
  const AccountNavigationItem()
      : super(
    index: 4,
    label: 'Account',
    icon: "assets/images/ic_account.svg",
  );
}
