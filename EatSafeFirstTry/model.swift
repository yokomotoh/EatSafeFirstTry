//
//  model.swift
//  EatSafeFirstTry
//
//  Created by vincent schmitt on 05/11/2020.
//

import Foundation

struct DateFormatYoko {
    var jour: Int = 1
    var mois: Int = 1
    var anne: Int = 1900
}

/*
struct ChallengeDeJour{
    var nomDuChallengeDeJour: String = "fruits rouges"
    var dateDuChallengerDeJour: Date
    var ingredientsDuChallenge: [IngredientDuJour] = []
    var collectionDeChallenge : [Recette] = []
} */ // version Yoko removed by Yoko 9/11/2020

struct ChallengeDeJour: Identifiable {
    let id = UUID() //Yoko added 13/11/20
    var nomDuChallenge: String = "fruits rouges"
    var listIngredients: [Ingredient] = []
    var collectionDeChallenge : [Recette] = []
    var imageDuChallenge: String = "fruitrouge" //by Laura 9/11/2020
   //by Yoko 12/11/2020
}  // by Saqueto 9/11/2020

/*
 struct IngredientDuJour {
    var nomIngredientDuJour: String = "pomme"
    var nutritionIngredient: String = "vitamin C rich"
} // added by Yoko
*/ // removed by Yoko 9/11/2020

struct Recette: Identifiable {
    let id = UUID() //Yoko
    var nomRecette: String
    var utilisateur: Profile
    var dateRecette: DateFormatYoko
    var like: Int
    var commentaires: [Commentaire]
    var photoChallenge: String //ImagePhoto
    //changed by Yoko
    var ingredientsChallenger: [Ingredient]
    var recette: String = "cut and mix"
}

struct Ingredient: Identifiable{
    let id = UUID()
    var nomIngredient: String = "pomme"
    var quantiteIngredient: Int = 1
    var unitIngredient: String = "pommes"
    var nutritionIngredient: String = "vitamin C"
    var detailIngredient: String = ""
}

struct Profile {
    var userName: String = "username"
    var nom: String = "Nom"
    var prenom: String = "Prenom"
    var Ne: DateFormatYoko
    var email: String = "aaa@bbb.b"
    var photoProfile: String //ImagePhoto //change by Yoko
    //added by Yoko 10/11/2020
    var description: String = "Apprenti cuisinier 👨🏻‍🍳"
    var NumOfPosts: Int = 0
    var NumAbonne: Int = 0
}

struct Commentaire: Identifiable {
    let id = UUID()
    var profileCommentaire: Profile
    var dateCommentaire: DateFormatYoko
    var commentaire: String
}

/*
struct ImagePhoto { //change by Yoko
    var dataImage: String
}
*/

/*struct ingredientDeJour: Identifiable { // Yoko modified 12/11/2020
    let id = UUID()
    var nomIngredient : String
    var detailIngredient : String
    var imageIngredient: String = "banana"
} // Saqueto uses 9/11/2020*/


/* Profile  */

let yokoM: Profile = Profile(userName: "Yoko M", nom: "Motohama", prenom: "Yoko", Ne: DateFormatYoko(jour: 03, mois: 10, anne: 2000), email: "aaa@bbb", photoProfile:  "imageYoko", description: "maman de deux ados 💃", NumOfPosts: 0, NumAbonne: 0)

let lauraD: Profile = Profile(userName: "Laura D", nom: "Desjacques", prenom: "Laura", Ne: DateFormatYoko(jour: 05, mois: 05, anne: 2001), email: "ddd@eee", photoProfile:  "imageLaura", description: "j'aime manger! 🍼", NumOfPosts: 0, NumAbonne: 0)

let saquetoH: Profile = Profile(userName: "Saqueto H", nom: "Saqueto", prenom: "Heitor", Ne: DateFormatYoko(jour: 23, mois: 11 , anne: 1998), email: "saqueto@qqq.qq", photoProfile:  "imageSaqueto", description: "Hadoken💪", NumOfPosts: 0, NumAbonne: 0)

let billgates: Profile = Profile(userName: "Bill G", nom: "Gates", prenom: "Bill", Ne: DateFormatYoko(jour: 24, mois: 12, anne: 1979), email: "gates@gmail.com", photoProfile:  "imageBillGates", description: "lacoste🐊", NumOfPosts: 0, NumAbonne: 0)

let juanjoA: Profile = Profile(userName: "Juanjo A", nom: "And", prenom: "Juanjo", Ne: DateFormatYoko(jour: 24, mois: 12, anne: 1979), email: "juanjoa@gmail.com", photoProfile:  "plate7", description: "Grand cuisinier 👨🏻‍🍳", NumOfPosts: 0, NumAbonne: 0)

let nourhen: Profile = Profile(userName: "Nourhen", nom: "Nourhen", prenom: "Nourhen", Ne: DateFormatYoko(jour: 24, mois: 12, anne: 1979), email: "nourhen@gmail.com", photoProfile:  "plate1", description: "je bois 1 litre de l'eau🚰", NumOfPosts: 0, NumAbonne: 0)

/* Recette */
/*laura a modifié Recette*/

var tarteTatin: Recette = Recette(nomRecette: "Tarte Tatin", utilisateur: yokoM, dateRecette: DateFormatYoko(jour: 02, mois: 11, anne: 2020), like: 10, commentaires: [commentSaquetoTarteTatin, commentLauraTarteTatin], photoChallenge:  "imageTarteTatin", ingredientsChallenger: [pomme,sugar,butter,patebrise,citron], recette: "Couper les pommes en quartiers. \n Les disposer dans un moule beurré. \n Saupoudrer de sucre et recouvrir avec la pate brisée. \n Cuire la tarte 40 min à 180°C.\n Une fois que la tarte est froide la retourner delicatement.  ")

var pastaBolognese: Recette = Recette(nomRecette: "Spaghetti à la  Bolognese", utilisateur: lauraD, dateRecette: DateFormatYoko(jour: 01, mois: 11, anne: 2020), like: 20, commentaires: [], photoChallenge:  "imagePastaBolognese", ingredientsChallenger: [pate,tomate,butter,parmesan,viande,oignon,celeri,carotte,ail,sel,poivre], recette: "Cuire les pates 7 min dans l'eau bouillante salée. \n Faire suer l'oignon et l'ail hachés avec le beurre. \n Ajouter la viande hachée. \n Assaisonner sel et poivre. \n Mélanger le tout. \n Puis au moment de servir ajouter le parmesan rapé.")

var gratinDauphinois: Recette = Recette(nomRecette: "Gratin Dauphinois", utilisateur: yokoM, dateRecette: DateFormatYoko(jour: 03, mois: 11, anne: 2020), like: 3, commentaires: [], photoChallenge:  "imageGratinDauphinois", ingredientsChallenger: [pommeDeTerre,ail,sel,poivre,creme,butter], recette: "Couper les pommes de terres en lamelles. \n Les disposer dans un plat beurré.\n Ajouter la crème, l'ail, le sel et le poivre.\n Cuire 45 min à 175°C.")

var saladLentilles: Recette = Recette(nomRecette: "Salade de Lentilles", utilisateur: saquetoH, dateRecette: DateFormatYoko(jour: 04, mois: 11, anne: 2020), like: 0, commentaires: [commentLauraSaladLentilles], photoChallenge:  "imageSaladLentilles", ingredientsChallenger: [lentille,bouquetGarni,carotte,ail,sel,poivre,oignon,celeri], recette: "Tremper les lentilles 2h avant. \n Emincer les carottes et l'oignon. \n Cuire les lentilles à feu doux 1h30 avec le bouquet garni, les carottes, l'oignon et l'ail. \n Salé le tout en fin de cuisson.")

var clafoutis: Recette = Recette(nomRecette: "Clafoutis aux cerises", utilisateur: billgates, dateRecette: DateFormatYoko(jour: 24, mois: 1, anne: 2000), like: 766, commentaires: [commentJuanjoClafoutis], photoChallenge:  "clafoutis", ingredientsChallenger: [butter,oeuf,lait,farine,sugar,cerises])

var parisBrest : Recette = Recette(nomRecette: "Paris Brest", utilisateur: billgates, dateRecette: DateFormatYoko(jour: 12, mois: 4, anne: 2005), like: 344, commentaires: [commentNourhenParisBrest, commentSaquetoParisBrest], photoChallenge:  "paris brest", ingredientsChallenger: [lait,butter,maizena,praline,oeuf,sugar])

var tarteCitronMeringuee : Recette = Recette(nomRecette: "Tarte citron meringuée", utilisateur: billgates, dateRecette: DateFormatYoko(jour: 5, mois: 11, anne: 2003), like: 112, commentaires: [], photoChallenge:  "tarte citron meringuee", ingredientsChallenger: [lait,butter,sugar,citron,patebrise,maizena,oeuf])

var saladeDeFruit : Recette = Recette(nomRecette: "Salade de fruits", utilisateur: billgates, dateRecette: DateFormatYoko(jour: 12, mois: 7, anne: 2001), like: 45, commentaires: [], photoChallenge:  "salade de fruits", ingredientsChallenger: [fraise,citron,cerises])

/* added Saqueto 9/11/2020 */
var millefeuille : Recette = Recette(nomRecette: "Millefeuille", utilisateur: billgates, dateRecette: DateFormatYoko(jour: 27, mois: 1, anne: 2009), like: 176, commentaires: [], photoChallenge:  "millefeuille", ingredientsChallenger: [lait,butter,sugar,pateFeuillete,chocolat])

var fondantChocolat: Recette = Recette(nomRecette: "Fondant au Chocolat", utilisateur: billgates, dateRecette: DateFormatYoko(jour: 5, mois: 11, anne: 2020), like: 666, commentaires: [], photoChallenge: "fondant choco", ingredientsChallenger: [lait,oeuf,farine,sugar,butter,chocolat])

/* yoko added 13/11/20*/

var sautedebrocoli: Recette = Recette(nomRecette: "Sauté de brocoli", utilisateur: saquetoH, dateRecette: DateFormatYoko(jour: 11, mois: 11, anne: 2020), like: 3459, commentaires: [commentBillgatesSautedebrocoli], photoChallenge: "Saute de brocoli", ingredientsChallenger: [ail,sel,brocoli])

var auberginesFarciesVegetariennes: Recette = Recette(nomRecette: "Aubergines farcies végétariennes", utilisateur: saquetoH, dateRecette: DateFormatYoko(jour: 14, mois: 11, anne: 2020), like: 2987, commentaires: [commentSaquetoTarteTatin, commentLauraSaladLentilles], photoChallenge: "Aubergines farcies végétariennes", ingredientsChallenger: [aubergine, tomate, ail,oignon], recette: "Rincez l'aubergine et les tomates. Coupez l'aubergine en 2 dans la longueur et récupérez le plus de chair possible à l'aide d'une cuillère sans percer la peau. Coupez la chair obtenue en morceaux pas trop gros.")

var petitDejeunerHealthy: Recette = Recette(nomRecette: "Petit déjeuner healthy", utilisateur: lauraD, dateRecette: DateFormatYoko(jour: 14, mois: 11, anne: 2020), like: 5000, commentaires: [commentSaquetoTarteTatin, commentLauraSaladLentilles, commentJuanjoClafoutis, commentNourhenParisBrest], photoChallenge: "plate4", ingredientsChallenger: [fraise, banane, myrtille, lait], recette: "Dans un bol, disposez le yaourt à la grecque avec le coulis de confiture de fraise aux graines de chia. Découpez-la bananes en rondelles. Disposez-le granola par dessus.")

var curryVegetarienDeButternut: Recette = Recette(nomRecette: "Curry végétarien de butternut", utilisateur: saquetoH, dateRecette: DateFormatYoko(jour: 15, mois: 11, anne: 2020), like: 4876, commentaires: [commentLauraSaladLentilles, commentBillgatesSautedebrocoli], photoChallenge: "Curry végétarien de butternut", ingredientsChallenger: [butternut, riz, poisChiches, tomate, oignon, ail], recette: "Faire chauffer l'huile d'olive dans une cocotte. Eplucher puis émincer l'oignon. Couper très finement les gousses d'ail. Les faire revenir dans la cocotte pendant 5 mn. Ils ne doivent pas colorer.Ajouter la pâte de curry bien mélanger. Ajouter la chair de butternut coupée en petits cubes. Bien mélanger.Ajouter ensuite la pulpe de tomate. Mélanger et faire mijoter pendant 15 mn. Ajouter ensuite le lait de coco et mettre sur feu moyen. Faire cuire pendant 15 mn. Vérifier que la courge est bien cuite à l'aide de la pointe d'un couteau (la pointe doit rentrer facilement dans la courge. Ajouter alors les pois-chiches. Prolonger la cuisson de 5 minutes. Rectifier en sel. Ôter la cocotte du feu et ajouter les pousses d\'épinards. Mélanger (la chaleur va les faire cuire). Dresser le curry dans les assiettes et parsemer de coriandre.")

var tarteletteVeganPommeKiwi: Recette = Recette(nomRecette: "Tartelette vegan pomme kiwi", utilisateur: saquetoH, dateRecette: DateFormatYoko(jour: 15, mois: 11, anne: 2020), like: 2098, commentaires: [commentBillgatesSautedebrocoli], photoChallenge: "Tartelette vegan pomme kiwi", ingredientsChallenger: [pomme, kiwi, farine, citron, myrtille], recette: "Préchauffez le four à 160 degrés. Faites fondre l’huile de coco. Dans un Blender versez les ingrédients secs et mixez rapidement. Ajoutez le reste des ingrédients pour la pâte et mixez en procédant par impulsions pour obtenir une pâte granuleuse. Elle ne se tient pas en pâton, c’est normal. Versez l’équivalent d’une cuillère à soupe bombée de pâte dans les alvéoles d’une plaque de moules à muffins préalablement huilées et tassez bien avec le pouce en remontant sur les bords. Cette opération doit être réalisée méticuleusement pour obtenir des fonds de tartes homogènes. Enfournez à mi-hauteur pendant 15 minutes en surveillant que les fonds de tartes ne colorent pas trop. À la sortie du four ils seront encore souples mais vont rapidement durcir en refroidissant. Laissez refroidir quelques minutes et démoulez délicatement sur une grille. Pelez et coupez la pomme et le kiwi. Mettez l’ensemble des ingrédients de la garniture dans un blender et mixez suffisamment longtemps pour obtenir une crème épaisse et lisse. Garnissez vos fonds de tartelettes, lissez et décorez de fruits frais de votre choix. Réservez au réfrigérateur au moins une heure avant de servir.")
/* yoko added end */
/* added saqueto end */

/* Ingredient de recette*/
/* laura a modifié et ajouté Ingredient de recette */
var pomme = Ingredient(nomIngredient: "pomme", quantiteIngredient: 3, unitIngredient: "pcs", nutritionIngredient: "Vitamin C rich", detailIngredient: "")

var fraise = Ingredient(nomIngredient: "Fraises", quantiteIngredient: 250, unitIngredient: "g")
var chocolat = Ingredient(nomIngredient: "Chocolat", quantiteIngredient: 50, unitIngredient: "g")
var pateFeuillete = Ingredient(nomIngredient: "Pâte Feuilletée", quantiteIngredient: 1, unitIngredient: "pc")
var cerises = Ingredient(nomIngredient:"cerises",quantiteIngredient: 200,unitIngredient: "g")

var sugar = Ingredient(nomIngredient: "Sucre", quantiteIngredient: 100, unitIngredient: "g", nutritionIngredient: "attention!")
var citron = Ingredient(nomIngredient: "citron", quantiteIngredient: 4, unitIngredient: "pcs")
var butter = Ingredient(nomIngredient: "Beurre", quantiteIngredient: 50, unitIngredient: "g", nutritionIngredient: "high calory")
var pommeDeTerre = Ingredient(nomIngredient: "Pomme de terre", quantiteIngredient: 4, unitIngredient: "pcs")
var oignon = Ingredient(nomIngredient:"oignon", quantiteIngredient: 1, unitIngredient:"pc")
var patebrise = Ingredient(nomIngredient:"Pâte brisée", quantiteIngredient: 1, unitIngredient: "pc")
var oeuf = Ingredient(nomIngredient: "Oeufs", quantiteIngredient: 3, unitIngredient:"pcs")
var lait = Ingredient(nomIngredient: "Lait", quantiteIngredient: 25, unitIngredient:"cl")
var farine = Ingredient(nomIngredient: "Farine", quantiteIngredient: 120, unitIngredient:"g")
var maizena = Ingredient(nomIngredient: "Maïzena", quantiteIngredient: 2, unitIngredient:"c à s")
var sel = Ingredient(nomIngredient: "Sel", quantiteIngredient: 1, unitIngredient:"pm" )
var poivre = Ingredient(nomIngredient: "Poivre", quantiteIngredient: 1, unitIngredient:"pm")
var ail = Ingredient(nomIngredient: "Ail", quantiteIngredient: 2, unitIngredient: "gousses" )
var bouquetGarni = Ingredient(nomIngredient: "Bouquet garni", quantiteIngredient: 1, unitIngredient: "pc")
var creme = Ingredient(nomIngredient: "Crème fluide", quantiteIngredient: 25, unitIngredient: "cl")
var lentille = Ingredient(nomIngredient:"Lentilles vertes", quantiteIngredient: 120, unitIngredient: "g")
var praline = Ingredient(nomIngredient: "Praliné",quantiteIngredient: 120, unitIngredient:"g" )
var carotte = Ingredient(nomIngredient: "carotte", quantiteIngredient: 1, unitIngredient: "pc")
var pate = Ingredient(nomIngredient: "Spaghetti", quantiteIngredient: 200, unitIngredient:"g" )
var tomate = Ingredient(nomIngredient:"Tomates", quantiteIngredient: 4, unitIngredient:"pcs" )
var parmesan = Ingredient(nomIngredient: "Parmesan", quantiteIngredient: 90, unitIngredient:"g")
var viande = Ingredient(nomIngredient:"Viande hachée", quantiteIngredient: 300, unitIngredient:"g")
var banane = Ingredient(nomIngredient: "banen", quantiteIngredient: 1, unitIngredient: "", nutritionIngredient: "")
/* laura a modifié et ajouté Ingredient de recette */
/* yoko added 13/nov/22 */
var brocoli = Ingredient(nomIngredient: "brocoli", quantiteIngredient: 500, unitIngredient: "g", nutritionIngredient: "Vitamin rich")
var celeri = Ingredient(nomIngredient: "celeri", quantiteIngredient: 100, unitIngredient: "g", nutritionIngredient: "vitamin and fiber rich")
var aubergine = Ingredient(nomIngredient: "aubergine", quantiteIngredient: 2, unitIngredient: "pcs", nutritionIngredient: "")
var myrtille = Ingredient(nomIngredient: "myrtille", quantiteIngredient: 100, unitIngredient: "g", nutritionIngredient: "vitamin rich")
var butternut = Ingredient(nomIngredient: "butternut", quantiteIngredient: 1, unitIngredient: "pcs", nutritionIngredient: "")
var riz = Ingredient(nomIngredient: "riz", quantiteIngredient: 500, unitIngredient: "g", nutritionIngredient: "")
var poisChiches = Ingredient(nomIngredient: "poisChiches", quantiteIngredient: 500, unitIngredient: "g", nutritionIngredient: "fiber and protein rich")
var kiwi = Ingredient(nomIngredient: "kiwi", quantiteIngredient: 2, unitIngredient: "pcs", nutritionIngredient: "")
var avocat = Ingredient(nomIngredient: "avocat", quantiteIngredient: 1, unitIngredient: "pcs", nutritionIngredient: "")
var framboise = Ingredient(nomIngredient: "framboise", quantiteIngredient: 100, unitIngredient: "g", nutritionIngredient: "")

/* yoko end*/
/* Commentaire */

let commentSaquetoTarteTatin = Commentaire(profileCommentaire: saquetoH, dateCommentaire: DateFormatYoko(jour: 03, mois: 11, anne: 2020), commentaire: "Yummy!")

let commentLauraTarteTatin = Commentaire(profileCommentaire: lauraD, dateCommentaire: DateFormatYoko(jour: 04, mois: 11, anne: 2020), commentaire: "je n'aimes pas ca.")

let commentLauraSaladLentilles = Commentaire(profileCommentaire: lauraD, dateCommentaire: DateFormatYoko(jour: 04, mois: 11, anne: 2020), commentaire: "Fantastique!")

let commentJuanjoClafoutis = Commentaire(profileCommentaire: juanjoA, dateCommentaire: DateFormatYoko(jour: 10, mois: 11, anne: 2020), commentaire: "je sais faire de mieux!")

let commentNourhenParisBrest = Commentaire(profileCommentaire: nourhen, dateCommentaire: DateFormatYoko(jour: 10, mois: 11, anne: 2020), commentaire: "Dangerous...")

let commentBillgatesSautedebrocoli = Commentaire(profileCommentaire: billgates, dateCommentaire: DateFormatYoko(jour: 12, mois: 11, anne: 2020), commentaire: "Je voudrais essayer ça!")

let commentSaquetoParisBrest = Commentaire(profileCommentaire: saquetoH, dateCommentaire: DateFormatYoko(jour: 14, mois: 11, anne: 2020), commentaire: "Essaie le challenge!")
/* ChallengeDeJour */

/*
var fruitsRouges : ChallengeDeJour = ChallengeDeJour(nomDuChallengeDeJour: "fruits rouges", dateDuChallengerDeJour: Date(jour: 01, mois: 11, anne: 2020), ingredientsDuChallenge: [pommeChallenge], collectionDeChallenge: [tarteTatin, saladeDeFruit])
*/ // version Yoko by Yoko 9/11/2020

/* ingredient de jour */
/*
var pommeChallenge = IngredientDuJour(nomIngredientDuJour: "pomme", nutritionIngredient: "rich in Vitamin C")
*/ // erased by Yoko 09/11/2020

/* List Profile*/

var listProfiles: [Profile] = [yokoM, lauraD, saquetoH, billgates, juanjoA, nourhen]

/* List Recette*/

var listRecettes: [Recette] =  [tarteTatin, saladLentilles, pastaBolognese, gratinDauphinois, clafoutis, parisBrest, tarteCitronMeringuee, saladeDeFruit, millefeuille, fondantChocolat, sautedebrocoli, auberginesFarciesVegetariennes, petitDejeunerHealthy, curryVegetarienDeButternut, tarteletteVeganPommeKiwi]

/* List Challenge de jour */

/*
var tableauChallengeDeJour: [ChallengeDeJour] = [fruitsRouges]
*/ // version Yoko by Yoko 9/11/2020



//-----------------------------------------------------------------------------
var legumeVert = ChallengeDeJour(nomDuChallenge: "Challenge vert", listIngredients: [infoArtichat,infoAsperge,infoBrocoli,infoCéleri,infoKiwi,infoAvocat], collectionDeChallenge:[], imageDuChallenge: "legumevert")

var legumeJaune = ChallengeDeJour(nomDuChallenge: "Challenge jaune", listIngredients: [infoAnanas,infoMelon,infoBanana,infoMangue,infoPapaya,infoPassion,infoCarotte,pomme], collectionDeChallenge: [], imageDuChallenge: "legumejaune")

var fruitRouge = ChallengeDeJour(nomDuChallenge: "Challenge rouge", listIngredients: [infoStrawberry, infoRaspberry, infoBetterave, cerises, pomme], collectionDeChallenge: [], imageDuChallenge: "fruitrouge")

var mure = ChallengeDeJour(nomDuChallenge: "Challenge bleue", listIngredients: [infoBlueberry,infoBlackberry,infoAubergine], collectionDeChallenge: [], imageDuChallenge: "mureetmyrtille")

var courge = ChallengeDeJour(nomDuChallenge: "Challenge courges", listIngredients: [infoPotiron,infoPotimarron,infoButternut,infoCitrouille], collectionDeChallenge: [], imageDuChallenge: "courge")

var tableauChallengeDeJour: [ChallengeDeJour] = [legumeVert, legumeJaune, fruitRouge, mure, courge]
/*   */

//-----added by Saquero 9/11/2020-----------------------------------------------------------------------

//======================================SAQUETO===============================================================
// - I add an array for use as ingredient information :By Saqueto=========================


var infoBanana: Ingredient = Ingredient(nomIngredient: "banane", detailIngredient: "Riche en vitamine B6 et C et en potassium, les bananes sont principalement composées de glucides. Les bananes non mûres peuvent contenir des quantités décentes d'amidon résistant, qui fonctionne comme des fibres, aide votre intestin et favorise une glycémie saine.")

var infoOrange: Ingredient = Ingredient(nomIngredient: "orange", detailIngredient: "Rich in Vitamin C Oranges are primarily made up of carbs and water. They’re also a good source of fiber, which may support digestive health.")

var infoKiwi: Ingredient = Ingredient(nomIngredient: "kiwi", detailIngredient: "vitamine C, vitamine K, vitamine E, acide folique et potassium On pense que la grande quantité de vitamine C et d’antioxydants contenus dans les kiwis peut en fait aider à traiter les personnes souffrant d’asthme. Une étude de 2000 a révélé qu'il y avait un effet bénéfique sur la fonction pulmonaire chez ceux qui consommaient régulièrement des fruits frais, y compris des kiwis. Les fruits frais comme le kiwi peuvent réduire la respiration sifflante chez les enfants sensibles .. Aide à la digestion, Renforce le système immunitaire, Réduit le risque d'autres problèmes de santé, Peut aider à gérer la pression artérielle, Protège contre la perte de vision")

var infoStrawberry: Ingredient = Ingredient(nomIngredient: "fraise", quantiteIngredient: 1, unitIngredient: "piece", nutritionIngredient: "(vitamin B9)", detailIngredient: "Les fraises sont une bonne source de vitamine C, de manganèse, de folate et de potassium. Ils contiennent de petites quantités de plusieurs autres vitamines et minéraux.")

var infoRaspberry: Ingredient = Ingredient(nomIngredient: "framboise",quantiteIngredient: 1, unitIngredient: "piece", detailIngredient: "Vitamine A, thiamine, riboflavine, vitamine B6, calcium et zinc Les framboises sont riches en antioxydants, des composés végétaux qui protègent contre les dommages cellulaires. Les antioxydants peuvent réduire votre risque de certaines maladies chroniques.")

var infoBlueberry: Ingredient = Ingredient(nomIngredient: "myrtille",quantiteIngredient: 1,unitIngredient: "piece", detailIngredient: "La myrtille est une baie très appréciée. Il est faible en calories mais riche en fibres, en vitamine C et en vitamine K. Il réduit les dommages à l'ADN, ce qui peut aider à protéger contre le vieillissement et le cancer.")

var infoBlackberry: Ingredient = Ingredient(nomIngredient: "mure",quantiteIngredient: 1,unitIngredient: "piece", detailIngredient: "La mûre fournit des minéraux variés (au total, 500 à 600 mg) : beaucoup de potassium (plus de 200 mg pour 100 g), ce qui est habituel dans les végétaux frais, et des quantités appréciables de calcium (36 mg, ce qui la place parmi les fruits qui en renferment le plus), de phosphore (32 mg) et de magnésium (17 mg).")



//=====================I ADD MORE INGREDIENTS FOR ALL CHALLENGES===============================
//========================LEGUME VERT ========   SAQUETO   ====================================
var infoArtichat: Ingredient = Ingredient(nomIngredient: "artichaud", detailIngredient: "L’artichaut est apprécié tant pour ses feuilles que pour son coeur au goût raffiné. Source élevée de fibres et de nombreuses vitamines, il possède un fort pouvoir antioxydant qui procurerait de nombreux bénéfices pour la santé. \n Plusieurs études épidémiologiques ont démontré qu’une consommation élevée de légumes et de fruits diminuait le risque de maladies cardiovasculaires de certains cancers et d’autres maladies chroniques.")

var infoAsperge: Ingredient = Ingredient(nomIngredient: "asperge", detailIngredient: "L’asperge est une excellente source de minéraux et d’acide folique (vitamine B9). Elle contient du potassium, du cuivre, du calcium, du fer et du phosphore. Elle est riche en fibres alimentaires insolubles et en vitamines (A, B1, B2, B6 et C). Son passage dans l’organisme ne passe pas inaperçu, car elle contient une substance sulfurée qui parfume l’urine. \n Aussi, l’asperge bénéficie à la fois d’un faible apport énergétique et d’une haute densité nutritionnelle. L’asperge contribue ainsi à équilibrer l’ensemble de l’alimentation.")

var infoAubergine: Ingredient = Ingredient(nomIngredient: "aubergine", detailIngredient: "L'aubergine est un légume qui cache sous sa peau violette, beaucoup d'antioxydants et des composés efficaces dans la réduction de la glycémie et du cholestérol. \n Antidiabète : les fibres et les polyphénols contenus dans l'aubergine, en empêchant partiellement l'action d'une enzyme digestive, diminuent l'index glycémique du repas et réduisent l'élévation de la glycémie sanguine.  \n L'aubergine fait partie des légumes qui doivent être cuits pour être bien digérés. \n")

var infoBetterave : Ingredient = Ingredient(nomIngredient: "betterave", detailIngredient: "La betterave rouge apporte des vitamines du groupe B, notamment de la vitamine B9 (acide folique ou folates) : une portion de 100 g couvre près de 7% de l'apport nutritionnel quotidien conseillé pour un adulte. Elle fournit également de la vitamine A, du béta-carotène (précurseur de la vitamine A) et de la vitamine C. \n La betterave se décline en plusieurs variétés : rouges, jaunes et blanches. La betterave rouge, la plus connue, a une couleur si prononcée qu’on en fait des colorants en industrie. La betterave blanche est notamment utilisée pour la fabrication de sucre; on la nomme d’ailleurs « betterave à sucre ».")

var infoBrocoli : Ingredient = Ingredient(nomIngredient: "brocoli", detailIngredient: "Le brocoli est un légume de la famille des crucifères. Il renferme beaucoup de vitamine C. Les composés bioactifs qu’il contient auraient des effets anticancer. Pour le déguster à son meilleur et en tirer un maximum de bénéfices, il vaut mieux le consommer cru ou légèrement cuit.")

var infoCarotte: Ingredient = Ingredient(nomIngredient: "carotte", detailIngredient: "La carotte, originaire d'Asie, est un des légumes les plus cultivés dans le monde. Sa couleur orange, très réputée, est du, à la présence de pigments, les caroténoïdes. Ce légume a une richesse particulière en béta carotène ou provitamine A qui lui confère de nombreux bienfaits pour la santé.  \n Par ailleurs, sa richesse en fibres joue un rôle important sur le bon fonctionnement du système digestif. Elle agit aussi bien en régulant le transit pour lutter contre la constipation que comme anti-diarrhéique, sous forme de soupe ou de purée, grâce au fort pouvoir de rétention d'eau de ses fibres (et notamment la pectine). Celles-ci contribuent également à une sensation de satiété plus précoce qui ajoutée à sa faible teneur en calories et son pouvoir anti-cholesterol, font de la carotte un allié minceur.")

var infoCéleri: Ingredient = Ingredient(nomIngredient: "celeri", detailIngredient: "Qu'il soit rave ou en branche, le céleri ne manque pas d'atouts nutritionnels. Reconnu comme étant diurétique, il est aussi l'un des aliments les moins caloriques qui soient. \n Autre atout : sa richesse en antioxydants. \n Le céleri apporte entre 15 et 18 % des besoins quotidiens en potassium. Ce minéral favorise l’élimination des toxines par les reins, il limite également la rétention d’eau et donc la formation de cellulite.")

//============================================================================================================== FRUIT ET LEGUME JAUNE  ======= SAQUETO =================================
//
var infoAnanas: Ingredient = Ingredient(nomIngredient: "ananas", detailIngredient: "L’ananas est riche en vitamine C et en manganèse, aux vertus anti-oxydantes et fournit en plus faibles proportions de nombreux autres micronutriments. La plupart des vertus pour la santé qui lui sont attribuées sont en lien avec son apport de bromélaïne, un complexe d’enzymes permettant notamment de digérer protéines et divers glucides. Pour profiter pleinement de ses bienfaits, il est préférable de le consommer cru. Sucré et juteux, il se prête à de multiples recettes, de l’apéritif au dessert.")

var infoMelon: Ingredient = Ingredient(nomIngredient: "melon", detailIngredient: "Source de provitamine A (ou carotène), de vitamine C (25 mg aux 100 g en moyenne), ainsi que de minéraux et de fibres, il est particulièrement riche en eau, et donc très désaltérant. Le melon est composé à près de 90 % d’eau.")

var infoMangue: Ingredient = Ingredient(nomIngredient: "mangue", detailIngredient: "La mangue est très bonne à consommer seule, tout simplement en la découpant, mais peut aussi être ajoutée à des recettes de smoothies, de salades, ou même dans des sauces pour des plats sucrés-salés. Il est conseillé de les acheter déjà mûres, et de ne choisir que les mangues fraîches, congelées ou séchées mais sans sucres ajoutés. \n La clé pour vraiment profiter des bienfaits de la mangue est d’en manger avec modération, et de consommer aussi d’autres fruits plus riches en fibres et moins sucrés au cours de la journée, tels que les agrumes, les pommes ou les baies, qui ont aussi beaucoup d’avantages nutritionnels.")

var infoCourge: Ingredient = Ingredient(nomIngredient: "courge", detailIngredient: "Peu caloriques, courges et potirons sont en revanche concentrés en micronutriments et particulièrement en béta-carotène.  Grâce à leur très faible teneur en lipides, on peut les consommer régulièrement. Le potiron est riche en vitamine A : 100 g de potiron cuit apportent l’équivalent de 42,71 % des Valeurs Nutritionnelles de Référence (VNR) en vitamine A. Cette dernière contribue notamment au bon équilibre de la peau, des muqueuses et de la vision ainsi qu’au fonctionnement du système immunitaire. \n Au fur et à mesure du temps de stockage, la teneur en vitamines de la chair augmente. Attention, cette variable est aussi valable pour le sucre.")

var infoPotiron: Ingredient = Ingredient(nomIngredient: "potiron", detailIngredient: "Peu caloriques, courges et potirons sont en revanche concentrés en micronutriments et particulièrement en béta-carotène.  Grâce à leur très faible teneur en lipides, on peut les consommer régulièrement. Le potiron est riche en vitamine A : 100 g de potiron cuit apportent l’équivalent de 42,71 % des Valeurs Nutritionnelles de Référence (VNR) en vitamine A. Cette dernière contribue notamment au bon équilibre de la peau, des muqueuses et de la vision ainsi qu’au fonctionnement du système immunitaire.")

var infoPapaya: Ingredient = Ingredient(nomIngredient: "papaye", detailIngredient: "Surnommée par Christophe Colomb « Le fruit des anges », la papaye est une véritable source de composés antioxydants, vitamines, minéraux, fibres solubles et insolubles. Ces nutriments protègent les neurones, favorisent la microcirculation du sang et stimulent la contraction des vaisseaux sanguins.\n Comme le thé vert, le jus de papaye renferme de la catéchine capable de réduire les risques d’athérosclérose et des maladies cardiovasculaires. Cet aliment soulage également de certaines inflammations chroniques comme l’asthme ou l’arthrite.")

var infoPassion: Ingredient = Ingredient(nomIngredient: "fruitpassion", detailIngredient: "Apprécié pour la variété et la diversification qu'il peut apporter dans nos desserts, le fruit de la passion est également intéressant pour ses apports nutritionnels. Le densité de l'alimentation en minéraux, en oligo-éléments et en vitamines peut aujourd'hui être considérée comme un des premiers critères de qualité. Or, le fruit de la passion peut participer utilement à la couverture de nos besoins en ces éléments. En effet, avec seulement 100 g net de fruit de la passion, on peut couvrir plus de 5 % de l'AJR* pour le cuivre et le zinc, 7 à 9 % de l'AJR* pour le magnésium, plus de 10 % de l'AJR* pour le manganèse. Et on assure 35 % de l'AJR* pour la vitamine C, et 12 % de l'AJR pour la vitamine B3.")

////========================== MURE ET MYRTILLES  ==================================================
// =========== DEFAULT..........
//// ===========================Challenge Courge ===============================================
//
var infoCitrouille: Ingredient = Ingredient(nomIngredient: "citrouille", detailIngredient: "Les courges sont des légumes bonnes pour la santé. En effet, elles sont riches en calcium, cuivre, zinc, mais également en magnésium et phosphore. De quoi faire le plein de vitamines grâce à des légumes qui se cuisinent aussi bien en ratatouille qu’en tarte ou potage. En plus de contribuer au bon fonctionnement du système immunitaire, les courges, mais surtout leurs graines, permettent de réduire les risques d’infection urinaire ou de constipation. Sans compter la réduction de stress et d’anxiété grâce à son apport en fer.")

var infoPotimarron: Ingredient = Ingredient(nomIngredient: "potimarron", detailIngredient:  "Les courges sont des légumes bonnes pour la santé. En effet, elles sont riches en calcium, cuivre, zinc, mais également en magnésium et phosphore. De quoi faire le plein de vitamines grâce à des légumes qui se cuisinent aussi bien en ratatouille qu’en tarte ou potage. En plus de contribuer au bon fonctionnement du système immunitaire, les courges, mais surtout leurs graines, permettent de réduire les risques d’infection urinaire ou de constipation. Sans compter la réduction de stress et d’anxiété grâce à son apport en fer.")

var infoButternut: Ingredient = Ingredient(nomIngredient: "butternut", detailIngredient: "La courge butternut, ou courge doubeurre en français, est une variété de courge musquée de la famille des cucurbitacées. Très riche en eau et de forme allongée, on retient sa douceur en bouche et son goût noisette. Naturellement crémeuse, elle a pour avantage de ne pas nécessiter de beurre ou de crème pour la cuisiner, ce qui en fait un allié minceur non négligeable.")

var infoAvocat: Ingredient = Ingredient(nomIngredient: "avocat", detailIngredient: "Riche en vitamines et en acides gras non saturés")

/*var TableauDetailIngredient: [ingredientDeJour] =   [infoBanana,infoOrange,infoKiwi,infoStrawberry,infoRaspberry,infoBlueberry,infoBlackberry]*/
//=========================================================================================================


/* actual user logged in */
var actualUserLoggedIn: Profile = billgates

/* today's date */
var dateToday: DateFormatYoko = DateFormatYoko(jour: 16, mois: 11, anne: 2020)

 
/* test create new recipe by yoko */
/*
var sushi: Recette = Recette(nomRecette: "Sushi", utilisateur: yokoM, dateRecette: dateToday, like: 0, commentaires: [], photoChallenge: "plate1", ingredientsChallenger: [riz, vinaigre], recette: "cook with string fire")
var riz: Ingredient = Ingredient(nomIngredient: "riz", quantiteIngredient: 100, unitIngredient: "gramme", nutritionIngredient: "high calorie")
var vinaigre: Ingredient = Ingredient(nomIngredient: "vinaigre", quantiteIngredient: 10, unitIngredient: "centilitre", nutritionIngredient: "acide")
*/


