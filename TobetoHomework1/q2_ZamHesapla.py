# Maaşı ve zam oranı girilen işçinin zamlı maaşını hesaplayarak ekranda gösteriniz.

print("Yeni Maaşını Hesapla:")
print("***********************")

# Kullanıcıdan Maaş ve Zam oranını al
isciMaas = int(input("Maaşınızı giriniz: "))
zamOran = float(input("Zam oranınızı giriniz(%):"))

# Yeni Maaşını hesapla ve yazdır
zamliMaas =  isciMaas + int((isciMaas*zamOran)/100)
print("*********************")
print("Zamlanmış yeni maaşınız: ", zamliMaas)