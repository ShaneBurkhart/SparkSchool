CREATE TYPE UserStatus AS ENUM ('unpaid', 'paid');

CREATE TABLE Users (
    id BIGSERIAL PRIMARY KEY,
    status UserStatus  DEFAULT 'unpaid' NOT NULL,
    full_name VARCHAR(70) NOT NULL,
    email VARCHAR(254) NOT NULL,
    password_digest VARCHAR(60) NOT NULL,
    stripe_customer_id VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
