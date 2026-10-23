import { NextRequest, NextResponse } from "next/server";
import { requireUser } from "@/lib/api-auth";
import { buildFallbackInsights, insightKinds } from "@/lib/feature-pack";
export const dynamic = "force-dynamic";
export async function GET() {
  const user = await requireUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  return NextResponse.json({ kinds: insightKinds(), aiGenerated: false });
}
export async function POST(request: NextRequest) {
  const user = await requireUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  const body = (await request.json().catch(() => ({}))) as Record<string, unknown>;
  const kind = typeof body.kind === "string" ? body.kind : "certificate-expiry-watch";
  if (!insightKinds().some((k) => k.id === kind)) return NextResponse.json({ error: "unknown insight kind", kinds: insightKinds() }, { status: 422 });
  const records = Array.isArray(body.records) ? (body.records as Record<string, unknown>[]) : [];
  // Deterministic fallback only — never calls a provider.
  return NextResponse.json({ result: buildFallbackInsights(records, { kind }) });
}
