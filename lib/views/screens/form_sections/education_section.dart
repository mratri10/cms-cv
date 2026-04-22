import 'package:cms_cv/controllers/cv_controller.dart';
import 'package:cms_cv/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EducationSection extends StatelessWidget {
  final CvController cvController;

  const EducationSection({super.key, required this.cvController});

  @override
  Widget build(BuildContext context) {
    final schoolController = TextEditingController();
    final majorController = TextEditingController();
    final themeController = context.read<ThemeController>();
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
}
