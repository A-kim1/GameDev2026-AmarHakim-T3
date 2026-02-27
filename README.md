Fitur lanjutan yang aku tambahkan adalah:
1. Double Jump
2. Dashing
3. Crouching

di tutorial 3 ini itu aku sudah mengikutinya dan menerapkan, basic movement (gerak kiri & kanan) dan gravity. Nahh dari 2 kode basic itu aku berusaha mencoba mengembangkan mekanik pergerakan yang lain (seperti yang aku jelaskan di awal), cara aku mengimplementasikannya:

1. Double Jump
Tujuan: Memungkinkan karakter melompat maksimal dua kali sblm menyentuh tanah.
Implementasi cara kerja nya:
    - jump_count mencatat jumlah lompatan.
    - Ketika karakter menyentuh lantai (is_on_floor()), counter direset.
    - Jika tombol lompat ditekan dan jump_count < max_jump, karakter bisa lompat lagi.
    - Setelah 2 kali lompat, pemain tidak bisa lompat sampai menyentuh tanah kembali.

2. Dashing
Tujuan: Karakter dapat bergerak lebih cepat dalam waktu singkat, dengan sistem cooldown agar tidak bisa digunakan terus-menerus.
Implementasi cara kerja nya:
    1) Saat tombol dash ditekan:
        - Dicek apakah cooldown sudah selesai
        - Dicek apakah sedang tidak dalam kondisi dash
    2) Kalo valid:
    - Aktifin is_dashing
        - Set timer durasi
        - Set cooldown
    3) Saat timer habis:
        - is_dashing = false
    4) Cooldown berjalan terpisah sampai 0


3. Crouching
Tujuan: Karakter bisa jongkok saat menekan tombol bawah dan bergerak lebih lambat.
Implementasi cara kerja nya:
    - Hanya bisa crouch saat menyentuh tanah
    - Kecepatan dikurangi menjadi crouch_speed
    - Animasi berubah ke "crouch"