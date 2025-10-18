-- Focus Bridge Database Schema Update
-- Adding Department, Batch, and Section fields for student filtering

USE `fb-sql`;

-- =============================================
-- 1. UPDATE USERS TABLE
-- =============================================
-- Add department, batch, and section fields to users table
ALTER TABLE users 
ADD COLUMN department VARCHAR(100) DEFAULT NULL,
ADD COLUMN batch VARCHAR(20) DEFAULT NULL,
ADD COLUMN section VARCHAR(10) DEFAULT NULL;

-- =============================================
-- 2. UPDATE EXAMS TABLE
-- =============================================
-- Add department, batch, and section fields to exams table
ALTER TABLE exams 
ADD COLUMN department VARCHAR(100) DEFAULT NULL,
ADD COLUMN batch VARCHAR(20) DEFAULT NULL,
ADD COLUMN section VARCHAR(10) DEFAULT NULL;

-- =============================================
-- 3. UPDATE NOTES TABLE
-- =============================================
-- Add department, batch, and section fields to notes table
ALTER TABLE notes 
ADD COLUMN department VARCHAR(100) DEFAULT NULL,
ADD COLUMN batch VARCHAR(20) DEFAULT NULL,
ADD COLUMN section VARCHAR(10) DEFAULT NULL;

-- =============================================
-- 4. UPDATE QUOTES TABLE
-- =============================================
-- Add department, batch, and section fields to quotes table
ALTER TABLE quotes 
ADD COLUMN department VARCHAR(100) DEFAULT NULL,
ADD COLUMN batch VARCHAR(20) DEFAULT NULL,
ADD COLUMN section VARCHAR(10) DEFAULT NULL;

-- =============================================
-- 5. UPDATE NOTICES TABLE
-- =============================================
-- Add department, batch, and section fields to notices table
ALTER TABLE notices 
ADD COLUMN department VARCHAR(100) DEFAULT NULL,
ADD COLUMN batch VARCHAR(20) DEFAULT NULL,
ADD COLUMN section VARCHAR(10) DEFAULT NULL;

-- =============================================
-- 6. ADD INDEXES FOR BETTER PERFORMANCE
-- =============================================
-- Add indexes for the new filtering fields
CREATE INDEX idx_users_department ON users(department);
CREATE INDEX idx_users_batch ON users(batch);
CREATE INDEX idx_users_section ON users(section);
CREATE INDEX idx_users_dept_batch_section ON users(department, batch, section);

CREATE INDEX idx_exams_department ON exams(department);
CREATE INDEX idx_exams_batch ON exams(batch);
CREATE INDEX idx_exams_section ON exams(section);
CREATE INDEX idx_exams_dept_batch_section ON exams(department, batch, section);

CREATE INDEX idx_notes_department ON notes(department);
CREATE INDEX idx_notes_batch ON notes(batch);
CREATE INDEX idx_notes_section ON notes(section);
CREATE INDEX idx_notes_dept_batch_section ON notes(department, batch, section);

CREATE INDEX idx_quotes_department ON quotes(department);
CREATE INDEX idx_quotes_batch ON quotes(batch);
CREATE INDEX idx_quotes_section ON quotes(section);
CREATE INDEX idx_quotes_dept_batch_section ON quotes(department, batch, section);

CREATE INDEX idx_notices_department ON notices(department);
CREATE INDEX idx_notices_batch ON notices(batch);
CREATE INDEX idx_notices_section ON notices(section);
CREATE INDEX idx_notices_dept_batch_section ON notices(department, batch, section);

-- =============================================
-- 7. UPDATE EXISTING DATA (OPTIONAL)
-- =============================================
-- If you have existing data, you might want to set default values
-- For example, if you want all existing users to be in a default department:
-- UPDATE users SET department = 'General', batch = '2024', section = 'A' WHERE department IS NULL;

-- =============================================
-- END OF SCHEMA UPDATE
-- =============================================
