import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/core/ui/custom_elevated_button.dart';
import 'package:movie_app/src/core/ui/custom_text_field.dart';
import 'package:movie_app/src/core/ui/my_single_child_scroll_view.dart';
import 'package:movie_app/src/core/utils/form_validator.dart';
import 'package:movie_app/src/features/profile/data/models/user_model.dart';
import 'package:movie_app/src/features/profile/presentation/controller/cubit/user_cubit_cubit.dart';
import 'package:movie_app/generated/l10n.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;

  const EditProfileScreen({
    super.key,
    required this.user,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.fullName);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MySingleChildScrollView(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: AppPadding.p16,
          right: AppPadding.p16,
          top: AppPadding.p16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).editProfile,
                style: Styles.boldTextStyle18.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Form
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: _nameController,
                  labelText: S.of(context).fullName,
                  validator: FormValidator.validateFullName,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: S.of(context).email,
                  readOnly: true,
                  validator: FormValidator.validateEmail,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  labelText: S.of(context).phoneNumber,
                  validator: FormValidator.validatePhone,
                ),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                  onPressed: _saveChanges,
                  text: S.of(context).confirmChanges,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final updatedUser = UserModel(
        token: widget.user.token,
        fullName: _nameController.text,
        email: widget.user.email,
        phone: _phoneController.text,
      );

      if (updatedUser == widget.user) {
        Navigator.pop(context);
      } else {
        context.read<UserCubit>().updateUser(updatedUser).then((_) {
          Navigator.pop(context);
        });
      }
    }
  }
}
