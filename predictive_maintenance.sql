-- Creating tables for Predictive Maintenance System

CREATE TABLE equipment (
    equipment_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    purchase_date DATE,
    last_service_date DATE,
    status VARCHAR(20) CHECK (status IN ('Active', 'Inactive', 'Under Maintenance'))
);

CREATE TABLE maintenance_logs (
    log_id SERIAL PRIMARY KEY,
    equipment_id INT REFERENCES equipment(equipment_id),
    maintenance_date DATE NOT NULL,
    maintenance_type VARCHAR(50),
    technician_name VARCHAR(100),
    notes TEXT
);

CREATE TABLE failure_reports (
    failure_id SERIAL PRIMARY KEY,
    equipment_id INT REFERENCES equipment(equipment_id),
    failure_date DATE NOT NULL,
    failure_type VARCHAR(50),
    severity_level INT CHECK (severity_level BETWEEN 1 AND 5),
    resolved BOOLEAN DEFAULT FALSE
);

CREATE TABLE predictive_models (
    model_id SERIAL PRIMARY KEY,
    equipment_id INT REFERENCES equipment(equipment_id),
    prediction_date DATE NOT NULL,
    predicted_failure_date DATE,
    confidence_level DECIMAL(5,2),
    status VARCHAR(20) CHECK (status IN ('Pending', 'Verified', 'Incorrect'))
);

-- Example Query: Find equipment with the highest risk of failure
SELECT e.name, pm.predicted_failure_date, pm.confidence_level
FROM predictive_models pm
JOIN equipment e ON pm.equipment_id = e.equipment_id
WHERE pm.confidence_level > 85
ORDER BY pm.predicted_failure_date ASC;
