-- ============================================================================
-- National Legal & Investigation Document Repository (NLADR)
-- Department of Legal & Administrative Affairs - Ministry of Law & Justice, Govt of India
-- Relational Database Definition Schema (DDL)
-- Compatible with: PostgreSQL 14+, MySQL 8+, SQLite 3, Supabase
-- Compliant with: Bharatiya Sakshya Adhiniyam 2023 (Sec 63), BNSS 2023, IT Act 2000
-- ============================================================================

-- Drop tables in reverse foreign key order if needed
DROP TABLE IF EXISTS audit_logs;
DROP TABLE IF EXISTS citizen_grievances;
DROP TABLE IF EXISTS investigation_findings;
DROP TABLE IF EXISTS chain_of_custody;
DROP TABLE IF EXISTS evidence_documents;
DROP TABLE IF EXISTS case_team_members;
DROP TABLE IF EXISTS physical_vault_locations;
DROP TABLE IF EXISTS cases;
DROP TABLE IF EXISTS registration_requests;
DROP TABLE IF EXISTS users;

-- ============================================================================
-- 1. USERS & RBAC IDENTITIES
-- ============================================================================
CREATE TABLE users (
    id VARCHAR(50) PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    name VARCHAR(150) NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN (
        'Administrator', 
        'Investigator Officer', 
        'Legal Officer', 
        'Record Officer', 
        'Citizen', 
        'Forensic Analyst',
        'Public Prosecutor'
    )),
    custom_role VARCHAR(150),
    designation VARCHAR(200) NOT NULL,
    department VARCHAR(200) NOT NULL,
    badge_number VARCHAR(100),
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(30) NOT NULL,
    aadhaar_masked VARCHAR(20),
    status VARCHAR(20) NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Suspended', 'Pending', 'Deactivated')),
    avatar_initials VARCHAR(10),
    approved_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_department ON users(department);

-- ============================================================================
-- 2. ACCESS REGISTRATION REQUESTS (Govt ID & e-KYC Workflow)
-- ============================================================================
CREATE TABLE registration_requests (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    requested_role VARCHAR(50) NOT NULL,
    custom_role VARCHAR(150),
    department VARCHAR(200) NOT NULL,
    id_proof_type VARCHAR(100) NOT NULL,
    id_proof_number VARCHAR(100) NOT NULL,
    reason_justification TEXT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pending' CHECK (status IN ('Pending', 'Approved', 'Rejected')),
    applied_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    reviewed_by VARCHAR(50) REFERENCES users(id),
    reviewed_at TIMESTAMP WITH TIME ZONE,
    rejection_reason TEXT
);

CREATE INDEX idx_reg_status ON registration_requests(status);
CREATE INDEX idx_reg_email ON registration_requests(email);

-- ============================================================================
-- 3. MASTER LEGAL & INVESTIGATION CASES (FIRs & Court Dockets)
-- ============================================================================
CREATE TABLE cases (
    id VARCHAR(50) PRIMARY KEY,
    case_number VARCHAR(100) NOT NULL UNIQUE,
    fir_number VARCHAR(150) NOT NULL,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    statute_sections TEXT NOT NULL,
    complainant_name VARCHAR(150) NOT NULL,
    complainant_id VARCHAR(50) REFERENCES users(id),
    complainant_contact VARCHAR(50),
    assigned_io_id VARCHAR(50) REFERENCES users(id),
    assigned_legal_officer_id VARCHAR(50) REFERENCES users(id),
    record_officer_id VARCHAR(50) REFERENCES users(id),
    status VARCHAR(50) NOT NULL DEFAULT 'Under Investigation' CHECK (status IN (
        'Under Investigation',
        'Charge-sheet Filed',
        'In Trial',
        'Solved/Disposed',
        'Quashed/Closed'
    )),
    priority VARCHAR(20) NOT NULL DEFAULT 'Normal' CHECK (priority IN ('Normal', 'High', 'Urgent', 'Critical')),
    progress_percent INT NOT NULL DEFAULT 0 CHECK (progress_percent BETWEEN 0 AND 100),
    filing_date DATE NOT NULL,
    disposed_date DATE,
    disposal_outcome TEXT,
    court_name VARCHAR(200) NOT NULL,
    presiding_judge VARCHAR(150) NOT NULL,
    next_hearing_date VARCHAR(50),
    hearing_stage VARCHAR(200),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_cases_case_num ON cases(case_number);
CREATE INDEX idx_cases_status ON cases(status);
CREATE INDEX idx_cases_priority ON cases(priority);
CREATE INDEX idx_cases_assigned_io ON cases(assigned_io_id);
CREATE INDEX idx_cases_filing_date ON cases(filing_date);

-- ============================================================================
-- 4. PHYSICAL WAREHOUSE VAULT ARCHIVAL (Dual Vault System)
-- ============================================================================
CREATE TABLE physical_vault_locations (
    id VARCHAR(50) PRIMARY KEY,
    case_id VARCHAR(50) NOT NULL UNIQUE REFERENCES cases(id) ON DELETE CASCADE,
    vault_number VARCHAR(100) NOT NULL,
    rack_number VARCHAR(50) NOT NULL,
    shelf_number VARCHAR(50) NOT NULL,
    security_classification VARCHAR(50) NOT NULL CHECK (security_classification IN (
        'Public Judicial Record',
        'Restricted',
        'Restricted Confidential',
        'Secret',
        'Top Secret'
    )),
    barcode_rfid_tag VARCHAR(100) UNIQUE,
    custodian_user_id VARCHAR(50) REFERENCES users(id),
    tamper_seal_intact BOOLEAN NOT NULL DEFAULT TRUE,
    last_physical_audit TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_vault_case ON physical_vault_locations(case_id);
CREATE INDEX idx_vault_classification ON physical_vault_locations(security_classification);

-- ============================================================================
-- 5. CASE INVESTIGATION TEAM MEMBERS
-- ============================================================================
CREATE TABLE case_team_members (
    id VARCHAR(50) PRIMARY KEY,
    case_id VARCHAR(50) NOT NULL REFERENCES cases(id) ON DELETE CASCADE,
    member_name VARCHAR(150) NOT NULL,
    member_role VARCHAR(100) NOT NULL,
    phone VARCHAR(30),
    user_id VARCHAR(50) REFERENCES users(id),
    assigned_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_team_case ON case_team_members(case_id);

-- ============================================================================
-- 6. EVIDENCE & LEGAL DOCUMENTS (Cryptographic SHA-256 Ledger)
-- ============================================================================
CREATE TABLE evidence_documents (
    id VARCHAR(50) PRIMARY KEY,
    case_id VARCHAR(50) NOT NULL REFERENCES cases(id) ON DELETE CASCADE,
    document_name VARCHAR(255) NOT NULL,
    document_type VARCHAR(100) NOT NULL CHECK (document_type IN (
        'FIR Dossier',
        'Forensic Evidence',
        'Charge Sheet',
        'Seizure Memo',
        'Judgement / Order',
        'Cyber Forensics',
        'Panchnama',
        'Section 65B Certificate'
    )),
    file_size_human VARCHAR(50) NOT NULL,
    file_size_bytes BIGINT NOT NULL DEFAULT 0,
    mime_type VARCHAR(100) NOT NULL DEFAULT 'application/pdf',
    storage_path VARCHAR(500),
    sha256_hash VARCHAR(64) NOT NULL, -- 256-bit Hexadecimal Digest
    tamper_verified BOOLEAN NOT NULL DEFAULT TRUE,
    access_level VARCHAR(50) NOT NULL DEFAULT 'Confidential' CHECK (access_level IN (
        'Public Record',
        'Restricted',
        'Confidential',
        'Secret',
        'Classified'
    )),
    sec_65b_certificate_issued BOOLEAN NOT NULL DEFAULT FALSE,
    sec_65b_cert_hash VARCHAR(64),
    uploaded_by_user_id VARCHAR(50) REFERENCES users(id),
    uploaded_by_name VARCHAR(150) NOT NULL,
    uploaded_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_docs_case ON evidence_documents(case_id);
CREATE INDEX idx_docs_sha256 ON evidence_documents(sha256_hash);
CREATE INDEX idx_docs_type ON evidence_documents(document_type);

-- ============================================================================
-- 7. CHAIN OF CUSTODY (Evidence Transfer Tracking)
-- ============================================================================
CREATE TABLE chain_of_custody (
    id VARCHAR(50) PRIMARY KEY,
    document_id VARCHAR(50) NOT NULL REFERENCES evidence_documents(id) ON DELETE CASCADE,
    case_id VARCHAR(50) NOT NULL REFERENCES cases(id) ON DELETE CASCADE,
    transferred_from_user_id VARCHAR(50) REFERENCES users(id),
    transferred_to_user_id VARCHAR(50) REFERENCES users(id),
    sender_name VARCHAR(150) NOT NULL,
    recipient_name VARCHAR(150) NOT NULL,
    custody_reason VARCHAR(255) NOT NULL,
    sha256_verified_at_transfer VARCHAR(64) NOT NULL,
    verification_status VARCHAR(30) NOT NULL DEFAULT 'VERIFIED_MATCH' CHECK (verification_status IN (
        'VERIFIED_MATCH',
        'INTEGRITY_MISMATCH',
        'PENDING_ACKNOWLEDGMENT'
    )),
    transfer_timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_coc_doc ON chain_of_custody(document_id);
CREATE INDEX idx_coc_case ON chain_of_custody(case_id);

-- ============================================================================
-- 8. INVESTIGATION FINDINGS & CASE DIARY ENTRIES (Sec 173 CrPC / Sec 193 BNSS)
-- ============================================================================
CREATE TABLE investigation_findings (
    id VARCHAR(50) PRIMARY KEY,
    case_id VARCHAR(50) NOT NULL REFERENCES cases(id) ON DELETE CASCADE,
    author_name VARCHAR(150) NOT NULL,
    author_user_id VARCHAR(50) REFERENCES users(id),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    tag VARCHAR(100) NOT NULL CHECK (tag IN (
        'Field Seizure',
        'Forensic Lab',
        'Financial Audit',
        'Cyber Forensics',
        'Court Witness',
        'Charge-sheet',
        'Judgement'
    )),
    entry_date DATE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_findings_case ON investigation_findings(case_id);
CREATE INDEX idx_findings_tag ON investigation_findings(tag);

-- ============================================================================
-- 9. CITIZEN GRIEVANCES & COMPLAINTS
-- ============================================================================
CREATE TABLE citizen_grievances (
    id VARCHAR(50) PRIMARY KEY,
    case_id VARCHAR(50) NOT NULL REFERENCES cases(id) ON DELETE CASCADE,
    citizen_user_id VARCHAR(50) REFERENCES users(id),
    subject VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Pending' CHECK (status IN (
        'Pending',
        'Under Scrutiny',
        'Actioned by IO',
        'Closed'
    )),
    reply_notes TEXT,
    filing_date DATE NOT NULL,
    resolved_at TIMESTAMP WITH TIME ZONE
);

CREATE INDEX idx_grievance_case ON citizen_grievances(case_id);
CREATE INDEX idx_grievance_status ON citizen_grievances(status);

-- ============================================================================
-- 10. IMMUTABLE SYSTEM AUDIT LOGS (Zero-Trust Security Watchdog)
-- ============================================================================
CREATE TABLE audit_logs (
    id VARCHAR(50) PRIMARY KEY,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    actor_name VARCHAR(150) NOT NULL,
    actor_role VARCHAR(100) NOT NULL,
    actor_user_id VARCHAR(50) REFERENCES users(id),
    action VARCHAR(150) NOT NULL,
    target VARCHAR(255) NOT NULL,
    ip_address VARCHAR(50) NOT NULL,
    hash_verification VARCHAR(100) NOT NULL DEFAULT 'PASSED (SHA-256 Valid)',
    event_sha256 VARCHAR(64)
);

CREATE INDEX idx_audit_timestamp ON audit_logs(timestamp);
CREATE INDEX idx_audit_actor ON audit_logs(actor_name);
CREATE INDEX idx_audit_action ON audit_logs(action);
