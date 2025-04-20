import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/core/utils/app_constants.dart';
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
          width: 100.w,
          height: 140.h,
          child: Stack(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10.r),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Theme.of(context).colorScheme.secondary,
                    image: const DecorationImage(
                      image: AssetImage(AppConstants.avatarPlaceholder),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(AppSize.s18.h),
                        ),
                      ),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      builder: (context) => EditProfileScreen(user: user!),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 14.r,
                    child: Icon(
                      Icons.change_circle_rounded,
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: 30.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
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
              SizedBox(height: 4.w),
              Text(
                user?.email ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Styles.textStyle14.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 8.w),
              const AccountStatusIndicator(),
              SizedBox(height: 8.w),
              ElevatedButton.icon(
                onPressed: () {
                  if (user != null) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(AppSize.s18.h),
                        ),
                      ),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      builder: (context) => EditProfileScreen(user: user!),
                    );
                  }
                },
                icon: Icon(Icons.edit, size: 18.sp),
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
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
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
