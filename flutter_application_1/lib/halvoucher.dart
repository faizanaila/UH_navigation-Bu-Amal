import 'package:flutter/material.dart';

class HalVoucherPage extends StatelessWidget {
  const HalVoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(title: const Text('Pilih Voucher')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih diskon voucher kamu:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

        
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'Diskon 10%');
              },
              child: _kartuVoucher(
                persen: '10%',
                warna: Colors.blue,
                keterangan: 'Berlaku untuk semua produk',
              ),
            ),
            const SizedBox(height: 12),

          
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'Diskon 20%');
              },
              child: _kartuVoucher(
                persen: '20%',
                warna: Colors.orange,
                keterangan: 'Khusus pembelian hari ini',
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _kartuVoucher({
    required String persen,
    required Color warna,
    required String keterangan,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: warna.withOpacity(0.12), shape: BoxShape.circle),
            child: Center(
              child: Text(
                persen,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: warna),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Diskon $persen',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(keterangan, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}