import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/themes/app_styles.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/skip_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SkipButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: theme.colorScheme.onSurface,
              size: 22,
            ),
            hasBorderSide: true,
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kToolbarHeight * 1.5),
              _buildProfileHeader(context),
              const SizedBox(height: 20),
              _buildSectionTitle("الإعدادات"),
              const SizedBox(height: 10),
              _buildSwitchTile(context, "الواي فاي فقط", true),
              const SizedBox(height: 10),
              _buildSwitchTile(context, "الوضع المظلم", false,
                  isDarkMode: true),
              const SizedBox(height: 10),
              _buildOptionTile("الربط بشاشة", context),
              const SizedBox(height: 10),
              _buildOptionTile("الدقة الإفتراضية", context),
              const SizedBox(height: 20),
              _buildSectionTitle("لغة التطبيق"),
              const SizedBox(height: 10),
              _buildSelectableTile("العربية", context),
              const SizedBox(height: 20),
              _buildSectionTitle("الإشعارات"),
              const SizedBox(height: 10),
              _buildSwitchTile(context, "السماح بالإشعارات", true),
              const SizedBox(height: 50),
              _buildLogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.colorScheme.secondary,
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
                  backgroundColor: theme.colorScheme.surface,
                  radius: 16,
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: theme.colorScheme.onSurface,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mohamed Elsayed",
              style:
                  Styles.boldTextStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Text(
              "ed@gmail.com******",
              style: Styles.textStyle14
                  .copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            _buildStatusIndicator(theme),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit, size: 18),
              label: Text(
                "تعديل الحساب",
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize: const Size(140, 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                textStyle: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusIndicator(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, color: theme.colorScheme.primary, size: 14),
          const SizedBox(width: 4),
          Text("نشط",
              style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget _buildSelectableTile(String title, BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      tileColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _buildSwitchTile(BuildContext context, String title, bool value,
      {bool isDarkMode = false}) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (newValue) {},
      tileColor: Theme.of(context).colorScheme.surface,
      activeColor: Theme.of(context).colorScheme.primary,
      secondary: isDarkMode ? const Icon(Icons.dark_mode) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _buildOptionTile(String title, BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      tileColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 12),
      ),
      onPressed: () {},
      child: Text("تسجيل الخروج",
          style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 16,
              fontWeight: FontWeight.bold)),
    );
  }
}
