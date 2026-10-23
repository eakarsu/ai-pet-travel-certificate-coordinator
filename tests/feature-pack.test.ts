import test from "node:test";
import assert from "node:assert/strict";
import { filterRecords, toCsv, buildFallbackInsights, insightKinds } from "../src/lib/feature-pack";
const rows: Record<string, unknown>[] = [
  { title: "Rabies cert", status: "Open", amount: 0, owner: "" },
  { title: "Lab result", status: "Closed", amount: 250, owner: "Sam" },
  { title: "", status: "Open", amount: 0, owner: null },
];
test("search/filter preserves 0/empty", () => {
  assert.equal(filterRecords(rows, {}).length, 3);
  assert.equal(filterRecords(rows, { q: "rabies" }).length, 1);
  assert.equal(filterRecords(rows, { status: "Open" }).length, 2);
});
test("csv preserves 0", () => { assert.ok(toCsv(rows, ["title", "amount"]).includes("Rabies cert,0")); });
test("fallback labelled aiGenerated:false", () => {
  const r = buildFallbackInsights(rows, { kind: "certificate-expiry-watch" });
  assert.equal(r.aiGenerated, false); assert.ok(r.sections.length >= 3); assert.ok(insightKinds().length >= 3);
});
