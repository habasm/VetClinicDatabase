CREATE TABLE patients(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE );


CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT );

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitte_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(100) );

ALTER TABLE invoices ADD CONSTRAINT fk_med_invoice FOREIGN KEY (
    medical_history_id) REFERENCES medical_histories(id);


vet_clinic=# ALTER TABLE medical_histories ADD CONSTRAINT fk_patient_med FOREIGN KEY (
    patient_id) REFERENCES patients(id);


CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100));

CREATE TABLE invoice_items(
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL NOT NULL,
    quantty INT NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id INT,
    treatment_id INT );

ALTER TABLE invoice_items ADD CONSTRAINT fk_inv_itme FOREIGN KEY (invoice_id) REFERENCES invoices(id);

ALTER TABLE invoice_items ADD CONSTRAINT fk_treatment_itme FOREIGN KEY (treatment_id) REFERENCES treatments(id);


CREATE TABLE medical_treatment (
    id SERIAL PRIMARY KEY,
    medical_histories_id INT,
    treatments_id INT);