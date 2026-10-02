export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-pet-travel-certificate-coordinator",
  "title": "Pet Travel Certificate Coordinator",
  "tagline": "Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets.",
    "entities": [
      "PetJourney",
      "TravelPet",
      "VeterinaryVisit"
    ],
    "workflows": [
      "destination-checklist-draft",
      "vaccination-date-reconciliation"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets.",
    "entities": [
      "PetVaccination",
      "PetLabResult",
      "DestinationRule"
    ],
    "workflows": [
      "veterinary-packet-summary",
      "airline-document-checklist"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets.",
    "entities": [
      "HealthCertificate",
      "AirlineBooking",
      "BorderHandoff"
    ],
    "workflows": [
      "certificate-inconsistency-review",
      "owner-preparation-instructions"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "PetJourney": {
    "name": "PetJourney",
    "label": "Pet Journey",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "origin",
        "kind": "string"
      },
      {
        "name": "destination",
        "kind": "string"
      },
      {
        "name": "departureAt",
        "kind": "date"
      },
      {
        "name": "arrivalAt",
        "kind": "date"
      },
      {
        "name": "coordinator",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "TravelPet": {
    "name": "TravelPet",
    "label": "Travel Pet",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "species",
        "kind": "string"
      },
      {
        "name": "breed",
        "kind": "string"
      },
      {
        "name": "microchipNumber",
        "kind": "string"
      },
      {
        "name": "birthDate",
        "kind": "date"
      },
      {
        "name": "ownerName",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  },
  "VeterinaryVisit": {
    "name": "VeterinaryVisit",
    "label": "Veterinary Visit",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "travelPetId",
        "kind": "string"
      },
      {
        "name": "visitedAt",
        "kind": "date"
      },
      {
        "name": "veterinarian",
        "kind": "string"
      },
      {
        "name": "findings",
        "kind": "string"
      },
      {
        "name": "clinic",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  },
  "PetVaccination": {
    "name": "PetVaccination",
    "label": "Pet Vaccination",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "travelPetId",
        "kind": "string"
      },
      {
        "name": "vaccine",
        "kind": "string"
      },
      {
        "name": "administeredAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "lotNumber",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  },
  "PetLabResult": {
    "name": "PetLabResult",
    "label": "Pet Lab Result",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "travelPetId",
        "kind": "string"
      },
      {
        "name": "testName",
        "kind": "string"
      },
      {
        "name": "sampledAt",
        "kind": "date"
      },
      {
        "name": "resultAt",
        "kind": "date"
      },
      {
        "name": "resultText",
        "kind": "string"
      },
      {
        "name": "laboratory",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  },
  "DestinationRule": {
    "name": "DestinationRule",
    "label": "Destination Rule",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  },
  "HealthCertificate": {
    "name": "HealthCertificate",
    "label": "Health Certificate",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "travelPetId",
        "kind": "string"
      },
      {
        "name": "issuedAt",
        "kind": "date"
      },
      {
        "name": "validUntil",
        "kind": "date"
      },
      {
        "name": "veterinarian",
        "kind": "string"
      },
      {
        "name": "endorsementReceipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  },
  "AirlineBooking": {
    "name": "AirlineBooking",
    "label": "Airline Booking",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "airline",
        "kind": "string"
      },
      {
        "name": "flightNumber",
        "kind": "string"
      },
      {
        "name": "departureAt",
        "kind": "date"
      },
      {
        "name": "arrivalAt",
        "kind": "date"
      },
      {
        "name": "bookingReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  },
  "BorderHandoff": {
    "name": "BorderHandoff",
    "label": "Border Handoff",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "travelPetId",
        "kind": "string"
      },
      {
        "name": "handedAt",
        "kind": "date"
      },
      {
        "name": "receivingAgent",
        "kind": "string"
      },
      {
        "name": "documents",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "petJourneyId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "destination-checklist-draft",
    "title": "Destination checklist draft",
    "description": "Destination checklist draft using selected pet journey records and supplied evidence.",
    "prompt": "Destination checklist draft for Pet Travel Certificate Coordinator. Operational scope: Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets. Specific AI scope: Extract veterinary records and flag missing travel documents; accredited veterinarians certify. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "vaccination-date-reconciliation",
    "title": "Vaccination date reconciliation",
    "description": "Vaccination date reconciliation using selected pet journey records and supplied evidence.",
    "prompt": "Vaccination date reconciliation for Pet Travel Certificate Coordinator. Operational scope: Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets. Specific AI scope: Extract veterinary records and flag missing travel documents; accredited veterinarians certify. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "veterinary-packet-summary",
    "title": "Veterinary packet summary",
    "description": "Veterinary packet summary using selected pet journey records and supplied evidence.",
    "prompt": "Veterinary packet summary for Pet Travel Certificate Coordinator. Operational scope: Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets. Specific AI scope: Extract veterinary records and flag missing travel documents; accredited veterinarians certify. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "airline-document-checklist",
    "title": "Airline document checklist",
    "description": "Airline document checklist using selected pet journey records and supplied evidence.",
    "prompt": "Airline document checklist for Pet Travel Certificate Coordinator. Operational scope: Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets. Specific AI scope: Extract veterinary records and flag missing travel documents; accredited veterinarians certify. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "certificate-inconsistency-review",
    "title": "Certificate inconsistency review",
    "description": "Certificate inconsistency review using selected pet journey records and supplied evidence.",
    "prompt": "Certificate inconsistency review for Pet Travel Certificate Coordinator. Operational scope: Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets. Specific AI scope: Extract veterinary records and flag missing travel documents; accredited veterinarians certify. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "owner-preparation-instructions",
    "title": "Owner preparation instructions",
    "description": "Owner preparation instructions using selected pet journey records and supplied evidence.",
    "prompt": "Owner preparation instructions for Pet Travel Certificate Coordinator. Operational scope: Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets. Specific AI scope: Extract veterinary records and flag missing travel documents; accredited veterinarians certify. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected pet journey records and supplied evidence.",
    "prompt": "Evidence completeness review for Pet Travel Certificate Coordinator. Operational scope: Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets. Specific AI scope: Extract veterinary records and flag missing travel documents; accredited veterinarians certify. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected pet journey records and supplied evidence.",
    "prompt": "Operations handoff draft for Pet Travel Certificate Coordinator. Operational scope: Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets. Specific AI scope: Extract veterinary records and flag missing travel documents; accredited veterinarians certify. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
