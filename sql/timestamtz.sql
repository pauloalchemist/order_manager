ALTER TABLE customer_addresses ALTER updated_at TYPE timestamptz USING updated_at AT TIME ZONE 'UTC';

ALTER TABLE customer_addresses ALTER created_at TYPE timestamptz USING created_at AT TIME ZONE 'UTC';
