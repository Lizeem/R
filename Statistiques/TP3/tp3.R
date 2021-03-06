# Etapes :

#1.Probl�matique -> Richesse sp�cifique
#2.M�thode statistique -> Comparaison de moyenne
#3.Conditions d'application -> normalit� des donn�es, ind�pendance des donn�es, 
#n>=5, �galit� des variances, variable quantitative
#4.Choix du test
#5.Hypoth�se
#6.Niveau de risque 
#7.R�lisation du test
#8.Interpr�tation
#9.Conclusion

# Exercice 1

# question biologique: y-a-t-il une diff�rence significative
#entre la richesse en 2 ann�es

# Echantillons ind�pendants 
dim(birds) # grands �chantillons 

# Test Z

# Test de Normalit� 
# H0: pas de diff�rence significative entre la variable et ce qui serait la variable si elle suivait une loi normale
# H1 : diff�rence significative entre la variable et ce qui serait la variable si elle suivait une loi normale

shapiro.test(birds$rs1)

# pvalue< 0.05 donc Ho est rejet�

shapiro.test(birds$rs3)

# pvalue<0.05 donc H0 est rejet�

# Test de wilcoxon : test non param�trique de comparaison de 2 moyennes appari�es

wilcox.test(birds$rs1, birds$rs3, paired = T) # les donn�es sont appari�s car les individus 
#sont les sites de mesures, les m�mes qui sont �chantillonn�es entre les deux dates, les �chantillons sont donc appari�s, 
#il faut donc faire un test non param�trique pour donn�es appari�s de comparaison des 2 moyennes 

#pvalue < 0.05 donc H0 est rejet�.
# Il y a une diff�rence significative entre 2001 et 2003. La richesse sp�cifique de 2003 est plus �volu� que celle de 2001

# Observation de la distribution des donn�es rs1 et rs3

# Representation graphique

par(mfrow=c(2,2))
hist(birds$rs1)
hist(birds$rs3)
hist(log(birds$rs1))
hist(log(birds$rs3))

# les distributions sont log normales. Regardons si leur logarithme suit une loi normale

shapiro.test(log(birds$rs1))
shapiro.test(log(birds$rs3))

# les pvalues > 5%, on accepte H0, les distributions des logs sont normales 

# v�rification de l'�galit� des variances pour application d'un test param�trique

var.test(log(birds$rs1), log(birds$rs3))

# pvalue > 5%, on accepte H0 donc l'�galit� des variance, on peut faire un 
#test param�trique de comparaison des deux moyennes sur les logarithmes

t.test(log(birds$rs1), log(birds$rs3), paired = T, var.equal = T)

# pvalue < 5% donc on rejette H0 

par(mfrow=c(1,1))

boxplot(birds$rs1, birds$rs3, names = c("2001","2003"), ylab ="Richesse sp�cifique", main= "la richesse sp�cifique par ann�e", col =c( "skyblue","grey"))
points(1,mean(birds$rs1),pch=23,col="tomato")
points(2,mean(birds$rs3),pch=15, col="orange")

# Il manque le r�sultat de la comparaison de la comparaison de moyenne 

text(locator(1),"a")
text(locator(1),"b")
text(locator(1),"p=0.00028")

# Exercice 2

# Ces donn�es confirment-elles l'hypoth�se d'une r�duction du domaine vital de l'�lan durant la p�riode hivernale ?

# Echantillon appari�s 
dim(elan) # petits �chantillons

# H0: il n'y a pas de diff�rence significative entre les deux p�riodes 
# H1: il y a une diff�rence significative entre les deux p�riodes

shapiro.test(elan$Hiver)

# pvalue > 0.05 donc normalit�

shapiro.test(elan$Printemps)

# pvalue > 0.05 donc normalit�

# v�rifions l'�galit� des variances

var.test(elan$Hiver, elan$Printemps)

# pvalue < 0.05 donc H1 : il y a une diff�rence entre les variances

t.test(elan$Hiver, elan$Printemps, var.equal =F, paired = T, alt="less")

# pvalue < 0.05 donc on rejette H0 : il y a une diff�rence significative il y a une diminution du domaine vital selon la saison

boxplot(elan$Hiver, elan$Printemps, main = "Domaine vital", ylab = "taille domaine vital de l'�lan (ha)", names =c("hiver","printemps"), col=c("skyblue","beige"))

points(1,mean(elan$Hiver), pch=17, col="yellow")
points(2,mean(elan$Printemps), pch=17, col="grey")
text(locator(1),"a")
text(locator(1),"b")
text(locator(1), "p=0.00364")

# Exercice 3

# Existe t-il une diff�rence significative de poids entre les m�les et les femelles

# Echantillons ind�pendants

dim(toads)# petits �chantillons

male <- subset(toads, sexe =="m")$poids

femelle <- subset(toads, sexe =="f")$poids


# H0: il n'y a pas de diff�rence significative de poids entre les m�le et les femelles 
# H1: il y a une diff�rence significative de poids entre les m�les et les femelles

shapiro.test(male)

# pvalue >0.05 donc normalit�

shapiro.test(femelle)

#pvalue >0.05 donc normalit�

var.test(male, femelle)

# pvalue < 0.05 donc H1 : il y a une diff�rence significative entre les deux p�riodes

t.test(male, femelle, var.equal =T, paired = F)

#pvalue > 0.05 donc H0, il n'y a pas de valeurs significatives de poids entre les m�les et les femelles donc normalement pas de graph

boxplot(male, femelle, main = "Repr�sentation graphique", ylab = "poids", names =c("m�le", "femelle"), col=c("skyblue","grey"))

points(1,mean(male), pch=16, col="pink")
points(2,mean(femelle), pch=16, col="violet")

# Exercice 4

fish <-read.table("pesticides.txt", sep="\t", header =T)

A2 <- subset(fish, age =="2ans")$pesticides
B2 <- subset(fish, age =="ax")$pesticides
0.204 -> moy

# Question 1

shapiro.test(A2)

# pvalue < 0.05 donc H0 est rejet�, la variable n'est pas normale
# v�rifions si le log de la distribution suit une loi normale

shapiro.test(log(A2))

# pvalue < 0.05 donc H0 est rejet�, le logarithme de la distribution de suit pas unne loi normale
# test non param�trique pour comparer une distribution � une moyenne connue

wilcox.test(A2, mu=moy, paired = F, alt="two.sided")

# pvalue > 0.05 donc H0 est accept�, il n'y a pas de diff�rence significative la moyenne pour les poissons de 2 ans et la moyenne nationale

# Question 2

mean(A2)
mean(B2)

# la moyenne des poissons de 2 ans du Lac A est � priori plus grande que celle du Lac B

# Question 3

# Pas besoin de tester la normalit� des poissons du Lac B car ceux du Lac A n'ont pas une distribution normale (voir Question 1)
# test non param�trique pour 2 �chantillons ind�pendants car ce sont deux lacs diff�rents

wilcox.test(B2,A2, alt="less")

# pvalue > 0.05 donc H0 n'est pas accept�e et il n'y a pas d'inf�riorit�, la moyenne de ax n'est pas diff�rente de la moyenne de 2 ans

# Question 4

A4 <- subset(fish, age=="4ans")$pesticides
shapiro.test(A4)

# pvalue > 0.05, donc H0 est accept� donc A4 suit une loi normale

t.test(A4, mu=moy)

# pvalue < 0.05 donc H0 est rejet� et la concentration moyenne en pesticides des poissons de 4 ans du Lac A est significativement plus grande que la moyenne nationale.

# Question 5

shapiro.test(B2)

# pvalue > 0.05 donc H0 est accept�, B2 suit une loi normale

t.test(A4, B2)

# pvalue < 0.05 donc H0 est rejet�, il y a une diff�rence significative entre les poissons de 4 ans du lac A et les poissons du lac B

# Exercice 5

mais2 <- mais[,c("Hauteur","Masse","Parcelle","Hauteur.J7")]
mais3 <- mais2[-c(1,32,65),]
na.omit(mais2) -> mais3
mais3

plot(mais3$Hauteur,mais3$Masse,xlim=c(100,400), ylim=c(1000,3000), xlab="hauteur", ylab="masse", pch=16, col="skyblue")

N <- subset(mais3, Parcelle=="Nord")$Masse
S <- subset(mais3, Parcelle=="Sud")$Masse


shapiro.test(S)

# pvalue > 0.05 donc H0 est accept�, la parcelle Sud  suit une loi normale

shapiro.test(N)

# pvalue > 0.05 donc H0 est accept�, la parcelle Nord suit une loi normale

var.test(S,N)
t.test(N,S)

# pvalue > 0.05 donc H0 est accept�, il n'y a donc pas de diff�rence entre la moyenne des masses des pieds de mais des parcelles Nord et Sud

boxplot(N,S, main = "Moyenne des masses des pieds de mais des parcelles Nord et Sud", col= c("skyblue","grey"), names = c("N","S"))
points(2,mean(S), pch=16, col="violet")
points(1,mean(N), pch=16, col="tomato")

# Question 5

Hn <- subset(mais3, Parcelle=="Nord")$Hauteur
Ho <- subset(mais3, Parcelle=="Ouest")$Hauteur
shapiro.test(Hn)

# pvalue > 0.05 donc H0 est accept�

shapiro.test(Ho)

# pvalue > 0.05 donc H0 est accept�

var.test(Ho,Hn)

# pvalue > 0.05 donc Homosc�dasticit� est accept�

mean(Hn)
mean(Ho)

t.test(Hn,Ho, var.equal=T, paired=F, alt="less")

# pvalue < 0.05 donc la parcelle Nord a une hauteur plus petite que la parcelle Ouest 

dataH <- c(mean(Hn), mean(Ho))
datasdH <- c(sd(Hn), sd(Ho))
labx <- c("Parcelle nord", "Parcelle ouest")
graph <- barplot(dataH, names = labx, space = 0.5, ylab= "Hauteur en cm", col = "blue", border ="blue", axes=T, ylim = c(0,350), cex.names = 1, las =0)
segments(graph, dataH-datasdH, graph, dataH + datasdH, lwd=2)
arrows(graph, dataH-datasdH, graph, dataH + datasdH, lwd=2, angle=90, code=2, length=0.05)
text(locator(1), "a")
text(locator(1), "b")

graph <- barplot(dataH, names = labx, space = 0.5, ylab= "Hauteur en cm", col = "violet", border ="black",density=7, angle =45, axes=T, ylim = c(0,350), cex.names = 1, las =1)
segments(graph, dataH-0, graph, dataH + datasdH, lwd=2)
arrows(graph, dataH-0, graph, dataH+ datasdH, lwd=2, angle=90, code=2, length=0.05)
text(locator(1), "a")
text(locator(1), "b")


# Question f

H <- mais3$Hauteur
HJ7 <- mais3$Hauteur.J7

# Test de normalit�

shapiro.test(H)

# pvalue > 0.05 donc H0 est accept�, l'objet H suit une loi normale

shapiro.test(HJ7)

# pvalue > 0.05 donc H0 est accept�, l'objet HJ7 suit une loi normale

var.test(H,HJ7)

# pvalue > 0.05 donc homosc�dasticit� des valeurs

t.test(H,HJ7, var.equal = T, paired = T)

# pvalue > 0.05 donc H0 est accept�, absence de diff�rence significative entre la hauteur et la hauteur 7 jours apr�s

# Exercice 6

boxplot(ogm$foie~ogm$ogm, main = "Taille du foie en fonction de la quantit� d'ogm", xlab = "pourcentage d'ogm", ylab = "taille du foie", col = c("skyblue", "grey", "tomato", "violet"))
g0 <- subset(ogm, ogm=="0")
g11 <- subset(ogm, ogm =="11")
g22 <- subset(ogm, ogm =="22")
g33 <- subset(ogm, ogm =="33")
g0f <- g0$foie
g11f <- g11$foie
g22f <- g22$foie
g33f <- g33$foie
points(1,mean(g0f))
points(2,mean(g11f))
points(3,mean(g22f))
points(4,mean(g33f))

shapiro.test(g0f)

# pvalue > 0.05 donc la variable suit une loi normale

shapiro.test(g11f)

# pvalue > 0.05 donc la variable suit une loi normale

shapiro.test(g22f)

# pvalue > 0.05 donc la variable suit une loi normale

shapiro.test(g33f)

# pvalue < 0.05 donc la variable ne suit pas une loi normale

# Homosc�dasticit�

var.test(g11f,g0f)

# pvalue > 0.05 donc il y a �galit� des variances

t.test(g0f,g11f, var.equal = T)

# pvalue > 0.05 donc H0 est acept�, absence de diff�rence entre les foies � 0% d'ogm et les foies � 11% d'ogm

var.test(g0f, g22f)

# pvalue > 0.05 donc il n'y a pas �galit� des variances

t.test(g0f,g22f, var.equal = F)

# pvalue > 0.05 donc H0 est accept�, absence de diff�rence entre les foies � 0% d'ogm et les foies � 22% d'ogm
# sachant que g33f ne suit pas une loi normale : wilcox.test

wilcox.test(g0f, g33f,paired = F)

# pvalue < 0.05 don H0 est refus�, il y a une diff�rence significative entre les rats � 0% et les rats � 33% d'ogm

