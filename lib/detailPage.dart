import 'package:flutter/material.dart';
import 'package:tugas5/food.dart';

class DetailPage extends StatefulWidget {
  final Food food;
  final String heroTag;
 
  const DetailPage({super.key, required this.food, required this.heroTag});
 
  @override
  State<DetailPage> createState() => _DetailPageState();
}
 
class _DetailPageState extends State<DetailPage> {
  bool favorit = false;
  int jumlah = 1;
 
  String _format(int angka) {
    final s = angka.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return 'Rp $buf';
  }
 
  @override
  Widget build(BuildContext context) {
    final food = widget.food;
 
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(favorit ? Icons.favorite : Icons.favorite_border),
                color: favorit ? Colors.redAccent : Colors.white,
                onPressed: () => setState(() => favorit = !favorit),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                food.nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 8, color: Colors.black54)],
                ),
              ),
              background: Hero(
                tag: widget.heroTag,
                child: Image.network(
                  food.gambar,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.orange.shade100,
                      child: const Icon(Icons.fastfood,
                          size: 80, color: Colors.deepOrange),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kategori + harga
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          food.kategori,
                          style: TextStyle(
                            color: Colors.deepOrange.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        food.hargaFormat,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
 
                  // Rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 22),
                      const SizedBox(width: 4),
                      Text(
                        '${food.rating}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 6),
                      Text('(${food.ulasan} ulasan)',
                          style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                  const SizedBox(height: 20),
 
                  // Info singkat
                  Row(
                    children: [
                      _infoBox(Icons.timer_outlined, 'Waktu',
                          '${food.waktuMasak} menit'),
                      const SizedBox(width: 10),
                      _infoBox(Icons.local_fire_department_outlined, 'Kalori',
                          '${food.kalori} kkal'),
                      const SizedBox(width: 10),
                      _infoBox(Icons.restaurant, 'Porsi', food.porsi),
                    ],
                  ),
                  const SizedBox(height: 24),
 
                  // Deskripsi
                  const Text('Deskripsi',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    food.deskripsi,
                    style: TextStyle(
                        fontSize: 15, height: 1.5, color: Colors.grey.shade800),
                  ),
                  const SizedBox(height: 24),
 
                  // Bahan
                  const Text('Bahan Utama',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: food.bahan
                        .map((b) => Chip(
                              label: Text(b),
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.deepOrange.shade200),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
 
      // Bar bawah: jumlah + tombol pesan + kembali
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
          ),
          child: Row(
            children: [
              IconButton.outlined(
                onPressed: jumlah > 1 ? () => setState(() => jumlah--) : null,
                icon: const Icon(Icons.remove),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text('$jumlah',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              IconButton.outlined(
                onPressed: () => setState(() => jumlah++),
                icon: const Icon(Icons.add),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '$jumlah x ${food.nama} ditambahkan (${_format(food.harga * jumlah)})'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: Text('Pesan ${_format(food.harga * jumlah)}'),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filledTonal(
                tooltip: 'Kembali',
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),
        ),
      ),
    );
  }
 
  Widget _infoBox(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12)],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.deepOrange),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            const SizedBox(height: 2),
            Text(value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
 