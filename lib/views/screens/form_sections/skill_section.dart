import 'package:cms_cv/controllers/cv_controller.dart';
import 'package:cms_cv/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillSection extends StatelessWidget {
  final CvController cvController;
  const SkillSection({super.key, required this.cvController});

  @override
  Widget build(BuildContext context) {
    final themeController = context.read<ThemeController>();
    final categoryController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: themeController.currentTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cvController.loc('label_skills', fallback: 'Skills & Capabilities'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: categoryController,
                  decoration: const InputDecoration(
                    labelText: 'New Category Name',
                    hintText: 'e.g. Mobile Development',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Category'),
                onPressed: () {
                  cvController.addSkillCategory(categoryController.text);
                  categoryController.clear();
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          if (cvController.data.skillCategories.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cvController.data.skillCategories.length,
              separatorBuilder: (_, _) => const SizedBox(height: 24),
              itemBuilder: (context, cIndex) {
                final category = cvController.data.skillCategories[cIndex];
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              category.categoryName,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                cvController.removeSkillCategory(cIndex),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      if (category.skills.isNotEmpty)
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: category.skills.asMap().entries.map((req) {
                            final sIndex = req.key;
                            final skill = req.value;
                            return Chip(
                              label: Text(
                                "${skill.name} - ${skill.description}",
                              ),
                              onDeleted: () =>
                                  cvController.removeSkill(cIndex, sIndex),
                              backgroundColor: themeController
                                  .currentTheme
                                  .primaryColor
                                  .withValues(alpha: 0.1),
                              deleteIconColor:
                                  themeController.currentTheme.primaryColor,
                              labelStyle: TextStyle(
                                color:
                                    themeController.currentTheme.primaryColor,
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
                              decoration: const InputDecoration(
                                labelText: 'Skill Name',
                                hintText: 'Flutter',
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: descController,
                              decoration: const InputDecoration(
                                labelText: 'Short Description',
                                hintText: 'Expert with features...',
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              cvController.addSkill(
                                cIndex,
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
              },
            ),
        ],
      ),
    );
  }
}
