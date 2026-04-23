import 'package:cms_cv/controllers/cv_controller.dart';
import 'package:cms_cv/controllers/theme_controller.dart';
import 'package:cms_cv/models/cv_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cms_cv/util/const.dart';

class WorkExperienceSection extends StatelessWidget {
  final CvController cvController;
  const WorkExperienceSection({super.key, required this.cvController});

  @override
  Widget build(BuildContext context) {
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

          if (cvController.data.workExperience.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cvController.data.workExperience.length,
              separatorBuilder: (_, _) => const SizedBox(height: 24),
              itemBuilder: (context, wIndex) {
                final work = cvController.data.workExperience[wIndex];
                return _WorkExperienceItem(
                  work: work,
                  wIndex: wIndex,
                  cvController: cvController,
                );
              },
            ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: companyController,
                  // enabled: skills.isNotEmpty,
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
        ],
      ),
    );
  }
}

class _WorkExperienceItem extends StatefulWidget {
  final WorkExperience work;
  final int wIndex;
  final CvController cvController;

  const _WorkExperienceItem({
    Key? key,
    required this.work,
    required this.wIndex,
    required this.cvController,
  }) : super(key: key);

  @override
  _WorkExperienceItemState createState() => _WorkExperienceItemState();
}

class _WorkExperienceItemState extends State<_WorkExperienceItem> {
  final roleController = TextEditingController();
  final supervisorController = TextEditingController();
  final salaryController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  bool isStillWork = true;

  @override
  void dispose() {
    roleController.dispose();
    supervisorController.dispose();
    salaryController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  Widget _buildSkillSelector(
    String title,
    List<Skill> skills,
    SkillEnum category,
    CvController controller,
  ) {
    if (skills.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: skills.asMap().entries.map((entry) {
            final idx = entry.key;
            final skill = entry.value;
            final isSelected = skill.relatedCompanyIds.contains(widget.work.id);
            return FilterChip(
              label: Text(skill.name),
              selected: isSelected,
              onSelected: (val) {
                controller.toggleSkillCompany(category, idx, widget.work.id);
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final work = widget.work;
    final wIndex = widget.wIndex;
    final cvController = widget.cvController;

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
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => cvController.removeWorkExperience(wIndex),
              ),
            ],
          ),
          const SizedBox(height: 12),

          OutlinedButton.icon(
            icon: const Icon(Icons.add_circle_outline),
            label: const Text('Manage Skills for this Company'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: 500,
                      padding: const EdgeInsets.all(24.0),
                      child: ListenableBuilder(
                        listenable: cvController,
                        builder: (context, child) {
                          final cvData = cvController.data;
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Select Skills",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 16),
                                _buildSkillSelector(
                                  'Language Skills',
                                  cvData.languageSkills,
                                  SkillEnum.language,
                                  cvController,
                                ),
                                _buildSkillSelector(
                                  'Hard Skills',
                                  cvData.hardSkills,
                                  SkillEnum.hard,
                                  cvController,
                                ),
                                _buildSkillSelector(
                                  'Soft Skills',
                                  cvData.softSkills,
                                  SkillEnum.soft,
                                  cvController,
                                ),
                                const SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Done'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 12),
          Builder(
            builder: (context) {
              final allSkills = [
                ...cvController.data.languageSkills,
                ...cvController.data.hardSkills,
                ...cvController.data.softSkills,
              ];
              final selected = allSkills
                  .where((s) => s.relatedCompanyIds.contains(widget.work.id))
                  .toList();

              if (selected.isEmpty) {
                return const Text(
                  'No skills selected yet.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                );
              }
              return Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: selected
                    .map(
                      (s) => Chip(
                        label: Text(s.name),
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.1),
                        side: BorderSide.none,
                      ),
                    )
                    .toList(),
              );
            },
          ),

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
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "Supervisor: ${role.supervisor} • Salary: ${role.salary} • Start: ${role.startDate}${!role.isCurrent ? ' • End: ${role.endDate}' : ' • Present'}",
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.orange,
                      ),
                      onPressed: () => cvController.removeRole(wIndex, rIndex),
                    ),
                  );
                }).toList(),
              ),
            ),

          const Divider(),
          const SizedBox(height: 8),
          const Text(
            "Add New Role",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    suffixIcon: Icon(Icons.calendar_today, size: 16),
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
                child: SwitchListTile(
                  title: const Text('Is Still Working Here?'),
                  value: isStillWork,
                  onChanged: (val) {
                    setState(() {
                      isStillWork = val;
                    });
                  },
                ),
              ),
              if (!isStillWork) const SizedBox(width: 8),
              if (!isStillWork)
                Expanded(
                  child: TextFormField(
                    controller: endDateController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1960),
                        lastDate: DateTime(2050),
                      );
                      if (picked != null) {
                        endDateController.text =
                            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'End Date',
                      hintText: 'Select Date',
                      suffixIcon: Icon(Icons.calendar_today, size: 16),
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
                    isCurrent: isStillWork,
                    endDate: !isStillWork ? endDateController.text : null,
                  );
                  int newIdx =
                      cvController.data.workExperience[wIndex].roles.length - 1;
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

                  roleController.clear();
                  supervisorController.clear();
                  salaryController.clear();
                  startDateController.clear();
                  endDateController.clear();
                  setState(() {
                    isStillWork = true;
                  });
                }
              },
              child: const Text('Add Role to Company'),
            ),
          ),
        ],
      ),
    );
  }
}
