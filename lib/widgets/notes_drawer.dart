import 'package:demo_note_app/generated/l10n.dart';
import 'package:demo_note_app/services/route_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RelutionDrawer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return Drawer(
        child: ListView(
      children: [
        SizedBox(
          height: 60,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              FlutterLogo(),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        DividerLabel(),
        DrawerNavigationItem(
          title: S.current.main_page_title,
          icon: Icons.house,
          routeName: RouteService.mainPage,
        ),
        DrawerNavigationItem(
          title: S.current.favorites_page,
          icon: Icons.favorite,
          routeName: RouteService.favoritesPage,
        ),
      ],
    ));
  }
}

class DrawerNavigationItem extends StatelessWidget {
  final String title;
  final String routeName;
  final IconData icon;

  //called on tap
  final AsyncCallback? additionalHandling;

  const DrawerNavigationItem({
    Key? key,
    required this.title,
    required this.routeName,
    required this.icon,
    this.additionalHandling,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = ModalRoute.of(context)!.settings.name == routeName;
    return ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 15),
        ),
        tileColor: isSelected
            ? Theme.of(context).colorScheme.onSurface.withOpacity(0.1)
            : Theme.of(context).colorScheme.surface,
        onTap: () async {
          if (additionalHandling != null) {
            await additionalHandling!();
          } else if (ModalRoute.of(context)?.settings.name != routeName) {
            Navigator.pushNamedAndRemoveUntil(
                context, routeName, (route) => false);
          }
        });
  }
}

class DividerLabel extends StatelessWidget {
  final String? labelText;
  final bool hasDivider;

  const DividerLabel({
    Key? key,
    this.labelText,
    this.hasDivider = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasDivider
            ? Divider(
                height: 10,
                thickness: 0,
              )
            : SizedBox(
                height: 10,
              ),
        labelText != null
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  labelText!,
                  style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5)),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}

class OrganisationUsername extends StatelessWidget {
  final String? userName;
  final String? organizationName;

  const OrganisationUsername({
    Key? key,
    this.userName,
    this.organizationName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
        text: TextSpan(
          text: '',
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontWeight: FontWeight.bold),
          children: <TextSpan>[
            if (userName != null)
              TextSpan(text: " $userName, ", style: TextStyle()),
            if (organizationName != null) TextSpan(text: organizationName!),
          ],
        ),
      ),
      SizedBox(height: 10)
    ]);
  }
}
