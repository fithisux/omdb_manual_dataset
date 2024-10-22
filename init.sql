DO $$ BEGIN
    CREATE TYPE omdb_name_type AS (
        name    varchar,
        language_iso_639_1     varchar
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE content_alias_type AS (
        name    varchar,
        language_iso_639_1     varchar,
        official_translation boolean
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE content_abstract_type AS (
        abstract    varchar,
        language_iso_639_1     varchar
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE content_link_type AS (
        source    varchar,
        key    varchar,
        language_iso_639_1     varchar
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE content_reference_type AS (
        type    varchar,
        referenced_id     int
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;