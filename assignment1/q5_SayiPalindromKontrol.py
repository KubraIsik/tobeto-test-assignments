# Kullanıcıdan alınan bir sayının palindrom olup olmadığını bulan bir program yazınız.
# Bir sayıyı ters çevirdiğimizde sayı değişmiyorsa o sayı palindrom bir sayıdır
# palindrom sayı örnek 232 , 3443

print("Bu sayı palindrom mu bulalım:")
print("***********************")

# kullanıcıdan bir sayı al
sayi = input("Bir sayı giriniz:")

# sayı rakamlarını bir listeye at
sayiRakamListe = []
for i in sayi:
    sayiRakamListe.append(i)

# listeyi ters çevir ve yeni bir listenin içine at
tersSayiRakamListe = list(reversed(sayiRakamListe))

# listeleri karşılaştır ve sayının palindrom olup olmadığını bul
if sayiRakamListe == tersSayiRakamListe:
    print("Girdiğiniz sayi palindrom bir sayıdır.")
else:
    print("Girdiğiniz sayi palindrom bir sayı değildir.")