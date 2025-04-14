import 'package:flutter/material.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/features/profile/data/models/user_model.dart';
import 'package:movie_app/src/features/profile/presentation/views/screens/edit_profile_screen.dart';
import 'package:movie_app/src/features/profile/presentation/views/ui/account_status_indicator.dart';
import 'package:movie_app/generated/l10n.dart';

class ProfileContent extends StatelessWidget {
  final UserModel? user;

  const ProfileContent({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          height: 140,
          child: Stack(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                    image: const DecorationImage(
                      image: AssetImage("assets/avatar.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    radius: 16,
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.fullName ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Styles.boldTextStyle18
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                user?.email ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Styles.textStyle14.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              const AccountStatusIndicator(),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  if (user != null) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(AppSize.s18),
                        ),
                      ),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      builder: (context) => EditProfileScreen(user: user!),
                    );
                  }
                },
                icon: const Icon(Icons.edit, size: 18),
                label: Text(
                  S.of(context).editProfile,
                  style:
                      Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 30),
                  disabledBackgroundColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
