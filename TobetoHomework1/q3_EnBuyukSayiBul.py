# Kullanıcının girdiği üç sayı arasında en büyük olanı bulan ve sonucu yazdıran bir program yazınız.

print("Girilen En Büyük Sayısı Bul")
print("***********************")

birinciSayi = float( input("1.Sayıyı giriniz : "))
ikinciSayi =  float (input("2.Sayıyı giriniz : "))
ucuncuSayi =  float( input("3.Sayıyı giriniz : "))

tumSayilarListe = [birinciSayi,ikinciSayi,ucuncuSayi]

enBuyukSayi = tumSayilarListe[0]

for sayi in tumSayilarListe:
    if sayi > enBuyukSayi:
        enBuyukSayi = sayi

print("Girdiğiniz sayılar içinde en büyük sayı: ", enBuyukSayi)