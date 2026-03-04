import 'package:dhmd/app/components/custom_appbar.dart';
import 'package:dhmd/app/routes/app_pages.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInformationView extends StatelessWidget {
  const AccountInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Account Information',
        showBackButton: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit_rounded, color: AppColors.primary, size: 24),
            onPressed: () => Get.toNamed(Routes.EDIT_ACCOUNT),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _SectionTitle(title: 'Personal'),
            const SizedBox(height: 16),
            _FieldGrid(rows: [
              [_Field(label: 'ID No', value: '123456'), _Field(label: 'Username', value: 'Ashu')],
              [_Field(label: 'First Name', value: 'Ashenafi'), _Field(label: 'Last Name', value: 'Mamo')],
              [_Field(label: 'Date of Birth', value: 'Feb 12, 1980'), _Field(label: 'Gender', value: 'Male')],
            ]),
            const SizedBox(height: 28),
            _SectionTitle(title: 'Contact'),
            const SizedBox(height: 16),
            _FieldGrid(rows: [
              [_Field(label: 'Phone Number', value: '081892319321'), _Field(label: 'Email', value: 'zhafira@gmail.com')],
              [_Field(label: 'City', value: 'Bandung'), _Field(label: 'Province', value: 'West Java')],
            ]),
            const SizedBox(height: 16),
            _Field(label: 'Address', value: 'Jl. Sekar Wangi 20 A, Bancangan'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.primary,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _FieldGrid extends StatelessWidget {
  const _FieldGrid({required this.rows});

  final List<List<_Field>> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final row in rows)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _FieldTile(field: row[0])),
                const SizedBox(width: 24),
                Expanded(child: _FieldTile(field: row[1])),
              ],
            ),
          ),
      ],
    );
  }
}

class _FieldTile extends StatelessWidget {
  const _FieldTile({required this.field});

  final _Field field;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field.label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          field.value,
          style: const TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
