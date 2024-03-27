let phoneMeta = ['phone', 'black_phone', 'yellow_phone', 'red_phone', 'green_phone']

function FormatItemInfo(itemData) {
    if (itemData != null && itemData.info != "") {
        let label = itemData?.info?.label || itemData?.label;
        if (itemData.info.showItemData) {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>" + tableToString(itemData.info) + "</p>");
            return
        }
        if (itemData.name == "id_card") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html(
                "<p><strong>CSN: </strong><span>" +
                (itemData.info.citizenid !== undefined ? itemData.info.citizenid : 'ID-Card ' + Math.floor(Math.random() * 99999)) +
                "</span></p><p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
                "</span></p><p><strong>Gender: </strong><span>" +
                (itemData.info.gender !== undefined ? itemData.info.gender : 'AH-64 Apache Helicopter') +
                "</span></p><p><strong>Nationality: </strong><span>" +
                (itemData.info.nationality !== undefined ? itemData.info.nationality : 'No information') +
                "</span></p>"
            );
        } else if (phoneMeta.includes(itemData.name) && itemData.info.phoneNumber) {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html(
                "<p><strong>Phone Number: </strong><span>" +
                itemData.info.phoneNumber +
                "</span></p><p><strong>Firstname: </strong><span>" +
                itemData.info.charinfo.firstname +
                "</span></p><p><strong>Lastname: </strong><span>" +
                itemData.info.charinfo.lastname +
                "</span></p>"
            );
        } else if (itemData.name == "tradingcard_psa") {
            $(".item-info-title").html("<p>" + label + "</p>");
            $(".item-info-description").html(
                "<p><strong>PSA ID: </strong><span>" +
                itemData.info.serial +
                "</span></p>"
            );
        } else if (itemData.name == "photo") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html(
                "<p><span>" +
                itemData.info.location +
                "</span></p><span>" +
                itemData.info.date + "</span></p>"
            );
        } else if (itemData.name == "vehiclekeys") {
            $(".item-info-title").html("<p>" + label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Plate: </strong><span>" +
                itemData.info.plate +
                "</span></p><p><strong>Model: </strong><span>" +
                itemData.info.description +
                "</span></p>"
            );
        } else if (itemData.name == "plate") {
            $(".item-info-title").html("<p>" + label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Plate: </strong><span>" +
                itemData.info.plate +
                "</span></p>"
            );
        } else if (itemData.name == "backpack") {
            $(".item-info-title").html("<p>" + label + "</p>");
            $(".item-info-description").html(
                "<p><strong>ID: </strong><span>" +
                itemData.info.ID +
                "</span></p><p><strong>Weight: </strong><span>" +
                itemData.info.weight +
                "</span></p><p><strong>Slots: </strong><span>" +
                itemData.info.slots +
                "</span></p>"
            );
        } else if (itemData.name == "backpack2") {
            $(".item-info-title").html("<p>" + label + "</p>");
            $(".item-info-description").html(
                "<p><strong>ID: </strong><span>" +
                itemData.info.ID +
                "</span></p><p><strong>Weight: </strong><span>" +
                itemData.info.weight +
                "</span></p><p><strong>Slots: </strong><span>" +
                itemData.info.slots +
                "</span></p>"
            );
        } else if (itemData.name == "briefcase") {
            $(".item-info-title").html("<p>" + label + "</p>");
            $(".item-info-description").html(
                "<p><strong>ID: </strong><span>" +
                itemData.info.ID +
                "</span></p><p><strong>Weight: </strong><span>" +
                itemData.info.weight +
                "</span></p><p><strong>Slots: </strong><span>" +
                itemData.info.slots +
                "</span></p>"
            );
        } else if (itemData.name == "paramedicbag") {
            $(".item-info-title").html("<p>" + label + "</p>");
            $(".item-info-description").html(
                "<p><strong>ID: </strong><span>" +
                itemData.info.ID +
                "</span></p><p><strong>Weight: </strong><span>" +
                itemData.info.weight +
                "</span></p><p><strong>Slots: </strong><span>" +
                itemData.info.slots +
                "</span></p>"
            );
        } else if (itemData.name == "driver_license") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html(
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
                "</span></p><p><strong>Licenses: </strong><span>" +
                itemData.info.type +
                "</span></p>"
            );
        } else if (itemData.name == "weaponlicense") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html(
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
                "</span></p>"
            );
        } else if (itemData.name == "lawyerpass") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html(
                "<p><strong>Pass-ID: </strong><span>" +
                itemData.info.id +
                "</span></p><p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>CSN: </strong><span>" +
                itemData.info.citizenid +
                "</span></p>"
            );
        } else if (itemData.name == "harness") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html(
                "<p>" + itemData.info.uses + " uses left.</p>"
            );
        } else if (itemData.name == "url_weapontint") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html(
                "<p><strong>Tint status: </strong><span> " +
                (itemData.info.urltint !== undefined ? "Used" : "Without use") +
                "</span></p><p><strong>URL Link: </strong><span>" +
                itemData.info.urltint.substring(0, 40) + "..." +
                "</span></p>"
            );
        } else if (itemData.type == "weapon") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            if (itemData.info.ammo == undefined) {
                itemData.info.ammo = 0;
            } else {
                itemData.info.ammo != null ? itemData.info.ammo : 0;
            }
            if (itemData.info.attachments != null) {
                var attachmentString = "";
                $.each(itemData.info.attachments, function (i, attachment) {
                    if (i == itemData.info.attachments.length - 1) {
                        attachmentString += attachment.label;
                    } else {
                        attachmentString += attachment.label + ", ";
                    }
                });
                $(".item-info-description").html(
                    "<p><strong>Serial Number: </strong><span>" +
                    itemData.info.serie +
                    "</span></p><p><strong>Munition: </strong><span>" +
                    itemData.info.ammo +
                    "</span></p><p><strong>Attachments: </strong><span>" +
                    attachmentString +
                    "</span></p>"
                );
            } else {
                $(".item-info-description").html(
                    "<p><strong>Serial Number: </strong><span>" +
                    itemData.info.serie +
                    "</span></p><p><strong>Munition: </strong><span>" +
                    itemData.info.ammo +
                    "</span></p><p>" +
                    itemData.description +
                    "</p>"
                );
            }
        } else if (itemData.name == "filled_evidence_bag") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            if (itemData.info.type == "casing") {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" +
                    itemData.info.label +
                    "</span></p><p><strong>Type number: </strong><span>" +
                    itemData.info.ammotype +
                    "</span></p><p><strong>Caliber: </strong><span>" +
                    itemData.info.ammolabel +
                    "</span></p><p><strong>Serial Number: </strong><span>" +
                    itemData.info.serie +
                    "</span></p><p><strong>Crime scene: </strong><span>" +
                    itemData.info.street +
                    "</span></p><br /><p>" +
                    itemData.description +
                    "</p>"
                );

            } else if (itemData.info.type == "blood") {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" +
                    itemData.info.label +
                    "</span></p><p><strong>Blood type: </strong><span>" +
                    itemData.info.bloodtype +
                    "</span></p><p><strong>DNA Code: </strong><span>" +
                    itemData.info.dnalabel +
                    "</span></p><p><strong>Crime scene: </strong><span>" +
                    itemData.info.street +
                    "</span></p><br /><p>" +
                    itemData.description +
                    "</p>"
                );
            } else if (itemData.info.type == "fingerprint") {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" +
                    itemData.info.label +
                    "</span></p><p><strong>Fingerprint: </strong><span>" +
                    itemData.info.fingerprint +
                    "</span></p><p><strong>Crime Scene: </strong><span>" +
                    itemData.info.street +
                    "</span></p><br /><p>" +
                    itemData.description +
                    "</p>"
                );
            } else if (itemData.info.type == "dna") {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" +
                    itemData.info.label +
                    "</span></p><p><strong>DNA Code: </strong><span>" +
                    itemData.info.dnalabel +
                    "</span></p><br /><p>" +
                    itemData.description +
                    "</p>"
                );
            }
        } else if (
            itemData.info.costs != undefined &&
            itemData.info.costs != null
        ) {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html("<p>" + itemData.info.costs + "</p>");
        } else if (itemData.name == "stickynote") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html("<p>" + itemData.info.label + "</p>");
        } else if (itemData.name == "moneybag") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html(
                "<p><strong>Amount of cash: </strong><span>$" +
                itemData.info.cash +
                "</span></p>"
            );
        } else if (itemData.name == "markedbills") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html(
                "<p><strong>Worth: </strong><span>$" +
                itemData.info.worth +
                "</span></p>"
            );
        } else if (itemData.name == "visa" || itemData.name == "creditcard") {
            $(".item-info-title").html('<p>' + label + '</p>')
            var str = "" + itemData.info.cardNumber + "";
            var res = str.slice(12);
            var cardNumber = "************" + res;
            $(".item-info-description").html('<p><strong>Card Owner: </strong><span>' + itemData.info.ownerName + '</span></p><p><strong>Card Type: </strong><span>' + itemData.info.cardType + '</span></p><p><strong>Card Number: </strong><span>' + cardNumber + '</span></p>');
        } else if (itemData.name == "motelkey" && itemData.info) {
            $(".item-info-title").html('<p>' + label + '</p>')
            $(".item-info-description").html('<p>Motel Key: ' + itemData.info.motel + '</p>');
        } else if (itemData.name == "labkey") {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html("<p>Lab: " + itemData.info.lab + "</p>");
        } else {
            $(".item-info-title").html("<p>" + `${itemData.info.label || label}` + "</p>");
            $(".item-info-description").html("<p>" + itemData.description + "</p>");
        }

    } else {
        $(".item-info-title").html("<p>" + itemData.label + "</p>");
        $(".item-info-description").html("<p>" + itemData.description + "</p>");
    }
}