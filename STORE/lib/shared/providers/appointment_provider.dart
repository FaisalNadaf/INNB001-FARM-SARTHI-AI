import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/appointment_model.dart';

final appointmentsProvider = FutureProvider<List<AppointmentModel>>((ref) async {
  return [
    AppointmentModel(
      id: 'a1',
      farmerName: 'Faisal1',
      serviceType: 'Farm Health Checkup',
      status: 'approved',
      scheduledAt: DateTime.now().add(const Duration(hours: 2)),
      source: 'phone',
    ),
    AppointmentModel(
      id: 'a2',
      farmerName: 'Mahadev Patil',
      serviceType: 'Scheme Assistance',
      status: 'new',
      scheduledAt: DateTime.now().add(const Duration(days: 1)),
      source: 'app',
    ),
  ];
});
