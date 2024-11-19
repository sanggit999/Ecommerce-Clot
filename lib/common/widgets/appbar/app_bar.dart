import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppbar({
    super.key,
    this.title,
    this.actions,
    this.hideBack = false,
  });

  final Widget? title;
  final Widget? actions;
  final bool hideBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? const Text(' '),
      automaticallyImplyLeading: false,
      actions: [actions ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: AppSizes.iconSizeSm,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
