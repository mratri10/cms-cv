import 'package:cms_cv/controllers/cv_controller.dart';
import 'package:cms_cv/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
}
