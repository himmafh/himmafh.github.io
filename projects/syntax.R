# Closing Price Saham 
library(quantmod)
getSymbols("ESSA.JK",from = "2019-10-01",to = "2023-09-01")
ESSA<-ESSA.JK$ESSA.JK.Close
plot(ESSA, main="Plot ESSA")

getSymbols("HRTA.JK",from = "2019-10-01",to = "2023-09-01")
HRTA<-HRTA.JK$HRTA.JK.Close
plot(HRTA, main="Plot HRTA")

getSymbols("HRUM.JK",from = "2019-10-01",to = "2023-09-01")
HRUM<-HRUM.JK$HRUM.JK.Close
plot(HRUM, main="Plot HRUM")

getSymbols("SRTG.JK",from = "2019-10-01",to = "2023-09-01")
SRTG<-SRTG.JK$SRTG.JK.Close
plot(SRTG, main="Plot SRTG")

getSymbols("SILO.JK",from = "2019-10-01",to = "2023-09-01")
SILO<-SILO.JK$SILO.JK.Close
plot(SILO, main="Plot SILO")

getSymbols("MARK.JK",from = "2019-10-01",to = "2023-09-01")
MARK<-MARK.JK$MARK.JK.Close
plot(MARK, main="Plot MARK")

getSymbols("TBIG.JK",from = "2019-10-01",to = "2023-09-01")
TBIG<-TBIG.JK$TBIG.JK.Close
plot(TBIG, main="Plot TBIG")

getSymbols("DSNG.JK",from = "2019-10-01",to = "2023-09-01")
DSNG<-DSNG.JK$DSNG.JK.Close
plot(DSNG, main="Plot DSNG")

getSymbols("CTRA.JK",from = "2019-10-01",to = "2023-09-01")
CTRA<-CTRA.JK$CTRA.JK.Close
plot(CTRA, main="Plot CTRA")

getSymbols("EMTK.JK",from = "2019-10-01",to = "2023-09-01")
EMTK<-EMTK.JK$EMTK.JK.Close
plot(EMTK, main="Plot EMTK")

getSymbols("ASSA.JK",from = "2019-10-01",to = "2023-09-01")
ASSA<-ASSA.JK$ASSA.JK.Close
plot(ASSA, main="Plot ASSA")

data_closing_price = data.frame(ESSA,HRTA,HRUM,SRTG,SILO,MARK,TBIG,DSNG,CTRA,EMTK,ASSA)
colnames(data_closing_price)=c("ESSA","HRTA","HRUM","SRTG","SILO","MARK","TBIG","DSNG","CTRA","EMTK","ASSA")
print(head(data_closing_price, n=10))
print(tail(data_closing_price, n=10))

# Return Saham
rESSA<-diff(log(ESSA))
rESSA<-na.omit(rESSA)  
plot(rESSA, main = "Plot Return ESSA")

rHRTA<-diff(log(HRTA))
rHRTA<-na.omit(rHRTA)  
plot(rHRTA, main = "Plot Return HRTA")

rHRUM<-diff(log(HRUM))
rHRUM<-na.omit(rHRUM)  
plot(rHRUM, main = "Plot Return HRUM")

rSRTG<-diff(log(SRTG))
rSRTG<-na.omit(rSRTG)  
plot(rSRTG, main = "Plot Return SRTG")

rSILO<-diff(log(SILO))
rSILO<-na.omit(rSILO)  
plot(rSILO, main = "Plot Return SILO")

rMARK<-diff(log(MARK))
rMARK<-na.omit(rMARK)  
plot(rMARK, main = "Plot Return MARK")

rTBIG<-diff(log(TBIG))
rTBIG<-na.omit(rTBIG)  
plot(rTBIG, main = "Plot Return TBIG")

rDSNG<-diff(log(DSNG))
rDSNG<-na.omit(rDSNG)  
plot(rDSNG, main = "Plot Return DSNG")

rCTRA<-diff(log(CTRA))
rCTRA<-na.omit(rCTRA)  
plot(rCTRA, main = "Plot Return CTRA")

rEMTK<-diff(log(EMTK))
rEMTK<-na.omit(rEMTK)  
plot(rEMTK, main = "Plot Return EMTK")

rASSA<-diff(log(ASSA))
rASSA<-na.omit(rASSA)  
plot(rASSA, main = "Plot Return ASSA")

return_saham = data.frame(rESSA,rHRTA,rHRUM,rSRTG,rSILO,rMARK,rTBIG,rDSNG,rCTRA,rEMTK,rASSA)
colnames(return_saham)=c("rESSA","rHRTA","rHRUM","rSRTG","rSILO","rMARK","rTBIG","rDSNG","rCTRA","rEMTK","rASSA")
print(head(return_saham, n=10))
print(tail(return_saham, n=10))

#Statistika Deskriptif 
library(fBasics)
basicStats(rESSA)
basicStats(rHRTA)
basicStats(rHRUM)
basicStats(rSRTG)
basicStats(rSILO)
basicStats(rMARK)
basicStats(rTBIG)
basicStats(rDSNG)
basicStats(rCTRA)
basicStats(rEMTK)
basicStats(rASSA)

#Uji Stasioneritas dalam Varians
library(forecast)
lambda1 = round(BoxCox.lambda(rESSA),0) 
lambda1
lambda2 = round(BoxCox.lambda(rHRTA),0) 
lambda2
lambda3 = round(BoxCox.lambda(rHRUM),0) 
lambda3
lambda4 = round(BoxCox.lambda(rSRTG),0) 
lambda4
lambda5 = round(BoxCox.lambda(rSILO),0) 
lambda5
lambda6 = round(BoxCox.lambda(rMARK),0) 
lambda6
lambda7 = round(BoxCox.lambda(rTBIG),0) 
lambda7
lambda8 = round(BoxCox.lambda(rDSNG),0) 
lambda8
lambda9 = round(BoxCox.lambda(rCTRA),0) 
lambda9
lambda10 = round(BoxCox.lambda(rEMTK),0) 
lambda10
lambda11 = round(BoxCox.lambda(rASSA),0) 
lambda11

# Uji Stasioneritas dalam Mean
library(tseries)
adf.test(rESSA)
adf.test(rHRTA)
adf.test(rHRUM)
adf.test(rSRTG)
adf.test(rSILO)
adf.test(rMARK)
adf.test(rTBIG)
adf.test(rDSNG)
adf.test(rCTRA)
adf.test(rEMTK)
adf.test(rASSA)

# Identifikasi Model ARIMA 
autoESSA = auto.arima(rESSA,stationary=T,trace=T)
autoHRTA = auto.arima(rHRTA,stationary=T,trace=T)
autoHRUM = auto.arima(rHRUM,stationary=T,trace=T)
autoSRTG = auto.arima(rSRTG,stationary=T,trace=T)
autoSILO = auto.arima(rSILO,stationary=T,trace=T)
autoMARK = auto.arima(rMARK,stationary=T,trace=T)
autoTBIG = auto.arima(rTBIG,stationary=T,trace=T)
autoDSNG = auto.arima(rDSNG,stationary=T,trace=T)
autoCTRA = auto.arima(rCTRA,stationary=T,trace=T)
autoEMTK = auto.arima(rEMTK,stationary=T,trace=T)
autoASSA = auto.arima(rASSA,stationary=T,trace=T)

#Estimasi dan Uji Signifikansi Parameter Model ARIMA
library(lmtest)
coeftest(autoHRUM)
coeftest(autoSRTG)
coeftest(autoSILO)
coeftest(autoMARK)
coeftest(autoTBIG)
coeftest(autoEMTK)

#Uji Independensi Residual
Ljung.Box<- function(x, lag=24)
{
  output1=acf(x,lag.max = lag, plot = F, na.action = na.pass)
  acfout=output1$acf
  output2=pacf(x, lag.max = lag, plot = F, na.action = na.pass)
  pacfout=output2$pacf
  pacfout[1]=1
  pacfout=c(pacfout,output2$acf)
  temp1=NULL
  temp1[1]=NULL
  temp2=NULL
  temp2[1]=NULL
  for(i in 1:lag)
  {
    temp1[i+1]=Box.test(x, lag = i, type = "Ljung")$statistic
    temp2[i+1]=Box.test(x, lag = i, type = "Ljung")$p.value
  }
  result=cbind(ACF=acfout, PACF=pacfout, "Q-Stats"=temp1,"P-value"=temp2)
  rownames(result)=0:lag
  print(length(acfout))
  print(length(pacfout))
  print(length(temp1))
  print(length(temp2))
  print(result)
}

Ljung.Box(autoSRTG$residuals)
Ljung.Box(autoSILO$residuals)
Ljung.Box(autoMARK$residuals)
Ljung.Box(autoTBIG$residuals)

# Uji Normalitas Residual
ks.test(autoSRTG[["residuals"]], "pnorm", mean(autoSRTG[["residuals"]]),var(autoSRTG[["residuals"]]))
ks.test(autoSILO[["residuals"]], "pnorm", mean(autoSILO[["residuals"]]),var(autoSILO[["residuals"]]))
ks.test(autoMARK[["residuals"]], "pnorm", mean(autoMARK[["residuals"]]),var(autoMARK[["residuals"]]))
ks.test(autoTBIG[["residuals"]], "pnorm", mean(autoTBIG[["residuals"]]),var(autoTBIG[["residuals"]]))

# Uji Lagrange Multiplier (terdapat efek ARCH/GARCH)
library(FinTS)
ArchTest(autoSRTG[["residuals"]])
ArchTest(autoSILO[["residuals"]])
ArchTest(autoMARK[["residuals"]])
ArchTest(autoTBIG[["residuals"]])

# Estimasi dan Uji Signifikansi Model GARCH
library(rugarch)

#Pemodelan GARCH SRTG
spec.garch11.SRTG = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,1)), 
                           mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
garch11.SRTG = ugarchfit(spec = spec.garch11.SRTG, data = rSRTG,cond.dist=MLE)
garch11.SRTG

spec.garch12.SRTG = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,2)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
garch12.SRTG = ugarchfit(spec = spec.garch12.SRTG, data = rSRTG,cond.dist=MLE)
garch12.SRTG

spec.garch21.SRTG = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(2,1)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
garch21.SRTG = ugarchfit(spec = spec.garch21.SRTG, data = rSRTG,cond.dist=MLE)
garch21.SRTG

spec.garch22.SRTG = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(2,2)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
garch22.SRTG = ugarchfit(spec = spec.garch22.SRTG, data = rSRTG,cond.dist=MLE)
garch22.SRTG

#Pemodelan GARCH SILO
spec.garch11.SILO = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,1)), 
                               mean.model=list(armaOrder=c(2,2), include.mean=FALSE))
garch11.SILO = ugarchfit(spec = spec.garch11.SILO, data = rSILO,cond.dist=MLE)
garch11.SILO

spec.garch12.SILO = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,2)), 
                               mean.model=list(armaOrder=c(2,2), include.mean=FALSE))
garch12.SILO = ugarchfit(spec = spec.garch12.SILO, data = rSILO,cond.dist=MLE)
garch12.SILO

spec.garch21.SILO = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(2,1)), 
                               mean.model=list(armaOrder=c(2,2), include.mean=FALSE))
garch21.SILO = ugarchfit(spec = spec.garch21.SILO, data = rSILO,cond.dist=MLE)
garch21.SILO

spec.garch22.SILO = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(2,2)), 
                               mean.model=list(armaOrder=c(2,2), include.mean=FALSE))
garch22.SILO = ugarchfit(spec = spec.garch22.SILO, data = rSILO,cond.dist=MLE)
garch22.SILO

#Pemodelan GARCH MARK
spec.garch11.MARK = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,1)), 
                               mean.model=list(armaOrder=c(1,1), include.mean=FALSE))
garch11.MARK = ugarchfit(spec = spec.garch11.MARK, data = rMARK,cond.dist=MLE)
garch11.MARK

spec.garch12.MARK = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,2)), 
                               mean.model=list(armaOrder=c(1,1), include.mean=FALSE))
garch12.MARK = ugarchfit(spec = spec.garch12.MARK, data = rMARK,cond.dist=MLE)
garch12.MARK

spec.garch21.MARK = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(2,1)), 
                               mean.model=list(armaOrder=c(1,1), include.mean=FALSE))
garch21.MARK = ugarchfit(spec = spec.garch21.MARK, data = rMARK,cond.dist=MLE)
garch21.MARK

spec.garch22.MARK = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(2,2)), 
                               mean.model=list(armaOrder=c(1,1), include.mean=FALSE))
garch22.MARK = ugarchfit(spec = spec.garch22.MARK, data = rMARK,cond.dist=MLE)
garch22.MARK

#Pemodelan GARCH TBIG
spec.garch11.TBIG = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,1)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
garch11.TBIG = ugarchfit(spec = spec.garch11.TBIG, data = rTBIG,cond.dist=MLE)
garch11.TBIG

spec.garch12.TBIG = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,2)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
garch12.TBIG = ugarchfit(spec = spec.garch12.SRTG, data = rTBIG,cond.dist=MLE)
garch12.TBIG

spec.garch21.TBIG = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(2,1)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
garch21.TBIG = ugarchfit(spec = spec.garch21.TBIG, data = rTBIG,cond.dist=MLE)
garch21.TBIG

spec.garch22.TBIG = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(2,2)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
garch22.TBIG = ugarchfit(spec = spec.garch22.TBIG, data = rTBIG,cond.dist=MLE)
garch22.TBIG

#Pemodelan IGARCH SRTG
spec.igarch11.SRTG = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(1,1)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
igarch11.SRTG = ugarchfit(spec = spec.igarch11.SRTG, data = rSRTG,cond.dist=MLE)
igarch11.SRTG

spec.igarch12.SRTG = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(1,2)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
igarch12.SRTG = ugarchfit(spec = spec.igarch12.SRTG, data = rSRTG,cond.dist=MLE)
igarch12.SRTG

spec.igarch21.SRTG = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(2,1)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
igarch21.SRTG = ugarchfit(spec = spec.igarch21.SRTG, data = rSRTG,cond.dist=MLE)
igarch21.SRTG

spec.igarch22.SRTG = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(2,2)), 
                               mean.model=list(armaOrder=c(1,2), include.mean=FALSE))
igarch22.SRTG = ugarchfit(spec = spec.igarch22.SRTG, data = rSRTG,cond.dist=MLE)
igarch22.SRTG

#Pemodelan IGARCH SILO
spec.igarch11.SILO = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(1,1)), 
                               mean.model=list(armaOrder=c(2,2), include.mean=FALSE))
igarch11.SILO = ugarchfit(spec = spec.igarch11.SILO, data = rSILO,cond.dist=MLE)
igarch11.SILO

spec.igarch12.SILO = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(1,2)), 
                               mean.model=list(armaOrder=c(2,2), include.mean=FALSE))
igarch12.SILO = ugarchfit(spec = spec.igarch12.SILO, data = rSILO,cond.dist=MLE)
igarch12.SILO

spec.igarch21.SILO = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(2,1)), 
                               mean.model=list(armaOrder=c(2,2), include.mean=FALSE))
igarch21.SILO = ugarchfit(spec = spec.igarch21.SILO, data = rSILO,cond.dist=MLE)
igarch21.SILO

spec.igarch22.SILO = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(2,2)), 
                               mean.model=list(armaOrder=c(2,2), include.mean=FALSE))
igarch22.SILO = ugarchfit(spec = spec.igarch22.SILO, data = rSILO,cond.dist=MLE)
igarch22.SILO

#Pemodelan IGARCH MARK
spec.igarch11.MARK = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(1,1)), 
                               mean.model=list(armaOrder=c(1,1), include.mean=FALSE))
igarch11.MARK = ugarchfit(spec = spec.igarch11.MARK, data = rMARK,cond.dist=MLE)
igarch11.MARK

spec.igarch12.MARK = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(1,2)), 
                               mean.model=list(armaOrder=c(1,1), include.mean=FALSE))
igarch12.MARK = ugarchfit(spec = spec.igarch12.MARK, data = rMARK,cond.dist=MLE)
igarch12.MARK

spec.igarch21.MARK = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(2,1)), 
                               mean.model=list(armaOrder=c(1,1), include.mean=FALSE))
igarch21.MARK = ugarchfit(spec = spec.igarch21.MARK, data = rMARK,cond.dist=MLE)
igarch21.MARK

spec.igarch22.MARK = ugarchspec(variance.model=list(model="iGARCH", garchOrder=c(2,2)), 
                               mean.model=list(armaOrder=c(1,1), include.mean=FALSE))
igarch22.MARK = ugarchfit(spec = spec.igarch22.MARK, data = rMARK,cond.dist=MLE)
igarch22.MARK


# # Uji Normalitas IGARCH
residigarch12.SRTG=residuals(igarch12.SRTG)
residigarch12.SRTG <- as.numeric(residigarch12.SRTG)
residigarch12.SILO=residuals(igarch12.SILO)
residigarch12.SILO <- as.numeric(residigarch12.SILO)
residigarch11.MARK=residuals(igarch11.MARK)
residigarch11.MARK <- as.numeric(residigarch11.MARK)

ks.test(residigarch12.SRTG, "pnorm", mean(residigarch12.SRTG),var(residigarch12.SRTG))
ks.test(residigarch12.SILO, "pnorm", mean(residigarch12.SILO),var(residigarch12.SILO))
ks.test(residigarch11.MARK, "pnorm", mean(residigarch11.MARK),var(residigarch11.MARK))


#Residual Model ARIMA
residARIMA.SRTG=autoSRTG$residuals
residARIMA.SILO=autoSILO$residuals
residARIMA.MARK=autoMARK$residuals

#Data peramalan Saham 
rSRTG <- as.numeric(rSRTG)
rSILO <- as.numeric(rSILO)
rMARK <- as.numeric(rMARK)

ramalan_ARIMA_SRTG = rSRTG - residARIMA.SRTG
ramalan_ARIMA_SRTG
ramalan_ARIMA_SILO = rSILO - residARIMA.SILO
ramalan_ARIMA_SILO

ramalan_ARIMA_MARK = rMARK - residARIMA.MARK
ramalan_ARIMA_MARK

data_ramalan = data.frame(ramalan_ARIMA_SRTG,ramalan_ARIMA_SILO,ramalan_ARIMA_MARK)
print(head(data_ramalan, n=10))
print(tail(data_ramalan, n=10))

#rmse
library(Metrics)
rmse(rSRTG,ramalan_ARIMA_SRTG)
rmse(rSILO,ramalan_ARIMA_SILO)
rmse(rMARK,ramalan_ARIMA_MARK)

# Peramalan Return Saham
forecast.igarch.SRTG=ugarchforecast(igarch12.SRTG,data=rSRTG,n.ahead=42)
forecast.igarch.SRTG = forecast.igarch.SRTG@forecast$seriesFor

forecast.igarch.SILO=ugarchforecast(igarch12.SILO,data=rSILO,n.ahead=42)
forecast.igarch.SILO = forecast.igarch.SILO@forecast$seriesFor

forecast.igarch.MARK=ugarchforecast(igarch11.MARK,data=rBBRI,n.ahead=42)
forecast.igarch.MARK = forecast.igarch.MARK@forecast$seriesFor

data_forecast = data.frame(forecast.igarch.SRTG,forecast.igarch.SILO,forecast.igarch.MARK)
colnames(data_forecast)=c("SRTG","SILO","MARK")
View(data_forecast)

#Expected Return Hasil Peramalan
exp_return=colMeans(data_forecast)

#Mengubah data permalan menjadi data numerik
forecast.igarch.SRTG <- as.numeric(forecast.igarch.SRTG)
forecast.igarch.SILO <- as.numeric(forecast.igarch.SILO)
forecast.igarch.MARK <- as.numeric(forecast.igarch.MARK)

#data IHSG
getSymbols("^JKSE",from = "2023-08-31",to = "2023-11-01")
IHSG<-JKSE$JKSE.Close
rIHSG<-diff(log(IHSG))
rIHSG<-na.omit(rIHSG)  
rIHSG<-as.numeric(rIHSG)

#Portofolio
saham=data.frame(forecast.igarch.SRTG,forecast.igarch.SILO,forecast.igarch.MARK)
colnames(saham)=c("SRTG","SILO","MARK")
benchmark=rIHSG

#Nilai Semivariance
n=nrow(saham)
c=ncol(saham)
ret_B = saham-benchmark
colnames(ret_B)=c("SRTG-B","SILO-B","MARK-B")
ret_B

ret_C = data.frame(matrix(nrow=n,ncol=c))
for(i in 1:n)
{
  for(j in 1:c)
    if(ret_B[i,j]<0)
    {ret_C[i,j]=ret_B[i,j]}
  else
  {ret_C[i,j]=0}
}
colnames(ret_C)=c("Min(SRTG-B,0)","Min(SILO-B,0)","Min(MARK-B,0)")
ret_C

semivariance=ret_C^2
colnames(semivariance)=c("SVSRTG","SVSILO","SVMARK")
semivariance
SVSRTG = sum(semivariance$SVSRTG)/n
SVSRTG
SVSILO = sum(semivariance$SVSILO)/n
SVSILO
SVMARK = sum(semivariance$SVMARK)/n
SVMARK

#Nilai Semicovariance
semicov_SRTGSILO=(1/n)*sum(ret_C$'Min(SRTG-B,0)'*ret_C$'Min(SILO-B,0)')
semicov_SRTGSILO
semicov_SRTGMARK=(1/n)*sum(ret_C$'Min(SRTG-B,0)'*ret_C$'Min(MARK-B,0)')
semicov_SRTGMARK
semicov_SILOMARK=(1/n)*sum(ret_C$'Min(SILO-B,0)'*ret_C$'Min(MARK-B,0)')
semicov_SILOMARK

SV = matrix(c(SVSRTG,semicov_SRTGSILO,semicov_SRTGMARK,semicov_SRTGSILO,SVSILO,
              semicov_SILOMARK,semicov_SRTGMARK,semicov_SILOMARK,SVMARK),3,3)
SV
eigen(SV)$values
#Pembobotan
bobot = data.frame(matrix(nrow=3,ncol=1))
for(i in 1:3)
{N=matrix(c(1,1,1),3,1)
bobot[i,]=((solve(SV)%*%(N))[i,]/((t(N)%*%solve(SV))%*%(N)))}
colnames(bobot)=c("Bobot Portofolio")
rownames(bobot)=c("wSRTG","wSILO","wMARK")
View(bobot)

wSRTG=bobot[1,]
cat("Bobot untuk saham SRTG adalah sebesar", wSRTG,"\n")
wSILO=bobot[2,]
cat("Bobot untuk saham SILO adalah sebesar", wSILO,"\n")
wMARK=bobot[3,]
cat("Bobot untuk saham MARK adalah sebesar", wMARK,"\n")
wTotal=sum(bobot)
cat("Total bobot untuk seluruh saham adalah sebesar", wTotal,"\n")

#Return portofolio
n = nrow(saham)
c = ncol(saham)
portofolio = data.frame(matrix(nrow=n,ncol=1))
for(i in 1:n)
{ portofolio[i,]=(wSRTG*(saham[i,1]))+(wSILO*(saham[i,2]))+(wMARK*saham[i,3])}
colnames(portofolio)=c("Return Portofolio")
portofolio
View(portofolio)

#Expected Return Portofolio
exp_porto = colMeans(portofolio)
exp_porto

#risiko portofolio
SVPortofolio = ((wSRTG^2)*SVSRTG)+((wSILO^2)*SVSILO)+(2*(wSRTG*wSILO*semicov_SRTGSILO))+((wMARK^2)*SVMARK)+(2*(wSRTG*wMARK*semicov_SRTGMARK))+(2*(wSILO*wMARK*semicov_SILOMARK))
SVPortofolio

##Value at Risk dengan Historical Simulation
###Sort Return
sort_return_portofolio = portofolio[order(portofolio[,"Return Portofolio"]), ,drop = FALSE]
sort_return_portofolio

# Mengambil data pada persentil ke-1-alfa
q <- quantile(sort_return_portofolio$`Return Portofolio`,0.05)
q

### VaR HS, HP 1
modal=100000000
hp=1
VaR_HS1 = modal*q*sqrt(hp)
VaR_HS1
persen_VaR_HS1 = (VaR_HS1/modal)*100
persen_VaR_HS1
###VaR HS, HP 5
hp=5
VaR_HS5 = modal*q*sqrt(hp)
VaR_HS5
persen_VaR_HS5 = (VaR_HS5/modal)*100
persen_VaR_HS5
###VaR HS, HP 20
hp=20
VaR_HS20 = modal*q*sqrt(hp)
VaR_HS20
persen_VaR_HS20 = (VaR_HS20/modal)*100
persen_VaR_HS20
