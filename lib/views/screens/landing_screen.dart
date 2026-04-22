import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/cv_controller.dart';
import '../../controllers/theme_controller.dart';
import 'builder_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mottoController = TextEditingController();
  final TextEditingController _jobInputController = TextEditingController();

  String _selectedLanguage = 'en';
  final List<String> _localAppliedJobs = [];

  @override
  void dispose() {
    _nameController.dispose();
    _mottoController.dispose();
    _jobInputController.dispose();
    super.dispose();
  }

  void _addJob() {
    final job = _jobInputController.text.trim();
    if (job.isNotEmpty && !_localAppliedJobs.contains(job)) {
      setState(() {
        _localAppliedJobs.add(job);
      });
      _jobInputController.clear();
    }
  }

  void _removeJob(String job) {
    setState(() {
      _localAppliedJobs.remove(job);
    });
  }

  void _startBuilding() {
    final cvController = context.read<CvController>();

    cvController.updateName(_nameController.text);
    cvController.updateMotto(_mottoController.text);
    cvController.updateLanguage(_selectedLanguage);

    // Insert new locally collected jobs into the central controller
    for (var job in _localAppliedJobs) {
      cvController.addAppliedJob(job);
    }

    // Navigate using the built-in Navigator logic to BuilderScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const BuilderScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    final currentTheme = themeController.currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CV Setup'),
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: currentTheme.cardDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome to CV Builder',
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge?.copyWith(fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Let\'s cover the basics before diving into the details.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Language Dropdown
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Target Language',
                    ),
                    initialValue: _selectedLanguage,
                    items: const [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text('English (en)'),
                      ),
                      DropdownMenuItem(
                        value: 'id',
                        child: Text('Indonesian (id)'),
                      ),
                      DropdownMenuItem(
                        value: 'jp',
                        child: Text('Japanese (jp)'),
                      ),
                      DropdownMenuItem(
                        value: 'cn',
                        child: Text('Chinese (cn)'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedLanguage = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 24),

                  // Full Name Field
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'e.g., John Doe',
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Life Motto Field
                  TextFormField(
                    controller: _mottoController,
                    decoration: const InputDecoration(
                      labelText: 'Life Motto / Summary',
                      hintText: 'A brief 1-sentence descriptor...',
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 24),

                  // Applied Jobs Array Input
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _jobInputController,
                          decoration: const InputDecoration(
                            labelText: 'Applied Jobs',
                            hintText: 'e.g., Flutter Developer',
                          ),
                          onFieldSubmitted: (_) => _addJob(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _addJob,
                        child: const Text('Add Tag'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Applied Jobs Chips Visualizer
                  if (_localAppliedJobs.isNotEmpty) ...[
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: _localAppliedJobs.map((job) {
                        return Chip(
                          label: Text(job),
                          onDeleted: () => _removeJob(job),
                          backgroundColor: currentTheme.primaryColor.withValues(
                            alpha: 0.1,
                          ),
                          deleteIconColor: currentTheme.primaryColor,
                          labelStyle: TextStyle(
                            color: currentTheme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          side: BorderSide.none,
                        );
                      }).toList(),
                    ),
                  ],

                  const SizedBox(height: 48),

                  // Build Redirection
                  ElevatedButton(
                    onPressed: _startBuilding,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: const Text('Start Building \u2192'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
