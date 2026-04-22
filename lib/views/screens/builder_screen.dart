import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import '../../controllers/cv_controller.dart';
import '../../services/pdf_generator.dart';
import 'form_screen.dart';

class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cvController = context.watch<CvController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Split-Screen PDF Builder'),
        actions: [
          Row(
            children: [
              const Text(
                'Target Format: ',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: Theme.of(context).colorScheme.primary,
                    value: cvController.data.config.cvFormat,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    iconEnabledColor: Colors.white,
                    items: const [
                      DropdownMenuItem(
                        value: 'indonesia',
                        child: Text('Indonesia (Table layout)'),
                      ),
                      DropdownMenuItem(
                        value: 'international',
                        child: Text('International (ATS layout)'),
                      ),
                    ],
                    onChanged: (val) {
                      if (val != null) {
                        // Immediately pivots the config, triggering Provider state to re-evaluate the PdfPreview widget!
                        cvController.updateCvFormat(val);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Panel: Native Form Integration
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey.shade300, width: 2),
                ),
              ),
              // We inject the FormScreen structure elegantly on the left
              child: ClipRect(child: FormScreen()),
            ),
          ),

          // Right Panel: The Native PDF Preview Engine
          Expanded(
            flex: 1,
            child: Container(
              color: Colors
                  .grey
                  .shade100, // Provides visual contrast behind the PDF canvas
              child: PdfPreview(
                // Whenever CVController updates, Provider rebuilds this widget,
                // passing the latest dynamic cvData payload to our engine!
                build: (format) => PdfGenerator.generatePdf(cvController.data),
                allowPrinting: true,
                allowSharing:
                    true, // Natively handles cross-platform Web downloads vs Mobile share intents
                canChangeOrientation: false,
                canChangePageFormat: false,
                initialPageFormat: PdfPageFormat.a4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
