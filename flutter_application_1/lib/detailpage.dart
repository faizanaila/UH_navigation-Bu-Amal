import 'package:flutter/material.dart';
import 'package:flutter_application_1/halvoucher.dart';

class DetailPage extends StatefulWidget {
  final IconData icon;
  final String nama;
  final String harga;

  const DetailPage({
    super.key,
    required this.icon,
    required this.nama,
    required this.harga,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _voucher = '-';

  void _klaimVoucher() async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HalVoucherPage()),
    );

    if (hasil != null) {
      setState(() {
        _voucher = hasil;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sudahKlaim = _voucher != '-';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(title: Text(widget.nama)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Kartu info produk
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(widget.icon, size: 56, color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.nama,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.harga,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple.shade700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: sudahKlaim ? Colors.green.shade50 : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: sudahKlaim ? Colors.green.shade200 : Colors.grey.shade300,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          sudahKlaim ? Icons.local_offer : Icons.local_offer_outlined,
                          color: sudahKlaim ? Colors.green.shade700 : Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Voucher: $_voucher',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: sudahKlaim ? Colors.green.shade700 : Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ElevatedButton.icon(
            onPressed: _klaimVoucher,
            icon: const Icon(Icons.card_giftcard),
            label: const Text('Klaim Voucher Diskon'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}