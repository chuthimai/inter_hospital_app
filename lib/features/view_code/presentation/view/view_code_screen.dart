import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/enum/permission_type.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/permission.dart';
import 'package:inter_hospital_app/share/utils/date_formatter.dart';
import 'package:inter_hospital_app/share/utils/id_formatter.dart';
import 'package:inter_hospital_app/share/widgets/info_row.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ViewCodeScreen extends StatelessWidget {
  final Permission _permission;

  const ViewCodeScreen({super.key, required Permission permission})
      : _permission = permission;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xem chi tiết mã'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 16.sp,
            horizontal: 32.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // QR code
              PrettyQrView.data(
                data: "${IdFormatter.format(_permission.userId)}|${_permission.id}|${_permission.expiredTime}",
                errorCorrectLevel: QrErrorCorrectLevel.H,
                decoration: PrettyQrDecoration(
                  shape:
                      PrettyQrSmoothSymbol(color: Theme.of(context).dividerColor),
                  quietZone: const PrettyQrQuietZone.modules(2),
                ),
              ),
              const SizedBox(height: 16),

              // Tên hiển thị nổi bật
              Text(
                _permission.hospital.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // Thông tin QR code
              InfoRow(label: "Cho phép", value: _permission.type.toVietnamese()),
              InfoRow(
                label: "Có hiệu lực đến",
                value: DateFormatter.formatFull(_permission.expiredTime),
              )
            ],
          ),
        ),
      ),
    );
  }
}
