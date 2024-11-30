library(quantmod)
library(rugarch)
library(Hmisc)
library(forecast)
library(lmtest)

AZN<-getSymbols("AZN", from = '2014-01-01', to = '2024-10-23', auto.assign = FALSE)
r<-diff(log(AZN$AZN.Adjusted))
r<-as.numeric(r[-1])

acf(r)
pacf(r)


arma11<-Arima(r, order=c(1, 0, 1))
coeftest(arma11)

res2<-arma11$residual^2
acf(res2)

engle<-lm(res2~Lag(res2, 1)+ Lag(res2, 2)+ Lag(res2, 3))
summary(engle)$r.squared*length(res2)
qchisq(0.95, 3)

azn.garch<-ugarchspec(variance.model=list(garchOrder=c(1,1), model= "sGARCH",
                                           submodel="GARCH")
                       , mean.model=list(armaOrder=c(2,1)))
garch.azn<-ugarchfit(spec= azn.garch, data=r)
garch.azn
pacf(residuals(garch.azn))

azn.fgarch<-ugarchspec(variance.model=list(garchOrder=c(1,1), model= "fGARCH",
                                            submodel="GARCH")
                        , mean.model=list(armaOrder=c(2,1)),
                        distribution.model = "std")
fgarch.azn<-ugarchfit(spec= azn.fgarch, data=r)
fgarch.azn

azn.garchm<-ugarchspec(variance.model=list(garchOrder=c(1,1), model= "fGARCH",
                                          submodel="GARCH")
                      , mean.model=list(armaOrder=c(2,1), archm=TRUE, archpow = 1)
                      ,distribution.model = "std")
garchm.azn<-ugarchfit(spec= azn.garchm, data=r)
garchm.azn

azn.igarch<-ugarchspec(variance.model=list(garchOrder=c(1,1), model= "iGARCH",
                                            submodel="GARCH")
                        , mean.model=list(armaOrder=c(0,0)),
                        distribution.model = "std")
igarch.azn<-ugarchfit(spec= azn.igarch, data=r)
igarch.azn

azn.tgarch<-ugarchspec(variance.model=list(garchOrder=c(1,1), model= "fGARCH",
                                          submodel="TGARCH")
                      , mean.model=list(armaOrder=c(2, 1)),distribution.model = "std")
tgarch.azn<-ugarchfit(spec= azn.tgarch, data=r)
tgarch.azn

azn.egarch<-ugarchspec(variance.model=list(garchOrder=c(1,1), model= "eGARCH"),
                        mean.model=list(armaOrder=c(0,1)),distribution.model = "std")
egarch.azn<-ugarchfit(spec= azn.egarch, data=r)
egarch.azn


azn.aparch<-ugarchspec(variance.model=list(garchOrder=c(1,1), model= "apARCH")
                       , mean.model=list(armaOrder=c(2,1)),distribution.model = "std")
aparch.azn<-ugarchfit(spec= azn.aparch, data=r)
aparch.azn


infocriteria((garch.azn))[1]
infocriteria((garchm.azn))[1]
infocriteria((igarch.azn))[1]
infocriteria((tgarch.azn))[1]
infocriteria((egarch.azn))[1]
infocriteria((aparch.azn))[1]