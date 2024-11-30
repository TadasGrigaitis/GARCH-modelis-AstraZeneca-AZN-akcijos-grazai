# GARCH modelis AstraZeneca (AZN) akcijos grąžai

Šio projekto tikslas – rasti tinkamiausią GARCH modelį AstraZeneca akcijos grąžai, pasitelkiant R programinę įrangą. Jis gimė iš asmeninio smalsumo pritaikyti universitete įgytas žinias realiame finansų rinkų modeliavime.

Dokumente "Aprašymas" galite rasti proceso eigą, komentarus apie savo mintis, sutiktus sunkumus ir panaudoto kodo nuotraukas.

**Projekto apžvalga**

* Įmonė: AstraZeneca – pasaulinė farmacijos lyderė, kurios 2023 m. pajamos siekė 45,8 mlrd. JAV dolerių.
* Duomenys: 10 metų (2014-01-01 iki 2024-10-23) AstraZeneca akcijų kainų ir grąžos duomenys, gauti naudojant Quantmod R paketą. Juos galite rasti "astrazeneca duomenys.csv" dokumente (trūksta datos stulpelio).
* Metodologija: Naudojami GARCH modeliai, apimantys įvairias jų formas, pvz., GARCH-M, TGARCH, EGARCH, APARCH.
* Kriterijai: Modelių tinkamumas vertinamas pagal Akaike informacinį kriterijų (AIC).

**Svarbiausi Žingsniai**
1. Duomenų analizė:
    * Panaudoti autokorelogramų (ACF, PACF) metodai koreliacijų analizei.
    * ARMA modelio preliminari analizė.

2. Sąlyginio heteroskedastiškumo testavimas:

    * Vizualinis ir formalus Engle testas patvirtino heteroskedastiškumo egzistavimą.
  
3. GARCH modelių sudarymas:
    * Sukurti ir įvertinti keli GARCH modeliai (pvz., FGARCH, IGARCH, TGARCH).
    * Asimetrijos poveikio dispersijai vertinimas naudojant Sign Bias ir kitus testus.

4. Modelių palyginimas:
    * APARCH modelis pasirodė geriausias (mažiausia AIC vertė).

**Rezultatai** 

Projekto rezultatai parodė, kad modeliai, apimantys asimetrinę dispersiją, geriau atspindi AZN akcijų grąžos dinamiką. APARCH modelis tapo „čempionu“, pranokęs kitus vertinamus modelius.
