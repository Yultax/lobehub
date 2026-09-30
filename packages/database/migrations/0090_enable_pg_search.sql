-- Custom SQL migration file, put your code below! --
-- pg_search is optional: some hosts (e.g. new Neon projects) no longer allow it.
-- Without it, set FTS_SEARCH_PROVIDER=pg_like; the BM25 indexes in 0093 are skipped.
DO $$
BEGIN
  CREATE EXTENSION IF NOT EXISTS pg_search;
EXCEPTION WHEN OTHERS THEN
  RAISE NOTICE 'pg_search unavailable (%), skipping BM25 setup', SQLERRM;
END $$;
