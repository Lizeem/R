# 3 grands types de formations : boool�ens, nombre et cha�ne de caract�re

# Nombres

5
5*3+1
a <- 5*3+1
a
a <- TRUE
a
a <- "R"
a
a <- c(3,5,3,6,8) 
a
E <- c(7,9,45,85,14,8:36,a,78)
E[] # extraire les informations d'un vecteur
E[1] # renvoie la premi�re valeur
length(E) # donne la longueur d'un vecteur
E
ls() # liste les objets en m�moire
rm(a) # supprimer l'objet a
rm(list = ls()) # efface tous les objets en m�moire

x <- c(1:10,3,4,5)
x
X <- x[c(2:6,9,11)]
x[13]
x[length(x)]

# Objets sous R

xlog <- log(x)
xlog10 <- log(x,base=10)
xlog==xlog10 # v�rifier une condition d'�galit�
xlog > xlog10
xlog <= xlog10
x

sum(x[4:8],x[length(x)-1])
sum(x[c(4:8, length(x)-1)])

y <- 1:4
x[2]*y[3]

toto <- x[x>=5] # on extrait les valeurs de x >=5

x[x<=5] <- 0
x

which(x!=0) # la fonction donne les position des �l�ments v�rifiant le crit�re

!= # diff�rent de
  
seq(1,10,by=2)  
seq(1,10,length.out = 5) # on veut 5 �l�ments entre le 5 et le 10
diff(seq(1,10,length.out = 5))

log10(x[seq(1,length(x),by=5)]+0.5)

X <- x[seq(1,length(x),by = 2)]


y <- rnorm(10) # g�n�re 10 valeur al�atoire dans un loi centr� r�duite
 # tourne autour de 0

mean(y)
sd(y)

which(y<0)

A0 <- matrix(data = rnorm(25),nrow=5,ncol=5) # matrice de 5 lignes par 5 colonnes


dim(A0)

A0[1,1] # �l�ment de la premi�re ligne de la premi�re colonne

A <- matrix(data = NA,nrow=4,ncol=4)


# 0 en ligne 1

A[1,] <- 0


# valeurs al�atoire en ligne 2

A[2,] <- rnorm(4)
A

# suite de valeurs de 4 � 56 en ligne 3

A[3,] <- seq(4,56, length.out = 4)


# 0 en 1ere et derni�re position de la ligne 4 et un 4 et 5 en 3e et 4e

A[4,c(1,4)] <- 0
A[4,c(2,3)] <- c(4,5)




a <- c(A[seq(from=1, to =4, by =2),3], #extraire 1 valeur sur 2 de la colonne 3,
       A[3,2], #la 3eme valeur de la colonne 2, 
       A[,1], # toute la colonne 1,
       A[c(1,3),4]) #les 1ere et 3e valeurs de la colonne 4.

#Modifier  la matrice  A  en  triant  
#dans  l'ordre  d�croissant  les  valeurs  de  la  3e 
#colonne de A 

A[,3] <- sort(A[,3], decreasing = TRUE)

  
#  Exercice: Fonctions cbind() et rbind(). cbind() et rbind permettent 
#de  cr�er  des  matrices.  ?cbind.  Cr�er  une  matrice  B  de  valeurs 
#al�atoires  �  l'aide  de  la  fonction  cbind(),  puis  une  matrice  C  de 
#valeurs al�atoires avec rbind()  

cbind() rbind() # permettent de concatenner les colonnes

B <- cbind(rnorm(4),rnorm(4), rnorm(4),rnorm(4)) # 4 colonnes et 4 lignes
B <- rbind(rnorm(5),rnorm(5),rnorm(5)) # 3 colonnes et 5 lignes


is.matrix # savoir si l'objet et une matrice

# Data frames

data.frame # les arguments peuvent de plusieurs types

A <- c(21,20,23,19,21,26) 
B <- c("h","f","f","f","h","h") 
Dn <- data.frame(Age=A,Genre=B) 

class() # le type de structure

colnames() # nom des colonnes
row.names() # nommer les lignes

row.names(Dn) <- c("Jean","Marie","Val�rie","Chlo�","Paul","Pierre")

# Exercice : Afficher l'�ge de Chlo�

Dn["Chlo�","Age"]

#  Exercice:  afficher
#dans  Dn,  les  valeurs  de  la  colonne  1  pour 
#lesquelles la colonne nomm�e "Sexe" correspond � "h


Dn[Dn$Genre == "h", "Age"]

# Exercice: Afficher le sexe des  personnes dont  l'�ge est strictement 
#inf�rieur � 23 ans

Dn$Genre[Dn$Age <23] 

# Statistiques �l�mentaires sur une data frame 
mean(Dn$Age) 
min(Dn$Age) 
max(Dn$Age) 
median(Dn$Age) 
sd(Dn$Age)

# Repr�sentations graphiques simples

x <-rnorm(100)
x2 <-rnorm(100)
plot(rnorm(100))

plot(x,type="l",xlab="Abscisses",ylab="Ordonn�es", main="Mon premier graphe", lwd=2, lty=2, col="skyblue")  
abline(h=median(x),lty=2,col="black")
abline(h=mean(x),lty=2,col=rainbow(10)[2])
abline(h=c(-sd(x),sd(x)), lty =2, col="purple")
legend("topleft",c("Mean","Median","Ecart-type"),col=c(rainbow(10)[2],"black","purple"), lty=2, bg="grey")
lines(x2, col="red")
legend("bottomright", c("x","x2"), col=c("skyblue", "red"), lwd = c(2,1), lty=c(2,1), bg="grey")


lwd= #�paisseur du trait
lty= #continuit� de la courbe
grid()# ajouter une grille sur le graphique  

# La figure s'enregistre dans le r�pertoire de travail courant. Pour le 
#conna�tre, on utilise la commande: 
  getwd() 
# pour changer de r�pertoire de travail: 
setwd()

# Fonctions et structures de contr�le dans R

## Fonctions

aire <- function(longueur,largeur) {
  result <- longueur * largeur
  return(result)
}
A <- aire(3,2)

vol <- function(hauteur, longueur, largeur) {
  result <- hauteur*aire(longueur, largeur)
  return(result)
}
V <- vol(6,3,2)

# Exercice: cr�er une fonction surfcy qui calcule la surface et le 
#volume d'un cyclindre pour des dimensions donn�es du cylindre

surfcy <- function(hauteur, rayon) {
  result <- (2*pi*rayon)*(rayon+hauteur)
  return(result)
}
S <- surfcy(2,3)
S

# Exercice: cr�er une fonction surfcy qui calcule la surface et le 
#volume d'un cyclindre pour des dimensions donn�es du cylindre

surfcyvolume <- function(rayon,hauteur) { 
  S <- 2*pi*rayon*(rayon+hauteur) #calcul de la surface
  V <- pi*rayon^2*hauteur #calcul du volume 
  return(c(S,V)) 
} 

surfcyvolume(3,8)

# Exercice : g�n�rer  une  s�rie  de  100  valeurs  al�atoires  de 
#moyenne 23 et d'�cart-type 50, puis cr�er une fonction centred() pour 
#standardiser la s�rie (i.e. pour ramener la moyenne � 0 et l'�cart-type � 
#1)

y <- rnorm(100, mean=23,sd=50)
plot(y,type="l")
abline(h=23,col="red")
abline(h=c(-50+23,50+23),col="green")

abline(h=0,col="purple",lty=2)
abline(h=c(-1,1),col="orange")

# Centrer et r�duire

centragereduction <-function(y) {
  toto <- (y-mean(y))/sd(y)
  par(mfrow=c(1,2))
  hist(y, freq = FALSE)
  lines(density(y), type="l",col="red")
  hist(toto, freq=FALSE)
  lines(density(toto),type="l", col="green")
  return(toto)
}

cr <- centragereduction(y)
lines(cr,col="blue")

par(mar)# choisir les marges pour l'affiche des graphiques

#completer la fonction de mani�re � ouvrir une fen�tre graphique 
#contenant l'histogramme et la densit� de probabilit� de y

hist(y, freq=FALSE) # Fr�quence devient densit� de probabilit�
lines(density(y),type="l", col="red")

plot(density(y),type="l",col="red")
abline(v=mean(y),col="skyblue")

# Afficher � l'aide de if/else, soit
#  - print ("Le nombre est positif") si le nomre est positif
#  - print ("Le nombre est n�gatif") si le nomre est n�gatif  

x <- 0

if (x>0) 
{
  print("Le nombre est positif")
} else {
  if (x<0) 
  {
    print("Le nombre est n�gatif")  
  } else 
  {
    print("Le nombre est �gal � 0")
  }
}

# Aire d'un rectangle avec test sur la valeur des arguments :
# Afficher un message d'erreur avec 
# print ("Entrer une dimension n�gative n'a aucun sens, recommencez!")

aire <- function(longueur,largeur) {
  if(longueur<=0 | largeur <=0){
    stop("Entrer une dimension n�gative n'a aucun sens, recommencez!")  
  } else {
  result <- longueur * largeur
  print(paste("Surface =",result,"m2",sep=" "))
  return(result)
  }
}

aire(2,3)
aire(-2,3)

# Choix du calcul de la surface ou du volume d'un cylindre

surfcyvolume <- function(rayon,hauteur, choix) { 
  if(choix =="S"){
  S <- 2*pi*rayon*(rayon+hauteur) #calcul de la surface
  return(S)
  } 
  if(choix=="V") 
  {
  V <- pi*rayon^2*hauteur #calcul du volume 
  return(V) 
  }
  if(choix != "S"& choix != "V") 
  {
    stop("Vous devez entrer S ou V !")
  }
} 

surfcyvolume(3,8,choix = "V")
surfcyvolume(3,8,choix = "S")
surfcyvolume(3,8,choix = "A")

cyl <- function(r,h,choix)
{
  if(choix =="S")
  {
    s<- 2*pi*r*(r+h)
    return(s)
  } else if (choix == "V") {
    v<- pi*r^2*h
    return(v)
  } else {
    stop("vous devez entrer S ou V")
  }
}

# choix du calcul de la surface ou du volume d'un cylindre sans 
#l'utilisation de l'argument choix

# On va utiliser la fonction readline()

#exemple

fun <- function() {
  ANSWER <- readline("Are you a satisfied R user? ") #lecture d'une cha�ne de caract�re �crite dans le terminal
  if (substr(ANSWER, 1, 1) == "n") #elle extrait la premi�re lettre de l'objet ANSWER
    cat("This is impossible.  YOU LIED!\n") #si la premi�re lettre est n
  else
    cat("I knew it.\n") #si la premi�re est diff�rent de n
}

#r�sultat

cyl <- function(r,h) {
  choix <- readline("Voulez vous calculer la surface (s) ou le volume (v)?")
    if(substr(choix,1,1)=="s")
  {
    s<- 2*pi*r*(r+h)
    return(s)
  }
  if (substr(choix,1,1)== "v")
  {
    v<- pi*r^2*h
    return(v)
  } else {
    stop("Vous devez entrer s ou v !!!")
  }
}
cyl(3,8)
  
#modifier la fonction cyl de mani�re � ce qu'elle relance automatiquement
#si une autre valeur que "s" ou "v" est entr�e

cyl <- function(r,h) {
  choix <- readline("Voulez vous calculer la surface (s) ou le volume (v)?")
  while(choix !="s"& choix !="v") choix <- readline("Voulez vous calculer la surface (s) ou le volume (v)?")
  
  if(substr(choix,1,1)=="s")
  {
    s<- 2*pi*r*(r+h)
    return(s)
  }
  if (substr(choix,1,1)== "v")
  {
    v<- pi*r^2*h
    return(v)
  } else {
    stop("Vous devez entrer s ou v !!!")
  }
}
cyl(3,8)

# Exercice : cr�er une fonction pour g�n�rer et tracer une somme cumulative d'une s�rie de valeurs

data <- rnorm(100)
plot(cumsum(data),type="l",col="skyblue",lwd=2)

fonctioncumsum <- function(donnees)
{
  donneescomsum <- c() #cr�ation du vecteur
  donneescomsum[1] <- donnees[1] #initialisation du vecteur
  
  for(i in 1:length(donnees))
  {
   donneescumsum[i] <- donneescomsum[i]+x[i+1] 
  }
  return(donn�escumsum)
}

fonctioncumsum(x)

# Regression

# Ajustement de courbes sur des s�ries de valeurs, tendance lin�aire du coefficient directeur et d'ordonn�e � l'origine
# y = ax+b
# a : slope = coefficient directeur
# b : intercept = ordonn�e � l'origine

Y <- rnorm(500, mean = 0, sd = 4)
X <- c(1:length(Y))
plot (X,Y,type = "l") 
D <- 0.1 * X + 1.2 
plot(x,D, type="l")
Y2 <- Y+D
plot(X,Y2, type="l")

# 2e m�thode
# cr�er une tendance lin�aire croissante en changeant la moyenne de rnorm � chaque incr�ment

Y3 <- c()
m=0
for(i in 1:500)
{
  m <- m + 0.1
  Y3[i]<-rnorm(1,mean =m, sd=4)
}
lines(X,Y3,type = "l", col ="skyblue")
modEq <- lm (Y3 ~ X) # ~ : en fonction

# a : 0.09921
# b : 0.15208

attributes(modEq)
modEq$coefficients # coefficient du mod�le de r�gression
modEq$fitted.values # donne les 500 valeurs
modEq$residuals # r�sidus du mod�le : �cart entre les valeurs simul�s et les valeurs r�els
plot(X,Y3, type ="l", col = "skyblue")
lines(X,modEq$fitted.values,col="grey", type ="l")
points(X,modEq$residuals,col="black")

# pour utiliser le deuxi�me degr�

modEqDeg3 <- lm(Y3 ~ I(X^3) + I(X^2) + X)
lines(X,modEqDeg3$fitted.values,col="purple4")

# Fonction logarithmique

modLog <- lm(Y3 ~log(X))
lines(X,modLog$fitted.values,col="red4")


# Fonction exponentielle

modExp <- lm(Y3~exp(-X))
lines(X,modExp$fitted.values,col="orange")

# R-squared : R2

summary(modExp)$adj.r.squared
summary(modLog)$adj.r.squared
summary(modEq)$adj.r.squared
summary(modEqDeg3)$adj.r.squared

# Exercice
# 1. Regarder les donn�es
# s�parateur entre colonne
# d�cimale
# les colonnes ont - elles des noms ?

rainYear <- read.table("Z:/Geomatique et programmation/DJFM Paris 1873-2004.csv", sep="\t")
rainYear$date <- seq(as.Date("1873/01/01"),as.Date("2004/01/01"),"year")

rainDaily <- read.table("Z:/Geomatique et programmation/PSeine daily 1950-2004.csv", sep = "\t", header = T)
rainDaily$date <- as.Date(rainDaily$t,origin="1900-01-01")

rainMonth <- read.table("Z:/Geomatique et programmation/paris rainfall GHCN-ECA 1770-2004.txt", sep="\t")
rainMonth$date <- seq(as.Date("1770/01/01"),as.Date("2004/12/01"),"month")

