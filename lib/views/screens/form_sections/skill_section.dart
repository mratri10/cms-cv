import 'package:cms_cv/controllers/cv_controller.dart';
import 'package:cms_cv/controllers/theme_controller.dart';
import 'package:cms_cv/models/cv_model.dart';
import 'package:cms_cv/util/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillSection extends StatelessWidget {
  final CvController cvController;
  const SkillSection({super.key, required this.cvController});

  @override
  Widget build(BuildContext context) {
    final themeController = context.read<ThemeController>();

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: themeController.currentTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSkillCategory(
            context: context,
            title: 'Language Skills',
            skills: cvController.data.languageSkills,
            skillEnum: SkillEnum.language,
            themeController: themeController,
            hintName: 'English',
            hintDesc: 'Fluent',
          ),
          const SizedBox(height: 24),
          _buildSkillCategory(
            context: context,
            title: 'Hard Skills',
            skills: cvController.data.hardSkills,
            skillEnum: SkillEnum.hard,
            themeController: themeController,
            hintName: 'Flutter',
            hintDesc: 'Advanced',
          ),
          const SizedBox(height: 24),
          _buildSkillCategory(
            context: context,
            title: 'Soft Skills',
            skills: cvController.data.softSkills,
            skillEnum: SkillEnum.soft,
            themeController: themeController,
            hintName: 'Communication',
            hintDesc: 'Excellent',
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory({
    required BuildContext context,
    required String title,
    required List<Skill> skills,
    required SkillEnum skillEnum,
    required ThemeController themeController,
    required String hintName,
    required String hintDesc,
  }) {
    final skillController = TextEditingController();
    final descController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          if (skills.isNotEmpty)
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: skills.asMap().entries.map((req) {
                final sIndex = req.key;
                final skill = req.value;
                return Chip(
                  label: Text("${skill.name} - ${skill.description}"),
                  onDeleted: () => cvController.removeSkill(skillEnum, sIndex),
                  backgroundColor: themeController.currentTheme.primaryColor
                      .withValues(alpha: 0.1),
                  deleteIconColor: themeController.currentTheme.primaryColor,
                  labelStyle: TextStyle(
                    color: themeController.currentTheme.primaryColor,
                  ),
                  side: BorderSide.none,
                );
              }).toList(),
            ),
          const Divider(height: 32),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: skillController,
                  decoration: InputDecoration(
                    labelText: 'Skill Name',
                    hintText: hintName,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: descController,
                  decoration: InputDecoration(
                    labelText: 'Short Description',
                    hintText: hintDesc,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  cvController.addSkill(
                    skillEnum,
                    skillController.text,
                    descController.text,
                  );
                },
                child: const Text('Add Skill'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
