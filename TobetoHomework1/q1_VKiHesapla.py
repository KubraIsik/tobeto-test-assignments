
# Kullanıcının girdiği boy ve ağırlık değerlerine göre vücut kitle indeksini (VKİ = ağırlık/(boy*boy)) hesaplayınız.

print("Vücut Kitle Endeksini Hesapla:")
print("***********************")

# Kullanıcıdan boy ve ağırlık değerlerini al.
boy = float(input("Lütfen boyunuzu giriniz(örnek: 1.50): "))
kilo= int(input("Lütfen kilonuzu giriniz(kg):"))

# Kullanıcıdan alınan değerler ile Vücut kitle indeksini hesapla ve yazdır.
kullaniciVki = round(kilo / (boy**2), 2)
print("Vücut Kitle Endeksiniz:", kullaniciVki)