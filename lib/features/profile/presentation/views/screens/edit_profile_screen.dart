import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/themes/app_styles.dart';
import 'package:movie_app/core/ui/custom_elevated_button.dart';
import 'package:movie_app/core/ui/custom_text_field.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';
import 'package:movie_app/features/profile/presentation/controller/cubit/user_cubit_cubit.dart';
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
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.fullName);
    _phoneController = TextEditingController(text: widget.user.phone);
    _emailController = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'تعديل الملف الشخصي',
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
          const SizedBox(height: 16),
          // Form
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: _nameController,
                  labelText: S.of(context).fullName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).fullNameRequiredError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: S.of(context).email,
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).emailRequiredError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  labelText: S.of(context).phoneNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).phoneNumberRequiredError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: CustomElevatedButton(
                    onPressed: _saveChanges,
                    text: 'حفظ التغييرات',
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
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

      context.read<UserCubit>().updateUser(updatedUser).then((_) {
        Navigator.pop(context);
      });
    }
  }
}
