# Etapes :

#1.Problématique -> Richesse spécifique
#2.Méthode statistique -> Comparaison de moyenne
#3.Conditions d'application -> normalité des données, indépendance des données, 
#n>=5, égalité des variances, variable quantitative
#4.Choix du test
#5.Hypothèse
#6.Niveau de risque 
#7.Rélisation du test
#8.Interprétation
#9.Conclusion

# Exercice 1

# question biologique: y-a-t-il une différence significative
#entre la richesse en 2 années

# Echantillons indépendants 
dim(birds) # grands échantillons 

# Test Z

# Test de Normalité 
# H0: pas de différence significative entre la variable et ce qui serait la variable si elle suivait une loi normale
# H1 : différence significative entre la variable et ce qui serait la variable si elle suivait une loi normale

shapiro.test(birds$rs1)

# pvalue< 0.05 donc Ho est rejeté

shapiro.test(birds$rs3)

# pvalue<0.05 donc H0 est rejeté

# Test de wilcoxon : test non paramétrique de comparaison de 2 moyennes appariées

wilcox.test(birds$rs1, birds$rs3, paired = T) # les données sont appariés car les individus 
#sont les sites de mesures, les mêmes qui sont échantillonnées entre les deux dates, les échantillons sont donc appariés, 
#il faut donc faire un test non paramétrique pour données appariés de comparaison des 2 moyennes 

#pvalue < 0.05 donc H0 est rejeté.
# Il y a une différence significative entre 2001 et 2003. La richesse spécifique de 2003 est plus évolué que celle de 2001

# Observation de la distribution des données rs1 et rs3

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

# vérification de l'égalité des variances pour application d'un test paramétrique

var.test(log(birds$rs1), log(birds$rs3))

# pvalue > 5%, on accepte H0 donc l'égalité des variance, on peut faire un 
#test paramétrique de comparaison des deux moyennes sur les logarithmes

t.test(log(birds$rs1), log(birds$rs3), paired = T, var.equal = T)

# pvalue < 5% donc on rejette H0 

par(mfrow=c(1,1))

boxplot(birds$rs1, birds$rs3, names = c("2001","2003"), ylab ="Richesse spécifique", main= "la richesse spécifique par année", col =c( "skyblue","grey"))
points(1,mean(birds$rs1),pch=23,col="tomato")
points(2,mean(birds$rs3),pch=15, col="orange")

# Il manque le résultat de la comparaison de la comparaison de moyenne 

text(locator(1),"a")
text(locator(1),"b")
text(locator(1),"p=0.00028")

# Exercice 2

# Ces données confirment-elles l'hypothèse d'une réduction du domaine vital de l'élan durant la période hivernale ?

# Echantillon appariés 
dim(elan) # petits échantillons

# H0: il n'y a pas de différence significative entre les deux périodes 
# H1: il y a une différence significative entre les deux périodes

shapiro.test(elan$Hiver)

# pvalue > 0.05 donc normalité

shapiro.test(elan$Printemps)

# pvalue > 0.05 donc normalité

# vérifions l'égalité des variances

var.test(elan$Hiver, elan$Printemps)

# pvalue < 0.05 donc H1 : il y a une différence entre les variances

t.test(elan$Hiver, elan$Printemps, var.equal =F, paired = T, alt="less")

# pvalue < 0.05 donc on rejette H0 : il y a une différence significative il y a une diminution du domaine vital selon la saison

boxplot(elan$Hiver, elan$Printemps, main = "Domaine vital", ylab = "taille domaine vital de l'élan (ha)", names =c("hiver","printemps"), col=c("skyblue","beige"))

points(1,mean(elan$Hiver), pch=17, col="yellow")
points(2,mean(elan$Printemps), pch=17, col="grey")
text(locator(1),"a")
text(locator(1),"b")
text(locator(1), "p=0.00364")

# Exercice 3

# Existe t-il une différence significative de poids entre les mâles et les femelles

# Echantillons indépendants

dim(toads)# petits échantillons

male <- subset(toads, sexe =="m")$poids

femelle <- subset(toads, sexe =="f")$poids


# H0: il n'y a pas de différence significative de poids entre les mâle et les femelles 
# H1: il y a une différence significative de poids entre les mâles et les femelles

shapiro.test(male)

# pvalue >0.05 donc normalité

shapiro.test(femelle)

#pvalue >0.05 donc normalité

var.test(male, femelle)

# pvalue < 0.05 donc H1 : il y a une différence significative entre les deux périodes

t.test(male, femelle, var.equal =T, paired = F)

#pvalue > 0.05 donc H0, il n'y a pas de valeurs significatives de poids entre les mâles et les femelles donc normalement pas de graph

boxplot(male, femelle, main = "Représentation graphique", ylab = "poids", names =c("mâle", "femelle"), col=c("skyblue","grey"))

points(1,mean(male), pch=16, col="pink")
points(2,mean(femelle), pch=16, col="violet")

# Exercice 4

fish <-read.table("pesticides.txt", sep="\t", header =T)

A2 <- subset(fish, age =="2ans")$pesticides
B2 <- subset(fish, age =="ax")$pesticides
0.204 -> moy

# Question 1

shapiro.test(A2)

# pvalue < 0.05 donc H0 est rejeté, la variable n'est pas normale
# vérifions si le log de la distribution suit une loi normale

shapiro.test(log(A2))

# pvalue < 0.05 donc H0 est rejeté, le logarithme de la distribution de suit pas unne loi normale
# test non paramétrique pour comparer une distribution à une moyenne connue

wilcox.test(A2, mu=moy, paired = F, alt="two.sided")

# pvalue > 0.05 donc H0 est accepté, il n'y a pas de différence significative la moyenne pour les poissons de 2 ans et la moyenne nationale

# Question 2

mean(A2)
mean(B2)

# la moyenne des poissons de 2 ans du Lac A est à priori plus grande que celle du Lac B

# Question 3

# Pas besoin de tester la normalité des poissons du Lac B car ceux du Lac A n'ont pas une distribution normale (voir Question 1)
# test non paramétrique pour 2 échantillons indépendants car ce sont deux lacs différents

wilcox.test(B2,A2, alt="less")

# pvalue > 0.05 donc H0 n'est pas acceptée et il n'y a pas d'infériorité, la moyenne de ax n'est pas différente de la moyenne de 2 ans

# Question 4

A4 <- subset(fish, age=="4ans")$pesticides
shapiro.test(A4)

# pvalue > 0.05, donc H0 est accepté donc A4 suit une loi normale

t.test(A4, mu=moy)

# pvalue < 0.05 donc H0 est rejeté et la concentration moyenne en pesticides des poissons de 4 ans du Lac A est significativement plus grande que la moyenne nationale.

# Question 5

shapiro.test(B2)

# pvalue > 0.05 donc H0 est accepté, B2 suit une loi normale

t.test(A4, B2)

# pvalue < 0.05 donc H0 est rejeté, il y a une différence significative entre les poissons de 4 ans du lac A et les poissons du lac B

# Exercice 5

mais2 <- mais[,c("Hauteur","Masse","Parcelle","Hauteur.J7")]
mais3 <- mais2[-c(1,32,65),]
na.omit(mais2) -> mais3
mais3

plot(mais3$Hauteur,mais3$Masse,xlim=c(100,400), ylim=c(1000,3000), xlab="hauteur", ylab="masse", pch=16, col="skyblue")

N <- subset(mais3, Parcelle=="Nord")$Masse
S <- subset(mais3, Parcelle=="Sud")$Masse


shapiro.test(S)

# pvalue > 0.05 donc H0 est accepté, la parcelle Sud  suit une loi normale

shapiro.test(N)

# pvalue > 0.05 donc H0 est accepté, la parcelle Nord suit une loi normale

var.test(S,N)
t.test(N,S)

# pvalue > 0.05 donc H0 est accepté, il n'y a donc pas de différence entre la moyenne des masses des pieds de mais des parcelles Nord et Sud

boxplot(N,S, main = "Moyenne des masses des pieds de mais des parcelles Nord et Sud", col= c("skyblue","grey"), names = c("N","S"))
points(2,mean(S), pch=16, col="violet")
points(1,mean(N), pch=16, col="tomato")

# Question 5

Hn <- subset(mais3, Parcelle=="Nord")$Hauteur
Ho <- subset(mais3, Parcelle=="Ouest")$Hauteur
shapiro.test(Hn)

# pvalue > 0.05 donc H0 est accepté

shapiro.test(Ho)

# pvalue > 0.05 donc H0 est accepté

var.test(Ho,Hn)

# pvalue > 0.05 donc Homoscédasticité est accepté

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

# Test de normalité

shapiro.test(H)

# pvalue > 0.05 donc H0 est accepté, l'objet H suit une loi normale

shapiro.test(HJ7)

# pvalue > 0.05 donc H0 est accepté, l'objet HJ7 suit une loi normale

var.test(H,HJ7)

# pvalue > 0.05 donc homoscédasticité des valeurs

t.test(H,HJ7, var.equal = T, paired = T)

# pvalue > 0.05 donc H0 est accepté, absence de différence significative entre la hauteur et la hauteur 7 jours après

# Exercice 6

boxplot(ogm$foie~ogm$ogm, main = "Taille du foie en fonction de la quantité d'ogm", xlab = "pourcentage d'ogm", ylab = "taille du foie", col = c("skyblue", "grey", "tomato", "violet"))
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

# Homoscédasticité

var.test(g11f,g0f)

# pvalue > 0.05 donc il y a égalité des variances

t.test(g0f,g11f, var.equal = T)

# pvalue > 0.05 donc H0 est acepté, absence de différence entre les foies à 0% d'ogm et les foies à 11% d'ogm

var.test(g0f, g22f)

# pvalue > 0.05 donc il n'y a pas égalité des variances

t.test(g0f,g22f, var.equal = F)

# pvalue > 0.05 donc H0 est accepté, absence de différence entre les foies à 0% d'ogm et les foies à 22% d'ogm
# sachant que g33f ne suit pas une loi normale : wilcox.test

wilcox.test(g0f, g33f,paired = F)

# pvalue < 0.05 don H0 est refusé, il y a une différence significative entre les rats à 0% et les rats à 33% d'ogm

