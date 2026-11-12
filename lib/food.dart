class Food {
  final String nama;
  final String kategori;
  final int harga;
  final double rating;
  final int ulasan;
  final int waktuMasak; // menit
  final int kalori;
  final String porsi;
  final String deskripsi;
  final List<String> bahan;
  final String gambar;

  const Food({
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.rating,
    required this.ulasan,
    required this.waktuMasak,
    required this.kalori,
    required this.porsi,
    required this.deskripsi,
    required this.bahan,
    required this.gambar,
  });

  /// Format harga: 25000 -> "Rp 25.000"
  String get hargaFormat {
    final s = harga.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return 'Rp $buf';
  }
}

const List<Food> daftarMakanan = [
  Food(
    nama: 'Pizza Margherita',
    kategori: 'Italia',
    harga: 65000,
    rating: 4.8,
    ulasan: 245,
    waktuMasak: 20,
    kalori: 850,
    porsi: '1 loyang (2-3 orang)',
    deskripsi:
        'Pizza klasik dengan saus tomat segar, keju mozzarella leleh, dan daun basil harum di atas adonan tipis yang renyah di tepi dan lembut di tengah.',
    bahan: ['Adonan pizza', 'Saus tomat', 'Mozzarella', 'Basil', 'Minyak zaitun'],
    gambar:
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=800&auto=format&fit=crop&q=60',
  ),
  Food(
    nama: 'Salad Sayur Segar',
    kategori: 'Sehat',
    harga: 35000,
    rating: 4.6,
    ulasan: 128,
    waktuMasak: 10,
    kalori: 220,
    porsi: '1 mangkuk',
    deskripsi:
        'Campuran sayuran segar dengan topping pilihan dan dressing ringan. Cocok untuk kamu yang ingin makan sehat, ringan, dan tetap mengenyangkan.',
    bahan: ['Selada', 'Tomat ceri', 'Timun', 'Wortel', 'Dressing lemon'],
    gambar:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&auto=format&fit=crop&q=60',
  ),
  Food(
    nama: 'Pancake Madu',
    kategori: 'Dessert',
    harga: 28000,
    rating: 4.7,
    ulasan: 187,
    waktuMasak: 15,
    kalori: 450,
    porsi: '1 porsi (3 lembar)',
    deskripsi:
        'Tumpukan pancake empuk dan lembut disiram madu manis serta mentega. Pilihan sarapan atau camilan sore yang menggugah selera.',
    bahan: ['Tepung terigu', 'Telur', 'Susu', 'Mentega', 'Madu'],
    gambar:
        'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=800&auto=format&fit=crop&q=60',
  ),
  Food(
    nama: 'Pasta Carbonara',
    kategori: 'Italia',
    harga: 48000,
    rating: 4.5,
    ulasan: 96,
    waktuMasak: 18,
    kalori: 620,
    porsi: '1 piring',
    deskripsi:
        'Spaghetti dengan saus krim gurih, irisan daging asap, dan taburan keju parmesan. Teksturnya creamy dengan rasa yang kaya.',
    bahan: ['Spaghetti', 'Daging asap', 'Krim', 'Parmesan', 'Lada hitam'],
    gambar:
        'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=800&auto=format&fit=crop&q=60',
  ),
  Food(
    nama: 'Sate Ayam Bakar',
    kategori: 'Nusantara',
    harga: 30000,
    rating: 4.9,
    ulasan: 312,
    waktuMasak: 25,
    kalori: 400,
    porsi: '10 tusuk',
    deskripsi:
        'Sate ayam bakar dengan bumbu kecap manis dan rempah pilihan, disajikan dengan bumbu kacang kental serta lontong. Aroma arangnya menggoda.',
    bahan: ['Daging ayam', 'Kecap manis', 'Bumbu kacang', 'Bawang merah', 'Lontong'],
    gambar:
        'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800&auto=format&fit=crop&q=60',
  ),
  Food(
    nama: 'Nasi Bowl Ayam Teriyaki',
    kategori: 'Asia',
    harga: 38000,
    rating: 4.4,
    ulasan: 74,
    waktuMasak: 15,
    kalori: 560,
    porsi: '1 mangkuk',
    deskripsi:
        'Nasi hangat dengan potongan ayam saus teriyaki manis gurih, ditemani sayuran segar dan telur. Praktis, lengkap, dan mengenyangkan.',
    bahan: ['Nasi putih', 'Ayam', 'Saus teriyaki', 'Brokoli', 'Telur'],
    gambar:
        'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800&auto=format&fit=crop&q=60',
  ),
];