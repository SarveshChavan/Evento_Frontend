import 'package:events/models/navigation_item.dart';
import 'package:events/provider/navigationProvider.dart';
import 'package:events/screens/home_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../provider/userProvider.dart';
import '../screens/authentication/signin_screen.dart';
import '../screens/profile/profile_details.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatefulWidget {
  DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Scaffold(
            body: Consumer<UserProvider>(builder: (context, user, child) {
          return ListView(children: [
            ListTile(
              onTap: () {
                Navigator.pushNamed((context), ProfileDetails.routeName);
              },
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(user.getProfilePhoto()??"https://avatarfiles.alphacoders.com/206/thumb-206822.jpg"),
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Text(
                  user.getUserName(),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              subtitle: Text(
                'Events : ${user.getTotalEvents()}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              contentPadding: const EdgeInsets.only(top: 50, left: 10),
            ),
            const SizedBox(
              height: 50,
            ),
            BuildTile(
                text: 'Home',
                // TODO: Add svg_icon
                icon: Icons.home,
                context: context,
                item: NavigationItem.home,
                route: HomeWrapper.routeName),
            BuildTile(
                // TODO: Add svg_icon
                text: 'Profile',
                icon: Icons.person_rounded,
                context: context,
                item: NavigationItem.profile,
                route: ProfileDetails.routeName),
            // BuildTile(
            //     //TODO: Add svg_icon
            //     text: 'Tutorial',
            //     icon: Icons.book_sharp,
            //     context: context,
            //     item: NavigationItem.tutorial,
            //     route: ProfileDetails.routeName),
            BuildTile(
                // TODO: Add svg_icon
                text: 'Your Events',
                icon: Icons.mic,
                context: context,
                item: NavigationItem.yourEvents,
                route: HomeWrapper.routeName),
            BuildTile(
                // TODO: Add svg_icon
                text: 'Terms',
                icon: Icons.book_outlined,
                context: context,
                item: NavigationItem.terms,
                route: ProfileDetails.routeName),
            BuildTile(
                // TODO: Add svg_icon
                text: 'About Evento',
                icon: Icons.info_outline_rounded,
                context: context,
                item: NavigationItem.aboutEvento,
                route: ProfileDetails.routeName),
            BuildTile(
                // TODO: Add svg_icon
                text: 'Sign out',
                icon: Icons.logout,
                context: context,
                item: NavigationItem.logOut,
                route: SignInScreen.routeName),
          ]);
        })));
  }

  // ignore: non_constant_identifier_names
  Widget BuildTile({
    required String text,
    required IconData icon,
    required NavigationItem item,
    required BuildContext context,
    required String route,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;
    return ListTile(
      selected: isSelected,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      leading: Icon(
        icon,
        color: isSelected ? AppColors.colors.midShade : AppColors.colors.black,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      contentPadding: const EdgeInsets.only(left: 38),
      onTap: () {
        selectItem(context, item, route);
        print(provider.navigationItem);
      },
      selectedTileColor: AppColors.colors.lightestShade,
    );
  }

  void selectItem(BuildContext context, NavigationItem item, String route) {
    Provider.of<NavigationProvider>(context, listen: false)
        .setNavigationItem(item);
    if (item == NavigationItem.logOut) {
      Provider.of<UserProvider>(context, listen: false).logout();
    }
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
