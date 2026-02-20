Profile: MedicationDispenseEuMpd
Parent: MedicationDispense 
Id: MedicationDispense-eu-mpd
Title: "MedicationDispense: MPD"
Description: "MedicationDispense profile for capturing dispensation information based on a medication prescription."

//R5* insert ImposeProfile ( $MedicationDispense-ihe , 0)

* identifier // MS // identifier
* subject // MS // patient 1
* receiver // MS // receiver
* performer.actor 1..1 // MS // dispenser 1
* authorizingPrescription // MS // relatedRequest
* authorizingPrescription only Reference(MedicationRequestEuMpd)
* quantity 1..1 // MS // dispensedQuantity 1
* whenHandedOver 1..1 // MS // timeOfDispensation 1
* substitution.wasSubstituted // MS // substitutionOccurred
* status // MS // status 1

//R5* medication only CodeableReference(MedicationEuMpd)
* medicationReference only Reference(MedicationEuMpd)

//R5* medication.extension contains $data-absent-reason named medication-absent-reason 0..1
* medicationCodeableConcept.extension contains $data-absent-reason named medication-absent-reason 0..1

//R5* medication.extension[medication-absent-reason] ^short = "Reason for not providing the medication."
* medicationCodeableConcept.extension[medication-absent-reason] ^short = "Reason for not providing the medication."

//R5* medication.extension[medication-absent-reason] ^definition = "Reason for not providing the medication."
* medicationCodeableConcept.extension[medication-absent-reason] ^definition = "Reason for not providing the medication."

* extension contains $medicationdispense-rendereddosageinstruction-r5 named renderedDosageInstruction 0..1
* extension[renderedDosageInstruction] ^short = "Full representation of the dosage instructions"
//R5* notPerformedReason // MS // statusReason, statusText (partial mapping to logical model!)