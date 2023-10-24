# Kullanıcının girdiği üç sayı arasında en büyük olanı bulan ve sonucu yazdıran bir program yazınız.

print("Girilen En Büyük Sayısı Bul")
print("***********************")

# kullanıcıdan 3 sayı al
birinciSayi = float( input("1.Sayıyı giriniz : "))
ikinciSayi =  float (input("2.Sayıyı giriniz : "))
ucuncuSayi =  float( input("3.Sayıyı giriniz : "))

# sayıları bir listeye at
tumSayilarListe = [birinciSayi,ikinciSayi,ucuncuSayi]

# Listenin içindeki ilk sayıyı en büyük sayı olarak belirle
enBuyukSayi = tumSayilarListe[0]

# en büyük sayıyı bulmak için ilk sayıyı listedeki diğer sayılarla karşılaştır
for sayi in tumSayilarListe:
    if sayi > enBuyukSayi:
        enBuyukSayi = sayi

# en büyük sayıyı yazdır
print("Girdiğiniz sayılar içinde en büyük sayı: ", enBuyukSayi)