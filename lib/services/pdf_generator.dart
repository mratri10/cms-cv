import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/cv_model.dart';

class PdfGenerator {
  static Future<Uint8List> generatePdf(CvData cv) async {
    final pdf = pw.Document();

    // Dynamically fetch robust NotoSans fonts that natively support JP/CN/KR characters to prevent blank boxes.
    final font = await PdfGoogleFonts.notoSansJPRegular();
    final fontBold = await PdfGoogleFonts.notoSansJPBold();

    final theme = pw.ThemeData.withFont(base: font, bold: fontBold);

    if (cv.config.cvFormat == 'indonesia') {
      pdf.addPage(_buildIndonesiaFormat(cv, theme));
    } else {
      pdf.addPage(_buildInternationalFormat(cv, theme));
    }

    return pdf.save();
  }

  // INDONESIA FORMAT (Structured Table)
  static pw.Page _buildIndonesiaFormat(CvData cv, pw.ThemeData theme) {
    return pw.MultiPage(
      theme: theme,
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Header(level: 0, text: cv.profile.fullName),
          pw.Text(cv.profile.summary, style: const pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 20),

          pw.Header(level: 1, text: "Personal Details"),
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.grey300),
            columnWidths: {
              0: const pw.FlexColumnWidth(1),
              1: const pw.FlexColumnWidth(2),
            },
            children: [
              _buildTableRow(
                "Birth Date",
                cv.profile.personalDetails.birthDate,
              ),
              _buildTableRow("Gender", cv.profile.personalDetails.gender),
              _buildTableRow("Address", cv.profile.personalDetails.address),
              _buildTableRow(
                "Nationality",
                cv.profile.personalDetails.nationality,
              ),
              _buildTableRow(
                "Marital Status",
                cv.profile.personalDetails.maritalStatus,
              ),
            ],
          ),
          pw.SizedBox(height: 20),

          pw.Header(level: 1, text: "Work Experience"),
          ...cv.workExperience.map((work) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  work.companyName,
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                pw.SizedBox(height: 4),
                ...work.roles.map((role) {
                  return pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 10, bottom: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "${role.roleName} (${role.startDate} - ${role.endDate ?? 'Present'})",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text("Supervisor: ${role.supervisor}"),
                      ],
                    ),
                  );
                }),
                pw.SizedBox(height: 10),
              ],
            );
          }),
        ];
      },
    );
  }

  static pw.TableRow _buildTableRow(String label, String value) {
    return pw.TableRow(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(5),
          child: pw.Text(
            label,
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(5),
          child: pw.Text(value.isNotEmpty ? value : '-'),
        ),
      ],
    );
  }

  // INTERNATIONAL FORMAT (Single Column Typographical)
  static pw.Page _buildInternationalFormat(CvData cv, pw.ThemeData theme) {
    // Dynamically inject the UI theme color into the PDF!
    final hexCode = cv.config.themeColor.replaceAll('#', '');
    PdfColor primaryColor = PdfColors.blue;
    try {
      if (hexCode.length == 6) {
        primaryColor = PdfColor.fromHex(hexCode);
      }
    } catch (_) {}

    return pw.MultiPage(
      theme: theme,
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(40),
      build: (pw.Context context) {
        return [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                cv.profile.fullName.toUpperCase(),
                style: pw.TextStyle(
                  fontSize: 28,
                  fontWeight: pw.FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                cv.profile.lifeMotto,
                style: pw.TextStyle(fontSize: 14, color: PdfColors.grey700),
              ),
              pw.SizedBox(height: 12),
              pw.Text(
                cv.profile.summary,
                style: const pw.TextStyle(fontSize: 11),
              ),

              pw.SizedBox(height: 24),

              // EXPERIENCE
              pw.Text(
                "EXPERIENCE",
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              pw.Divider(color: primaryColor, thickness: 1),
              pw.SizedBox(height: 8),

              ...cv.workExperience.map((work) {
                return pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 16),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        work.companyName,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      ...work.roles.map((role) {
                        return pw.Padding(
                          padding: const pw.EdgeInsets.only(bottom: 8),
                          child: pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Expanded(
                                child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      role.roleName,
                                      style: const pw.TextStyle(fontSize: 11),
                                    ),
                                    if (role.endDate == null ||
                                        role.endDate!.isEmpty)
                                      pw.Text(
                                        "${role.startDate} - Present",
                                        style: const pw.TextStyle(
                                          fontSize: 10,
                                          color: PdfColors.grey600,
                                        ),
                                      )
                                    else
                                      pw.Text(
                                        "${role.startDate} - ${role.endDate}",
                                        style: const pw.TextStyle(
                                          fontSize: 10,
                                          color: PdfColors.grey600,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                );
              }),

              // EDUCATION
              pw.SizedBox(height: 12),
              pw.Text(
                "EDUCATION",
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              pw.Divider(color: primaryColor, thickness: 1),
              pw.SizedBox(height: 8),
              ...cv.educationHistory.map((edu) {
                return pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 8),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            edu.schoolName,
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            edu.major,
                            style: const pw.TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                      pw.Text(
                        "${edu.startDate} - ${edu.endDate}",
                        style: const pw.TextStyle(
                          fontSize: 10,
                          color: PdfColors.grey600,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ];
      },
    );
  }
}
