if Config.Language ~= 'fr' then return end

Locales = {
    ['UNKNOWN'] = 'Inconnu',
    ['SPEED_LIMIT_MESSAGE'] = 'Vous roulez trop vite ! La limite de vitesse dans la zone %s est de %s km/h. Votre vitesse actuelle est de %s km/h. vous avez reçu une amende de %s €', -- Dont remove any %s from the message
    ['YOU_LEFT'] = 'Vous avez quitté',
    ['ENTERING_IN_ZONE'] = 'Vous entrez dans la zone %s. La limite de vitesse est %s km/h.',
    -- FRONT END
    ['YOU_SCAPED_FROM_JAIL'] = 'You Scaped From Jail The police has adviced',
    ['CONFIRM_EDIT'] = 'Valider la position',
    ['NO_DISPATCH_CALLS'] = 'AUCUN APPEL',
    ['MESSAGE'] = 'Message',
    ['NOTHING'] = 'Rien...',
    ['NOT_ASIGNED'] = 'NON ATTRIBUÉ',
    ['ACCEPT_KEY_SMALL'] = 'Accepter [G]',
    ['CANCEL_KEY_SMALL'] = 'Annuler [G]',
    ['SETTINGS'] = 'Paramètres',
    ['PLAYERS'] = 'Unités',
    ['DELETE'] = 'Supprimer',
    ['DELETE_ALL'] = 'Supprimer tout',
    ['RESPOND'] = 'Répondre',
    ['MARK_YOUR_CURENT_LOCATION'] = 'Marquez votre 10-20 actuel',
    ['MDT'] = 'MDT',
    ['CLOSE_SESSION'] = 'Fermer la session',
    ['FIND_PEOPLE'] = 'Trouver des gens',
    ['NAME'] = 'Prénom',
    ['LAST_NAME'] = 'Nom de famille',
    ['FIND'] = 'Trouver',
    ['FIND_PLATE'] = 'Trouver la plaque',
    ['SEARCH_RESULTS'] = 'Résultats de recherche',
    ['AGE'] = 'Âge',
    ['SEX'] = 'Sexe',
    ['ACTIONS'] = 'Actions',
    ['SEE_DETAILS'] = 'Voir les détails',
    ['PHONE'] = 'Numéro de téléphone',
    ['NOTES'] = 'Remarques',
    ['LOREM_IPSUM_TEXT'] = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in magna eu ipsum aliquet pulvinar eget eu risus.',
    ['UPDATE_IMAGE'] = 'Mettre à jour l\'image',
    ['PERSON_DETAILS'] = 'Détails de la personne',
    ['VEHICLE_DETAILS'] = 'Les détails du véhicule',
    ['VIEW_DETAILS'] = 'Voir les détails',
    ['PLATE'] = "Plaque",
    ['MODEL'] = "Modèle",
    ['TYPE'] = "Type",
    ['MDT_LOADED'] = 'Succès : le MDT a été entièrement chargé.',
    ['SEARCH_ERROR'] = 'Erreur : Il y a eu un problème avec la demande, il semble que ce que vous recherchez n\'existe pas.',
    ['SEARCH_SUCCESS'] = 'Succès : la demande a été effectuée avec succès.',
    ['DATE'] = 'Date',
    ['BY'] = 'Par',
    ['ZONE'] = 'Zone',
    ['HISTORY_TITLE_VEHICLE'] = 'Rédigez le paragraphe Historique',
    ['ADD_NEW'] = 'Ajouter un nouveau',
    ['SEND'] = 'Envoyer',
    ['SEND_VEH_H'] = 'Envoyer l\'entrée du véhicule',
    ['TEXT_TOO_LONG'] = "LE TEXTE EST TRÈS LONG VEUILLEZ LE RÉDUIRE",
    ['NOTES_OF_THE_PERSON'] = "Notes de la personne",
    ['TEXT_TO_NOTE'] = "Texte à noter",
    ['TEXT_IMAGE_URL'] = "Image URL",
    ['SET_CALLSIGN'] = "Définir l'indicatif",
    ['AUTO_REMOVE_MINUTES_EDIT'] = "Minutes pour supprimer automatiquement les appels :",
    ['SAVE_CALLSIGN'] = "Enregistrer l'indicatif",
    ['TOGGLE_RADAR'] = "Basculer le radar",
    ['VIEW_BILLS'] = "Afficher les factures",
    ['AUTHOR_NAME'] = 'Nom de l\'auteur',
    ['TIMESTAMP'] = 'Horodatage',
    ['STATUS'] = 'Status',
    ['ITEM'] = 'Item',
    ['CANCEL_CALL'] = 'Annuler l\'appel',
    ['ACCEPT_CALL'] = 'Accepter l\'appel',
    ['POLICE_COOLDOWN'] = 'Vous ne pouvez pas envoyer plus de notifications de police, veuillez réessayer plus tard (RÉCUPÉRATION DE COMMANDE)',
    ['AMBULANCE_COOLDOWN'] = 'Vous ne pouvez pas envoyer plus de notifications EMS, veuillez réessayer plus tard (RÉCUPÉRATION DE COMMANDE)',
    ['MECHANIC_COOLDOWN'] = 'Vous ne pouvez pas envoyer plus de notifications de mécanicien, veuillez réessayer plus tard (RÉCUPÉRATION DE COMMANDE)',
    ['PANIC_COOLDOWN'] = 'Vous ne pouvez pas envoyer plus de notifications de panique, veuillez réessayer plus tard (RÉCUPÉRATION DE COMMANDE)',
    ['CALLS'] = 'Appels',
    ['COLLEGUES'] = 'Collègues',
    ['SLOW_DOWN'] = 'Attendez, pas si vite !',
    ['MALE'] = 'Homme',
    ['FEMALE'] = 'Femme',
    ['ENTER_HISTORY'] = 'Entrer dans l\'historique',
    ['LOADING'] = 'Chargement...',
    ['TOGGLE_USE_MPH'] = 'Utiliser Mph',
    ['RESET_CONFIG'] = 'Réinitialiser la configuration Nui.',

    ['DISPATCH_TITLE'] = "DISPATCH",
    ['TITLE'] = "Titre",
    ['CANCEL_CALL_CURRENT'] = "Annuler l\'appel en cours",
    ['SAVE'] = "Sauvegarder",
    ['CREATING_DATA'] = "Création de données",
    ['TITLE_OF_THE_DATA'] = "Titre des données",
    ['ENTER_TITLE'] = "Entrez le titre",
    ['ENTER_VALUE'] = "Entrez la valeur",
    ['ADD_ITEM'] = "Ajouter un item",
    ['ADD_LIST'] = "Ajouter la liste",
    ['MORE_DETAILS'] = "Plus de détails",
    ['DATA_MUST_BE_LESS_THAN_20000'] = 'Les données ne peuvent pas dépasser 20000 caractères au total',
    ['TITLE_MUST_BE_LESS_THAN_40'] = 'Le titre ne peut pas dépasser 40 caractères',
    ['TITLE_CANT_HAVE_LESS_THAN_3'] = 'Le titre ne peut pas avoir moins de 3 caractères',
    ['DATA_CANT_HAVE_LESS_THAN_3'] = 'Les données ne peuvent pas avoir moins de 3 caractères',
    ['CANT_HAVE_EMPTY_LIST'] = 'Les listes vides ne sont pas autorisées',
    ['CANT_GET_VEH_PLATE'] = 'Impossible d\'obtenir la plaque d\'immatriculation du véhicule',
    ['ERROR_CREATING_DATA'] = 'Erreur lors de la création des données',
    ['CANT_GET_PLAYER_IDENTIFIER'] = 'Impossible d\'obtenir l\'identifiant du joueur',
    ['VIEW_BODY_CAM'] = 'Voir la caméra corporelle',
    ['CANOT_USE_BODYCAM_YOUR_NOT_IN_ZONE'] = 'Impossible d\'utiliser la caméra corporelle, vous n\'êtes pas dans la zone de liste blanche pour afficher les caméras corporelles',
    ['ENTERING_BODYCAM_ZONE'] = "Vous entrez dans une zone pour utiliser la visionneuse de caméra(s) corporelle(s)",
    ['EXITING_BODYCAM_ZONE'] = "Vous quittez une zone pour utiliser la visionneuse de caméra(s) corporelle(s)",
    ['DEPARTMENT_NAME'] = "Los Santos Police Department",
    ['OPTIONS'] = "Options",
    ['CLOSETS_CITIZEN'] = 'Citoyen(ne) à proximité',
    ['PENAL_CODE'] = 'Code pénal',
    ['ADD_CHARGES'] = 'Ajouter des frais',
    ['TIME_IS_UP'] = 'Le temps est écoulé, attendez un instant, les officiers viennent vers vous !',
    ['TIME_TO_OUT'] = 'Temps avant de sortir: ',
    ['FINE'] = 'Ammende',
    ['JAIL_TIME'] = 'Temps de prison',

    ['ENTER_IN_JAIL_TITLE'] = 'Vous avez été arrêté par le LSPD',
    ['ENTER_IN_JAIL_DESCRIPT'] = 'Purgez votre peine et vous serez libre !',
    ['EXIT_FROM_JAIL_TITLE'] = 'Vous avez été libéré par le LSPD',
    ['EXIT_FROM_JAIL_DESCRIPT'] = 'Vous êtes libre de partir!',

    ['NO_CLOSETS_CITIZEN'] = 'Pas de citoyen(ne) à proximité(e)',
    ['SEND_NEAR_TO_JAIL'] = 'Pour envoyer les citoyen(ne) à proximité(e) en prison',

    ['DAY'] = 'jour',
    ['DAYS'] = 'jours',
    ['HOUR'] = 'heure',
    ['HOURS'] = 'heure(s)',
    ['MINUTE'] = 'minute',
    ['MINUTES'] = 'minutes',
    ['SECOND'] = 'seconde',
    ['SECONDS'] = 'secondes',

    ['STARTED_AT'] = 'Commencé à: ',
    ['END_AT'] = 'Terminé à:',
    ['REMOVE_FROM_JAIL'] = 'Retirer de prison',
    ['ONLY_FRONT_RADAR'] = 'Uniquement le radar avant',

    ['SOMETHING_IS_MISSING'] = "Something's missing.",
    ['CANT_SEARCH_TEXT'] = "Sorry, we can't find that page. You'll find lots to explore the other players. ",
    
    -- IMAGES
    ['POLICE_LOGO_URL'] = "https://cdn.discordapp.com/attachments/922342042082902026/1097030789750853833/LSPD.webp"
}