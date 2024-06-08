import "package:flutter/material.dart";

final class MasterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MasterAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
