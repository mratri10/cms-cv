import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    // We are natively enforcing WasmDatabase because this CMS is designed for ultra-lightweight Web execution.
    // The browser will securely cache these assets without Node.js backends.
    final result = await WasmDatabase.open(
      databaseName: 'cv_cms_db',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.dart.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      print('WasmDatabase is running fallback configurations due to unsupported features: ${result.missingFeatures}');
    }

    return result.resolvedExecutor;
  }));
}
