# Dairenin alanını ve çevresini hesaplayan python kodunu yazınız.(Dairenin yarıçapını kullanıcıdan alınız)

# hesaplamalar için, math kütüphanesi yükle
import math 
piDegeri =  math.pi

print("Daire Alan ve Çevre Hesaplama")
print("***********************")

daireYaricap = float(input("Dairenin yarıçapını giriniz(r):")) # r

# daire alanı hesapla
daireAlan =  round(piDegeri * (daireYaricap**2), 2)

# daire çevresi hesapla
daireCevre = round(2 * piDegeri * daireYaricap, 2)

# sonuçları yazdır
print("Yarıçapı " + str(daireYaricap) +" olan dairenin alanı: "+
        str(daireAlan) + " ve çevresi : " + str(daireCevre))