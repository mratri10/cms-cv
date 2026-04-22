import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                _buildWorkExperienceSection(context, cvController),
                const SizedBox(height: 32),
                _buildEducationSection(context, cvController),
                const SizedBox(height: 32),
                _buildSkillCategorySection(context, cvController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWorkExperienceSection(
    BuildContext context,
    CvController cvController,
  ) {
    final themeController = context.read<ThemeController>();
    final companyController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: themeController.currentTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cvController.loc('label_experience', fallback: 'Work Experience'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: companyController,
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                    hintText: 'e.g. Bank Rakyat Indonesia',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Company'),
                onPressed: () {
                  cvController.addWorkExperience(companyController.text);
                  companyController.clear();
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          if (cvController.data.workExperience.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cvController.data.workExperience.length,
              separatorBuilder: (_, _) => const SizedBox(height: 24),
              itemBuilder: (context, wIndex) {
                final work = cvController.data.workExperience[wIndex];

                // Inner controllers for new Role creation
                final roleController = TextEditingController();
                final supervisorController = TextEditingController();
                final salaryController = TextEditingController();
                final startDateController = TextEditingController();

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
                              work.companyName,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                cvController.removeWorkExperience(wIndex),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      if (work.roles.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Column(
                            children: work.roles.asMap().entries.map((req) {
                              final rIndex = req.key;
                              final role = req.value;
                              return ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  role.roleName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  "Supervisor: ${role.supervisor} \u2022 Salary: ${role.salary} \u2022 Start: ${role.startDate}",
                                ),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.orange,
                                  ),
                                  onPressed: () =>
                                      cvController.removeRole(wIndex, rIndex),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                      const Divider(),
                      const SizedBox(height: 8),
                      // Create Role Fields
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: roleController,
                              decoration: const InputDecoration(
                                labelText: 'New Role Name',
                                hintText: 'Software Engineer',
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              controller: supervisorController,
                              decoration: const InputDecoration(
                                labelText: 'Supervisor',
                                hintText: 'John Doe',
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: salaryController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                labelText: 'Salary (Int Only)',
                                hintText: 'e.g. 150000',
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              controller: startDateController,
                              readOnly: true,
                              onTap: () async {
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1960),
                                  lastDate: DateTime(2050),
                                );
                                if (picked != null) {
                                  startDateController.text =
                                      "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'Start Date',
                                hintText: 'Select Date',
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (roleController.text.isNotEmpty) {
                              cvController.addRole(
                                wIndex,
                                roleController.text,
                                supervisorController.text,
                              );
                              int newIdx =
                                  cvController
                                      .data
                                      .workExperience[wIndex]
                                      .roles
                                      .length -
                                  1;
                              if (salaryController.text.isNotEmpty) {
                                cvController.updateRoleSalary(
                                  wIndex,
                                  newIdx,
                                  int.tryParse(salaryController.text) ?? 0,
                                );
                              }
                              if (startDateController.text.isNotEmpty) {
                                cvController.updateRoleDate(
                                  wIndex,
                                  newIdx,
                                  true,
                                  startDateController.text,
                                );
                              }
                              // Clear inputs safely inside builder frame if state was preserved,
                              // but provider rebuild drops the instances anyway.
                            }
                          },
                          child: const Text('Add Role to Company'),
                        ),
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

  Widget _buildEducationSection(
    BuildContext context,
    CvController cvController,
  ) {
    final themeController = context.read<ThemeController>();
    final schoolController = TextEditingController();
    final majorController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: themeController.currentTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cvController.loc('label_education', fallback: 'Education History'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: schoolController,
                  decoration: const InputDecoration(
                    labelText: 'School Name',
                    hintText: 'University of ...',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: majorController,
                  decoration: const InputDecoration(
                    labelText: 'Major',
                    hintText: 'Computer Science',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Education'),
                onPressed: () {
                  cvController.addEducation(
                    schoolController.text,
                    majorController.text,
                  );
                  schoolController.clear();
                  majorController.clear();
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          if (cvController.data.educationHistory.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cvController.data.educationHistory.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, eIndex) {
                final edu = cvController.data.educationHistory[eIndex];
                final eduStartDateController = TextEditingController(
                  text: edu.startDate,
                );
                final eduEndDateController = TextEditingController(
                  text: edu.endDate,
                );

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              edu.schoolName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Major: ${edu.major}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Date pickers for Education
                      Expanded(
                        child: TextFormField(
                          controller: eduStartDateController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Start Date',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1960),
                              lastDate: DateTime(2050),
                            );
                            if (picked != null) {
                              cvController.updateEducationDate(
                                eIndex,
                                true,
                                "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}",
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          controller: eduEndDateController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'End Date',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1960),
                              lastDate: DateTime(2050),
                            );
                            if (picked != null) {
                              cvController.updateEducationDate(
                                eIndex,
                                false,
                                "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}",
                              );
                            }
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => cvController.removeEducation(eIndex),
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

  Widget _buildSkillCategorySection(
    BuildContext context,
    CvController cvController,
  ) {
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
