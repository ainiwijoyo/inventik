<?php
session_start();
include '../config/config.php';

// Function to sanitize input
function sanitize($data) {
    global $con;
    return mysqli_real_escape_string($con, trim($data));
}

// Add new refill
if(isset($_POST['tambah'])){
    $id_merek = sanitize($_POST['id_merek']);
    $id_ruangan = sanitize($_POST['id_ruangan']);
    $nama_pemesan = sanitize($_POST['nama_pemesan']);
    $nama_staf = sanitize($_POST['nama_staf']);
    $tgl_terpakai = sanitize($_POST['tgl_terpakai']);
    $kondisi = sanitize($_POST['kondisi']);
    $keterangan = sanitize($_POST['keterangan']);

    // Insert into tb_refill
    $query = "INSERT INTO tb_refill (id_merek, id_ruangan, nama_pemesan, nama_staf, tgl_terpakai, kondisi, keterangan) 
              VALUES ('$id_merek', '$id_ruangan', '$nama_pemesan', '$nama_staf', '$tgl_terpakai', '$kondisi', '$keterangan')";
    $result = mysqli_query($con, $query);

    if($result){
        // Reduce the quantity in tb_barang
        $update_query = "UPDATE tb_barang SET jumlah_awal = jumlah_awal - 1 WHERE id_merek = '$id_merek' AND jumlah_awal > 0";
        $update_result = mysqli_query($con, $update_query);

        if($update_result){
            $_SESSION['success'] = "Data berhasil ditambahkan dan stok barang dikurangi!";
        } else {
            $_SESSION['warning'] = "Data berhasil ditambahkan tetapi gagal mengurangi stok barang!";
        }
    } else {
        $_SESSION['error'] = "Gagal menambahkan data!";
    }

    header("Location: ../refill.php");
    exit();
}

// Edit refill
if(isset($_POST['ubah'])){
    $id_refill = sanitize($_POST['id_refill']);
    $id_merek = sanitize($_POST['id_merek']);
    $id_ruangan = sanitize($_POST['id_ruangan']);
    $nama_pemesan = sanitize($_POST['nama_pemesan']);
    $nama_staf = sanitize($_POST['nama_staf']);
    $tgl_terpakai = sanitize($_POST['tgl_terpakai']);
    $kondisi = sanitize($_POST['kondisi']);
    $keterangan = sanitize($_POST['keterangan']);

    $query = "UPDATE tb_refill SET 
              id_merek = '$id_merek', 
              id_ruangan = '$id_ruangan', 
              nama_pemesan = '$nama_pemesan', 
              nama_staf = '$nama_staf', 
              tgl_terpakai = '$tgl_terpakai', 
              kondisi = '$kondisi', 
              keterangan = '$keterangan' 
              WHERE id_refill = '$id_refill'";

    $result = mysqli_query($con, $query);

    if($result){
        $_SESSION['success'] = "Data berhasil diubah!";
    } else {
        $_SESSION['error'] = "Gagal mengubah data!";
    }

    header("Location: ../refill.php");
    exit();
}

// Delete refill
if(isset($_GET['act']) && $_GET['act'] == 'delete'){
    $id = decrypt($_GET['id']); // Assuming you have a decrypt function

    // Get the id_merek before deleting
    $select_query = "SELECT id_merek FROM tb_refill WHERE id_refill = '$id'";
    $select_result = mysqli_query($con, $select_query);
    $row = mysqli_fetch_assoc($select_result);
    $id_merek = $row['id_merek'];

    $query = "DELETE FROM tb_refill WHERE id_refill = '$id'";
    $result = mysqli_query($con, $query);

    if($result){
        // Increase the quantity in tb_barang
        $update_query = "UPDATE tb_barang SET jumlah_awal = jumlah_awal + 1 WHERE id_merek = '$id_merek'";
        $update_result = mysqli_query($con, $update_query);

        if($update_result){
            $_SESSION['success'] = "Data berhasil dihapus dan stok barang ditambahkan kembali!";
        } else {
            $_SESSION['warning'] = "Data berhasil dihapus tetapi gagal menambahkan kembali stok barang!";
        }
    } else {
        $_SESSION['error'] = "Gagal menghapus data!";
    }

    header("Location: ../refill.php");
    exit();
}

// If no action matches
$_SESSION['error'] = "Aksi tidak valid!";
header("Location: ../refill.php");
exit();
?>