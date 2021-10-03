drop table IF EXISTS session;
CREATE TABLE IF NOT EXISTS "session" (
"sid" varchar(255) NOT NULL COLLATE "default",
"sess" json NOT NULL,
"expired" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE);
commit;
ALTER TABLE "session" DROP CONSTRAINT IF EXISTS sessions_pkey;
ALTER TABLE "session" ADD CONSTRAINT "sessions_pkey" PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE;
CREATE UNIQUE INDEX IF NOT EXISTS  sessions_expired_index ON session USING btree (expired);
commit;