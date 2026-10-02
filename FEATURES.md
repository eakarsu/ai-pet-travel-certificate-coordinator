# Pet Travel Certificate Coordinator

Maintain destination checklists, vaccine/test date dependencies, endorsement status and airline document packets.

## Implemented records

- **Pet Journey**: name, origin, destination, departure At, arrival At, coordinator, status.
- **Travel Pet**: name, species, breed, microchip Number, birth Date, owner Name, status.
- **Veterinary Visit**: title, visited At, veterinarian, findings, clinic, status.
- **Pet Vaccination**: title, vaccine, administered At, expires At, lot Number, status.
- **Pet Lab Result**: title, test Name, sampled At, result At, result Text, laboratory, status.
- **Destination Rule**: title, jurisdiction, version, effective At, requirement Text, source Url, status.
- **Health Certificate**: title, issued At, valid Until, veterinarian, endorsement Receipt, status.
- **Airline Booking**: title, airline, flight Number, departure At, arrival At, booking Reference, status.
- **Border Handoff**: title, handed At, receiving Agent, documents, receipt, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Destination checklist draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Vaccination date reconciliation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Veterinary packet summary: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Airline document checklist: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Certificate inconsistency review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Owner preparation instructions: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Pet travel evidence date windows: Check whether supplied document validity windows cover departure. Does not determine destination admissibility.
- Pet Journey evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
