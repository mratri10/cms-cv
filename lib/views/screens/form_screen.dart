import 'package:cms_cv/views/screens/form_sections/education_section.dart';
import 'package:cms_cv/views/screens/form_sections/skill_section.dart';
import 'package:cms_cv/views/screens/form_sections/work_experience_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/cv_controller.dart';
import '../../controllers/theme_controller.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cvController = context.watch<CvController>();
    final themeController = context.watch<ThemeController>();
    final currentTheme = themeController.currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          cvController.loc('label_summary', fallback: 'CV Content Editor'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Theme.of(context).colorScheme.surface,
                icon: const Icon(Icons.palette, color: Colors.white),
                value: currentTheme.id,
                items: themeController.availableThemes.map((theme) {
                  return DropdownMenuItem(
                    value: theme.id,
                    child: Text(
                      theme.name,
                      style: TextStyle(
                        color: currentTheme.id == theme.id
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newThemeId) {
                  if (newThemeId != null) {
                    themeController.switchThemeById(newThemeId);
                  }
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WorkExperienceSection(cvController: cvController),
                const SizedBox(height: 32),
                EducationSection(cvController: cvController),
                const SizedBox(height: 32),
                SkillSection(cvController: cvController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
