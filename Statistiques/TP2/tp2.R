range(trees$Height) # donne le min et le maximum de Height
c(min(trees$Height), max(trees$Height))

sum(trees$Height) # somme totale
cumsum(trees$Height) # somme cumul�es

summary(trees$Height) # donne les valeurs de la distribution

fivenum(trees$Height) # donne les valeurs de la distribution sans la moyenne

sd(trees$Height)
std <- function(x)sqrt(var(x)) # calcul de l'�cart - type
std(trees$Height)

sort(trees$Height) # ordre croissant des donn�es de Height
sort(trees$Height, decreasing = T) # ordre d�croissant des donn�es de Height

rank(trees$Height) # il renvoit le rang en valeur croissante, la premi�re valeur est au 6�me rang...
# pour les valeur �gales, on donne la moyenne du rang
sample(trees$Height, 20) # �chantillonnage al�atoire de 20 valeurs 

res<-c();nn=1000; # cr�ation d'un vecteur vide poss�dant un objet nn = 1000  
for(i in 1:nn){ # boucle for r�p�titive tant que i soit entre 1 et 1000
  x=sample(trees$Girth,10); # cr�ation d'un objet x comme �tant �chantillonnge al�atoire de 10 valeurs de girth 
  res[i]=mean(x,na.rm = T); # on impute � la i �me valeur de l'objet res la moyenne de l'objet x cr�er
}

# res va �tre un vecteur de 1000 moyennes d'un l'�chantillonnage de 10 valeurs de Girth

par(mfrow=c(2,1))
hist(res,freq=T) # fr�quence
hist(res,freq=F) # densit�

# l'histogramme n'est pas unimodale car il y a une valeur abh�rante � la ligne 13

res<-c();nn=1000; 
for(i in 1:nn){ 
x=sample(trees$Girth[trees$Girth<100],10); # seulement les valeurs inf�rieur � 100
res[i]=mean(x,na.rm = T);
}

par(mfrow=c(2,1))
hist(res,freq=T) # fr�quence
hist(res,freq=F) # densit�

# Data frames

names(HF)[3] ="taille" # renomm� la colonne 3 "taille"
HF[,(dim(HF)[2]+1)] = ifelse(HF$sexe=="h",0,1) # cr�ation d'une 4 colonne avec 0 et 1 en fonction du sexe
colnames(HF)[4] = "femme"


HF[-32,] # retirer la ligne 32
HF <- HF[-32,]
HF <- HF[,-4] # retirer la ligne 4

Q <- list("f",58,175)
HF[67,] <- Q # rajoute une ligne dans le tableau avec les variables donn�es

s1=rnorm(10,mean=2)
summary(s1)
s2=rnorm(100,mean=2)
summary(s2)
s3=rnorm(10000,mean=2)
summary(s3)

par(mfrow=c(3,3))

hist(s1,prob=T)
hist(s2,prob=T)
hist(s3,prob=T)
plot(density(s1))
x= seq(-5,5,by=.01)
lines(x,dnorm(x,mean=2),col=2) #donner x et y pour qu'elle fonctionne
plot(density(s2))
lines(x,dnorm(x,mean=2),col=2)
plot(density(s3))
lines(x,dnorm(x,mean=2),col=2)

pnorm(1.96)
qnorm(0.975)

n=20;p=0.3;mu=n*p;s2=n*p*(1-p)
mu # esp�rance
s2 # variance

x= rbinom(100,n,p)
x

hist(x,freq=FALSE)
mean(x)
var(x)

n=length(x)

plot(sort(x),(1:n)/n,type="s") # fr�quence cumul�e

hist(x,prob=T,col=grey(0.4))
curve(dnorm(x,mu,s2),add=T) # fonctionne directement sur une fonction donn�e
qqnorm(x);qqline(x)
plot(qpois(ppoints(x),mu),sort(x))
plot(qbinom(ppoints(x),n,p),sort(x))

n=50;p=0.03;mu=n*p;s2=n*p*(1-p);
x=rbinom(100,n,p)
plot(qpois(ppoints(x),mu),sort(x))
x=rnorm(100)
hist(x,freq=F)
curve(dnorm(x),add=T)

par(mfrow=c(1,1))

homme <- subset(HF, sexe == "h")$tai
hist(homme,proba=T, col = "grey", main="Taille des Hommes")
provih <- seq(160,200,length = 50)
lines(provih, dnorm(provih, mean(homme),sd(homme)),lwd = 2)

femme <- subset(HF, sexe == "f")$tai
hist(femme,proba=T, col = "violet", main="Taille des Femmes")
provif <- seq(150,180, length = 50)
lines(provif, dnorm(provif, mean(femme),sd(femme)),lwd = 2)

  
# Exercice 1

dosage <- c(0.96,1.04,1.08,0.92,1.04,1.18,0.99,0.99,1.25,1.08)
mean(dosage)

# intervalle 95%

t.test(dosage)$conf.int[1:2]


# Exercice 2

n = 150; p= 0.02
dbinom(5,150,0.02)
pbinom(3,150,0.02)
sum(dbinom(0:3,150,0.02))

qbinom(0.99,150,0.02)







