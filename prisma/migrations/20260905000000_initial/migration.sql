-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PetJourney" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "origin" TEXT NOT NULL,
    "destination" TEXT NOT NULL,
    "departureAt" TIMESTAMP(3) NOT NULL,
    "arrivalAt" TIMESTAMP(3) NOT NULL,
    "coordinator" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PetJourney_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TravelPet" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "species" TEXT NOT NULL,
    "breed" TEXT NOT NULL,
    "microchipNumber" TEXT NOT NULL,
    "birthDate" TIMESTAMP(3) NOT NULL,
    "ownerName" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TravelPet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VeterinaryVisit" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "travelPetId" TEXT NOT NULL,
    "visitedAt" TIMESTAMP(3) NOT NULL,
    "veterinarian" TEXT NOT NULL,
    "findings" TEXT NOT NULL,
    "clinic" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VeterinaryVisit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PetVaccination" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "travelPetId" TEXT NOT NULL,
    "vaccine" TEXT NOT NULL,
    "administeredAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "lotNumber" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PetVaccination_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PetLabResult" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "travelPetId" TEXT NOT NULL,
    "testName" TEXT NOT NULL,
    "sampledAt" TIMESTAMP(3) NOT NULL,
    "resultAt" TIMESTAMP(3) NOT NULL,
    "resultText" TEXT NOT NULL,
    "laboratory" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PetLabResult_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DestinationRule" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "requirementText" TEXT NOT NULL,
    "sourceUrl" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DestinationRule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HealthCertificate" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "travelPetId" TEXT NOT NULL,
    "issuedAt" TIMESTAMP(3) NOT NULL,
    "validUntil" TIMESTAMP(3) NOT NULL,
    "veterinarian" TEXT NOT NULL,
    "endorsementReceipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HealthCertificate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AirlineBooking" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "airline" TEXT NOT NULL,
    "flightNumber" TEXT NOT NULL,
    "departureAt" TIMESTAMP(3) NOT NULL,
    "arrivalAt" TIMESTAMP(3) NOT NULL,
    "bookingReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AirlineBooking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BorderHandoff" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "travelPetId" TEXT NOT NULL,
    "handedAt" TIMESTAMP(3) NOT NULL,
    "receivingAgent" TEXT NOT NULL,
    "documents" TEXT NOT NULL,
    "receipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BorderHandoff_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "petJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "PetJourney_createdAt_idx" ON "PetJourney"("createdAt");

-- CreateIndex
CREATE INDEX "TravelPet_createdAt_idx" ON "TravelPet"("createdAt");

-- CreateIndex
CREATE INDEX "TravelPet_petJourneyId_idx" ON "TravelPet"("petJourneyId");

-- CreateIndex
CREATE INDEX "VeterinaryVisit_createdAt_idx" ON "VeterinaryVisit"("createdAt");

-- CreateIndex
CREATE INDEX "VeterinaryVisit_petJourneyId_idx" ON "VeterinaryVisit"("petJourneyId");

-- CreateIndex
CREATE INDEX "PetVaccination_createdAt_idx" ON "PetVaccination"("createdAt");

-- CreateIndex
CREATE INDEX "PetVaccination_petJourneyId_idx" ON "PetVaccination"("petJourneyId");

-- CreateIndex
CREATE INDEX "PetLabResult_createdAt_idx" ON "PetLabResult"("createdAt");

-- CreateIndex
CREATE INDEX "PetLabResult_petJourneyId_idx" ON "PetLabResult"("petJourneyId");

-- CreateIndex
CREATE INDEX "DestinationRule_createdAt_idx" ON "DestinationRule"("createdAt");

-- CreateIndex
CREATE INDEX "DestinationRule_petJourneyId_idx" ON "DestinationRule"("petJourneyId");

-- CreateIndex
CREATE INDEX "HealthCertificate_createdAt_idx" ON "HealthCertificate"("createdAt");

-- CreateIndex
CREATE INDEX "HealthCertificate_petJourneyId_idx" ON "HealthCertificate"("petJourneyId");

-- CreateIndex
CREATE INDEX "AirlineBooking_createdAt_idx" ON "AirlineBooking"("createdAt");

-- CreateIndex
CREATE INDEX "AirlineBooking_petJourneyId_idx" ON "AirlineBooking"("petJourneyId");

-- CreateIndex
CREATE INDEX "BorderHandoff_createdAt_idx" ON "BorderHandoff"("createdAt");

-- CreateIndex
CREATE INDEX "BorderHandoff_petJourneyId_idx" ON "BorderHandoff"("petJourneyId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_petJourneyId_idx" ON "OperationalTask"("petJourneyId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_petJourneyId_idx" ON "RuleVersion"("petJourneyId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_petJourneyId_idx" ON "DocumentRequirement"("petJourneyId");

-- AddForeignKey
ALTER TABLE "TravelPet" ADD CONSTRAINT "TravelPet_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VeterinaryVisit" ADD CONSTRAINT "VeterinaryVisit_travelPetId_fkey" FOREIGN KEY ("travelPetId") REFERENCES "TravelPet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VeterinaryVisit" ADD CONSTRAINT "VeterinaryVisit_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetVaccination" ADD CONSTRAINT "PetVaccination_travelPetId_fkey" FOREIGN KEY ("travelPetId") REFERENCES "TravelPet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetVaccination" ADD CONSTRAINT "PetVaccination_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetLabResult" ADD CONSTRAINT "PetLabResult_travelPetId_fkey" FOREIGN KEY ("travelPetId") REFERENCES "TravelPet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetLabResult" ADD CONSTRAINT "PetLabResult_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DestinationRule" ADD CONSTRAINT "DestinationRule_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HealthCertificate" ADD CONSTRAINT "HealthCertificate_travelPetId_fkey" FOREIGN KEY ("travelPetId") REFERENCES "TravelPet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HealthCertificate" ADD CONSTRAINT "HealthCertificate_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AirlineBooking" ADD CONSTRAINT "AirlineBooking_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BorderHandoff" ADD CONSTRAINT "BorderHandoff_travelPetId_fkey" FOREIGN KEY ("travelPetId") REFERENCES "TravelPet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BorderHandoff" ADD CONSTRAINT "BorderHandoff_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_petJourneyId_fkey" FOREIGN KEY ("petJourneyId") REFERENCES "PetJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

