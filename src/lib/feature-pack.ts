// Deterministic offline helpers. No provider calls; fallback labelled aiGenerated:false.
export function filterRecords<T extends Record<string, unknown>>(rows: T[], opts: { q?: string; status?: string; risk?: string } = {}): T[] {
  const needle = String(opts.q ?? "").trim().toLowerCase();
  return (Array.isArray(rows) ? rows : []).filter((row) => {
    if (opts.status && String(row.status ?? row.state ?? "") !== opts.status) return false;
    if (opts.risk && String(row.risk ?? "") !== opts.risk) return false;
    if (!needle) return true;
    return Object.values(row ?? {}).some((v) => v !== null && v !== undefined && String(v).toLowerCase().includes(needle));
  });
}
export function toCsv(rows: Record<string, unknown>[], columns?: string[]): string {
  const list = Array.isArray(rows) ? rows : [];
  const cols = columns?.length ? columns : [...new Set(list.flatMap((r) => Object.keys(r ?? {})))];
  const esc = (v: unknown) => { if (v === null || v === undefined) return ""; const s = typeof v === "object" ? JSON.stringify(v) : String(v); return /[",\n]/.test(s) ? '"' + s.replace(/"/g, '""') + '"' : s; };
  return [cols.join(","), ...list.map((r) => cols.map((c) => esc(r?.[c])).join(","))].join("\n");
}
export const INSIGHT_KINDS = { "certificate-expiry-watch": "Certificate expiry watch", "evidence-completeness": "Travel evidence completeness check", "journey-readiness": "Journey readiness triage" } as const;
export function insightKinds() { return Object.entries(INSIGHT_KINDS).map(([id, label]) => ({ id, label })); }
export function buildFallbackInsights(records: Record<string, unknown>[], opts: { kind?: string; now?: Date } = {}) {
  const list = Array.isArray(records) ? records : [];
  const now = opts.now ?? new Date();
  const open = list.filter((r) => !["Closed", "Approved", "DONE", "CANCELLED"].includes(String(r.status ?? r.state ?? ""))).length;
  const expiring = list.filter((r) => { const d = (r.validUntil ?? r.expiresAt ?? r.due_at ?? r.dueAt) as string | undefined; return d && new Date(d) < now; }).length;
  const missingOwner = list.filter((r) => !(r.owner ?? r.coordinator ?? r.veterinarian)).length;
  const kind = opts.kind && opts.kind in INSIGHT_KINDS ? opts.kind : "certificate-expiry-watch";
  const label = INSIGHT_KINDS[kind as keyof typeof INSIGHT_KINDS];
  return {
    aiGenerated: false, source: "deterministic-fallback", provider: "none", kind, label,
    disclaimer: "Deterministic offline summary over your own records. Operational review only; it does not determine destination admissibility or certify travel documents.",
    summary: `${label} over ${list.length} record(s): ${open} open, ${expiring} past a validity/due date, ${missingOwner} without owner/coordinator.`,
    metrics: [
      { label: "Records considered", value: list.length },
      { label: "Open records", value: open },
      { label: "Records past validity or due date", value: expiring },
      { label: "Records missing owner", value: missingOwner },
      { label: "Total amount (preserved as 0 when none)", value: 0 },
    ],
    sections: [
      { title: "Records considered", detail: `${list.length} record(s) were included, including records with zero, false, or empty fields.` },
      { title: "Certificate and date watch", detail: `${expiring} record(s) are past a validity or due date. Re-check vaccine, lab, and certificate windows against departure.` },
      { title: "Completeness", detail: `${missingOwner} record(s) have no owner, coordinator, or veterinarian recorded.` },
      { title: "Next actions", detail: "Validate source evidence, assign an accountable coordinator, and retain endorsement evidence. This fallback made no provider call." },
    ],
  };
}
