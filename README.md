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

---------------------------------------------------------------------
# TUTORIAL 5
Step yg aku lakukan utk tutorial 5 nya:
1. To the point aja, aku ini cuman ikutin tutorial nya dan coba2 sendiri gitu, nahh ini itu aku lakuin semuanya di level 1 nya (main) gituu

Step2 yang aku lakukan untuk Latihan Mandiri tutorial 5 ini:
1. Pertama tama aku mencoba membuat level baru dulu utk struktur dasar latihan mandiri aku ini
2. ⁠Lalu setelah itu aku memikirkan beberapa ide gameplay utk level baru aku ini (level 2), yaitu: 
- objek button yang ketika player melewati button itu akan ada jalan baru yang terbua (ini mau aku tambahin implementasi sound ketika player masuk ke area button itu)
- ⁠musuh zombie yang menggunakan animation sprite dan script khusus yang membuat zombie itu berjalan sesuai yang aku mau dan bisa membunuh player gitu (sama aku juga mau implemen sound effect gitu juga)
- ⁠terakhir paling aku mau buat finish level nya gitu dan suatu screen pas finish itu gitu (dengan tambahan bg music gituu)
3. ⁠selanjutnya aku coba menerapkan hal ha tersebut dulu secara bertahap, dan di bagian ini aku juga mencoba menambahkan animasi jump di player aku itu (ini itu aku memperbagus dan expand kode tutorial 3 aku karena aku udh implemen animated sprite nya gituu)
4. Terakhir aku coba sambungin level 1 aku (main) ke level 2 aku

REFERENSI:
- https://cyrex-studios.itch.io/universal-ui-soundpack
- https://xdeviruchi.itch.io/16-bit-fantasy-adventure-music-pack
- sama yg dari tutorial aja