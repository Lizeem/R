# commentaire
help(sort)

# Les vecteurs

ages <- c(28,25,23,24,26,23,21,22,24,29,24,26,31,28,27,24,23,25,27,25,24,21,24,23,25,31,28,27,24,23)

ages

seq (2,6)

seq(1,10, by=0.5)

vecteur1 <- (2.5)
vecteur2 <- (2.6)
vecteur3 <- c(vecteur1, vecteur2)

vecteur1[2]

x <-0

vecteur1[vecteur1 >x]

length(vecteur1)

length(vecteur1[vecteur1 >x])

# Les matrices

matrice <- matrix(c(1.5,2.1,3.2,1.6,1.4,1.5),nr = 3, nc = 2)
matrice

matrice[1,1]
matrice[1,]
matrice[2:3,1:2]

# Les listes

liste <- list("AH",55)
liste

# Les tableaux de données


tab <- read.table("trees.csv", sep=',', header = TRUE)
tab

tab <- read.table("trees.txt", sep='\t', header = TRUE)
tab



# TRUE nom des colonne sur la première ligne sinon FALSE

names(tab)
ls(tab)
dim(tab)
summary(tab)

row.names = 1
tab

tab2 <- read.table("trees_modif.txt", sep='\t', header = TRUE)
tab2

tab[1,2]
tab[1,"HEIGHT"]
tab[1,]
tab[,"Girth"]
tab$Girth

tab[tab$Girth>12,]
tab[tab$Girth ==12,]
subset(tab,Girth ==12.9)

sub <- tab[tab$Girth ==12,]
sub

attach(tab)
detach(tab)
attach(tab2)

Girth

summary(tab)
ncol(tab)
nrow(tab)
mean(Girth)
median(Girth)
var(Girth)
sd(Girth)

mean(Girth, na.rm = TRUE)

# Représentation graphique

plot(Species)

plot(Volume~Height)

plot(Girth~Species)

plot(x=Species, y=Volume, main= "Volume des arbres en fonction de leur hauteur", xlab = "Hauteur", ylab ="Volume")


hist(Girth)

hist(Girth,freq=F)

boxplot(Girth)

boxplot(Girth~Species)

par(mfrow=c(1,))

par(mfrow=c(1,))

boxplot(Girth, Height, Volume)

box<-c("Girth","Height","Volume")

boxplot(Girth,Height,Volume,names=box)

## Exercice

dim(herbicide)

#5 variables, herbicides = qualitative, plante = qualitative,nb de plante= quantitative discret, survivants = continu borné

sans <-subset(herbicide,herbicide=="aucun")
herb1<-subset(herbicide, herbicide=="herbicide1")
herb2<-subset(herbicide, herbicide=="herbicide2")
herb3<-subset(herbicide, herbicide=="herbicide3")

données <- c("sans","herb1","herb2","herb3")

boxplot(sans$survivants, herb1$survivants, herb2$survivants, herb3$survivants,main = "survivants", xlab = "herbicides", ylab ="taux de survivants",names = données, col=c("grey","skyblue","tomato","yellow"))

points(1,mean(sans$survivants),pch=24,col="white")
points(2,mean(herb1$survivants),pch=16, col="white")
points(3,mean(herb2$survivants),pch=18, col="white")
points(4,mean(herb3$survivants),pch=22,col="white")




