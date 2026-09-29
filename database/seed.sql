-- ============================================================================
-- National Legal & Investigation Document Repository (NLADR)
-- Production Seed Data (DML)
-- Preloaded with authentic government cases, cryptographic hashes & audit logs
-- ============================================================================

-- 1. SEED USERS
INSERT INTO users (id, username, name, role, custom_role, designation, department, badge_number, email, phone, aadhaar_masked, status, avatar_initials, approved_at) VALUES
('USR-ADM-001', 'admin.sharma', 'Dr. Arvind Sharma, IAS', 'Administrator', NULL, 'Principal Secretary & Chief Document Controller', 'Department of Legal & Administrative Affairs', 'IAS-1998-DL-042', 'arvind.sharma@nic.gov.in', '+91 98101 23456', NULL, 'Active', 'AS', '2024-01-10 10:00:00+00'),
('USR-IO-001', 'io.rathore', 'Vikramaditya Rathore', 'Investigator Officer', NULL, 'Superintendent of Police (Anti-Corruption & Cyber Special Branch)', 'Special Investigation Division', 'IPS-2012-DL-8841', 'vikram.rathore@delhipolice.gov.in', '+91 98712 34567', NULL, 'Active', 'VR', '2024-01-15 11:30:00+00'),
('USR-LEG-001', 'legal.mehta', 'Adv. Ananya Mehta', 'Legal Officer', NULL, 'Senior Public Prosecutor & Standing Government Counsel', 'Directorate of Prosecution, Ministry of Law & Justice', 'D/1429/2010', 'ananya.mehta@govcourt.nic.in', '+91 98234 56789', NULL, 'Active', 'AM', '2024-02-01 09:00:00+00'),
('USR-REC-001', 'record.verma', 'Om Prakash Verma', 'Record Officer', NULL, 'Chief Archivist & Digital Vault Custodian', 'Central Legal Archive & Record Depository', 'REC-DEL-4412', 'op.verma@nic.in', '+91 94120 98765', NULL, 'Active', 'OV', '2024-02-10 14:20:00+00'),
('USR-CIT-001', 'citizen.rajesh', 'Rajesh Kumar Sharma', 'Citizen', NULL, 'Citizen / Complainant', 'Public Grievance & Complainant Division', NULL, 'rajesh.sharma.delhi@gmail.com', '+91 98111 54321', 'XXXX-XXXX-8921', 'Active', 'RS', '2024-03-01 16:00:00+00'),
('USR-FSL-001', 'fsl.ramanujan', 'Dr. K. S. Ramanujan', 'Forensic Analyst', 'Director - CFSL Digital Forensics', 'Head of Digital & Cryptographic Forensics', 'Central Forensic Science Laboratory, CBI Campus', 'CFSL-DFW-2018-099', 'ramanujan.fsl@delhi.gov.in', '+91 98661 22334', NULL, 'Active', 'KR', '2024-03-10 10:00:00+00');

-- 2. SEED REGISTRATION REQUESTS
INSERT INTO registration_requests (id, name, email, phone, requested_role, custom_role, department, id_proof_type, id_proof_number, reason_justification, status, applied_at) VALUES
('REQ-2026-089', 'Dr. K. S. Ramanujan', 'ramanujan.fsl@delhi.gov.in', '+91 98661 22334', 'Forensic Analyst', 'Director - Forensic Science Laboratory', 'Central Forensic Science Laboratory, CBI Campus', 'Govt Department Identity Card (MHA)', 'CFSL-DFW-2018-099', 'Require cryptographic verification privileges to submit Section 65B forensic hash certificates for active cyber litigation.', 'Approved', '2026-09-17 09:45:00+00'),
('REQ-2026-090', 'Inspector Neha Sundaram', 'neha.sundaram@ips.gov.in', '+91 99887 76655', 'Investigator Officer', NULL, 'Economic Offences Wing (EOW), Unit IV', 'State Police Service Card', 'EOW-DL-5120', 'Assigned as co-investigator on multi-crore public procurement forgery inquiry NLADR/2026/041.', 'Pending', '2026-09-18 08:15:00+00'),
('REQ-2026-091', 'Pooja V. Deshmukh', 'pooja.deshmukh@rediffmail.com', '+91 97654 32100', 'Citizen', NULL, 'Individual Complainant', 'Aadhaar e-KYC Verification', 'XXXX-XXXX-4519', 'To track status of Cyber Impersonation & Online Extortion FIR No. 219/2026 lodged at Connaught Place PS.', 'Pending', '2026-09-18 11:20:00+00');

-- 3. SEED CASES
INSERT INTO cases (id, case_number, fir_number, title, category, statute_sections, complainant_name, complainant_id, complainant_contact, assigned_io_id, assigned_legal_officer_id, record_officer_id, status, priority, progress_percent, filing_date, disposed_date, disposal_outcome, court_name, presiding_judge, next_hearing_date, hearing_stage) VALUES
(
    'CAS-2026-0101', 
    'NLADR/2026/EOW-0101', 
    'FIR No. 412/2026, PS Barakhamba Road', 
    'State of NCT Delhi vs. Apex Tech Synthetics (Public Procurement Fraud)', 
    'Economic Offence & Financial Forgery', 
    'Sec 318, 336, 340 of Bharatiya Nyaya Sanhita (BNS) & Sec 66D IT Act', 
    'Rajesh Kumar Sharma', 
    'USR-CIT-001', 
    '+91 98111 54321', 
    'USR-IO-001', 
    'USR-LEG-001', 
    'USR-REC-001', 
    'Under Investigation', 
    'High', 
    65, 
    '2026-04-12', 
    NULL, 
    NULL, 
    'Special CBI & EOW Sessions Court, Patiala House', 
    'Hon''ble Special Judge R. K. Goel', 
    '2026-09-24', 
    'Arguments on Bail & Admissibility of Forensic Digital Logs'
),
(
    'CAS-2026-0102', 
    'NLADR/2026/CYB-0204', 
    'FIR No. 188/2026, Special Cyber Cell Mandir Marg', 
    'State vs. Syndicate of Fake Govt Land Registry Allotment Portals', 
    'Cyber Crime & Sovereign Impersonation', 
    'Sec 338, 318(4) BNS & Sec 66, 66C IT Act 2000', 
    'Department of Revenue & Land Records (Ex-Officio)', 
    NULL, 
    '+91 11 2309 4410', 
    'USR-IO-001', 
    'USR-LEG-001', 
    'USR-REC-001', 
    'Charge-sheet Filed', 
    'Urgent', 
    85, 
    '2026-02-18', 
    NULL, 
    NULL, 
    'Chief Metropolitan Magistrate Court, Rouse Avenue', 
    'Hon''ble CMM Smt. Manjula Joshi', 
    '2026-09-28', 
    'Scrutiny of Documents & Framing of Charges'
),
(
    'CAS-2026-0103', 
    'NLADR/2026/LGL-0309', 
    'Criminal Case No. 892/2025, Tis Hazari Courts', 
    'National Infrastructure Project Corrupt Cartelization Inquiry', 
    'Anti-Corruption & Prevention of Bribery', 
    'Sec 7, 13 Prevention of Corruption Act 1988 & Sec 61(2) BNS', 
    'Central Vigilance Commission (Reference # CVC/2025/998)', 
    NULL, 
    '+91 11 2465 1000', 
    'USR-IO-001', 
    'USR-LEG-001', 
    'USR-REC-001', 
    'In Trial', 
    'Urgent', 
    92, 
    '2025-11-10', 
    NULL, 
    NULL, 
    'Special Judge PC Act, Tis Hazari Court Complex', 
    'Hon''ble Special Judge K. L. Manhas', 
    '2026-09-22', 
    'Prosecution Evidence (PW-3 Cross Examination)'
),
(
    'CAS-2026-0104', 
    'NLADR/2026/GEN-0440', 
    'FIR No. 89/2026, PS Connaught Place', 
    'Investigation into Cross-Border Trade License Misuse & Duty Evasion', 
    'Customs, Revenue & Document Forgery', 
    'Sec 132 Customs Act & Sec 336(3) BNS', 
    'Directorate of Revenue Intelligence (DRI)', 
    NULL, 
    '+91 11 2337 9901', 
    NULL, 
    'USR-LEG-001', 
    'USR-REC-001', 
    'Under Investigation', 
    'Normal', 
    30, 
    '2026-09-02', 
    NULL, 
    NULL, 
    'ACMM Special Economic Offences Court', 
    'Hon''ble ACMM S. P. Srivastava', 
    '2026-10-15', 
    'Preliminary Cognizance & Verification of Records'
),
(
    'CAS-2026-0105', 
    'NLADR/2025/DIS-0991', 
    'FIR No. 551/2025, PS Hauz Khas', 
    'State vs. Global Media Piracy & Copyright Infringement Ring', 
    'Intellectual Property & Cyber Piracy', 
    'Sec 63, 65 Copyright Act 1957 & Sec 66 IT Act', 
    'Indian Motion Picture & Broadcasters Guild', 
    NULL, 
    '+91 22 2682 9900', 
    'USR-IO-001', 
    'USR-LEG-001', 
    'USR-REC-001', 
    'Solved/Disposed', 
    'Normal', 
    100, 
    '2025-06-14', 
    '2026-08-11', 
    'Conviction Secured: 3 Accused Sentenced to 3 Years Rigorous Imprisonment & ₹50 Lakh Fine Deposited.', 
    'District & Sessions Court, Saket Complex', 
    'Hon''ble ASJ M. K. Aggarwal', 
    'Disposed', 
    'Case Concluded / Sentenced'
);

-- 4. SEED PHYSICAL VAULT LOCATIONS (Dual Vault Warehouse Archival)
INSERT INTO physical_vault_locations (id, case_id, vault_number, rack_number, shelf_number, security_classification, barcode_rfid_tag, custodian_user_id, tamper_seal_intact) VALUES
('PVL-001', 'CAS-2026-0101', 'Vault-03 (Classified)', 'R-14', 'Shelf-B', 'Restricted Confidential', 'BAR-2026-EOW-0101', 'USR-REC-001', TRUE),
('PVL-002', 'CAS-2026-0102', 'Vault-01 (Digital Archive)', 'R-08', 'Shelf-D', 'Secret', 'BAR-2026-CYB-0204', 'USR-REC-001', TRUE),
('PVL-003', 'CAS-2026-0103', 'Vault-02 (Secure Hard Evidence)', 'R-02', 'Shelf-A', 'Secret', 'BAR-2025-LGL-0309', 'USR-REC-001', TRUE),
('PVL-004', 'CAS-2026-0104', 'Vault-04', 'R-05', 'Shelf-C', 'Restricted', 'BAR-2026-GEN-0440', 'USR-REC-001', TRUE),
('PVL-005', 'CAS-2026-0105', 'Vault-05 (Permanent Archival)', 'R-19', 'Shelf-F', 'Public Judicial Record', 'BAR-2025-DIS-0991', 'USR-REC-001', TRUE);

-- 5. SEED CASE TEAM MEMBERS
INSERT INTO case_team_members (id, case_id, member_name, member_role, phone, user_id) VALUES
('CTM-001', 'CAS-2026-0101', 'Vikramaditya Rathore', 'Lead Investigator Officer (SP)', '+91 98712 34567', 'USR-IO-001'),
('CTM-002', 'CAS-2026-0101', 'Insp. Devinder Chawla', 'Sub-Inspector (Field Seizures)', '+91 98111 22334', NULL),
('CTM-003', 'CAS-2026-0101', 'Dr. K. S. Ramanujan', 'Forensic Digital Analyst', '+91 98661 22334', 'USR-FSL-001'),
('CTM-004', 'CAS-2026-0101', 'Adv. Ananya Mehta', 'Prosecuting Officer', '+91 98234 56789', 'USR-LEG-001'),
('CTM-005', 'CAS-2026-0102', 'Vikramaditya Rathore', 'Lead Investigator Officer (SP)', '+91 98712 34567', 'USR-IO-001'),
('CTM-006', 'CAS-2026-0102', 'Insp. Tarun Nanda', 'Cyber Forensics & IP Tracer', '+91 98119 44556', NULL),
('CTM-007', 'CAS-2026-0102', 'Adv. Ananya Mehta', 'Prosecuting Officer', '+91 98234 56789', 'USR-LEG-001'),
('CTM-008', 'CAS-2026-0103', 'Vikramaditya Rathore', 'Lead Investigator Officer (SP)', '+91 98712 34567', 'USR-IO-001'),
('CTM-009', 'CAS-2026-0103', 'Adv. Ananya Mehta', 'Special Public Prosecutor', '+91 98234 56789', 'USR-LEG-001'),
('CTM-010', 'CAS-2026-0103', 'Om Prakash Verma', 'Physical Custody Guardian', '+91 94120 98765', 'USR-REC-001');

-- 6. SEED EVIDENCE DOCUMENTS (Cryptographic SHA-256 Ledger)
INSERT INTO evidence_documents (id, case_id, document_name, document_type, file_size_human, file_size_bytes, mime_type, storage_path, sha256_hash, tamper_verified, access_level, sec_65b_certificate_issued, sec_65b_cert_hash, uploaded_by_user_id, uploaded_by_name, uploaded_at) VALUES
(
    'DOC-2026-001', 
    'CAS-2026-0101', 
    'Certified Copy of Original FIR No. 412_2026.pdf', 
    'FIR Dossier', 
    '2.4 MB', 
    2516582, 
    'application/pdf', 
    '/vault/2026/CAS-0101/fir_412_2026.pdf', 
    'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 
    TRUE, 
    'Confidential', 
    TRUE, 
    '7d865e959b2466918c9863afca942d0fb89d7c9ac0c99bafc3749504ded97730', 
    'USR-IO-001', 
    'Vikramaditya Rathore', 
    '2026-04-12 11:24:00+00'
),
(
    'DOC-2026-002', 
    'CAS-2026-0101', 
    'Central Forensic Science Lab Report (Sec 65B Hash Cert).pdf', 
    'Forensic Evidence', 
    '14.8 MB', 
    15518924, 
    'application/pdf', 
    '/vault/2026/CAS-0101/cfsl_report_hash_cert.pdf', 
    '8f434346648f6b96df89dda901c5176b10a6d83961dd3c1ac88b59b2dc327aa4', 
    TRUE, 
    'Classified', 
    TRUE, 
    'f3b259da486011361c09224d2fee633c1f662ac52f3e6b42153bb72d52673292', 
    'USR-FSL-001', 
    'Dr. K. S. Ramanujan', 
    '2026-06-03 14:15:00+00'
),
(
    'DOC-2026-003', 
    'CAS-2026-0101', 
    'Draft Charge Sheet Under Sec 173 CrPC.pdf', 
    'Charge Sheet', 
    '8.1 MB', 
    8493465, 
    'application/pdf', 
    '/vault/2026/CAS-0101/draft_charge_sheet_173.pdf', 
    '4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a', 
    TRUE, 
    'Restricted', 
    FALSE, 
    NULL, 
    'USR-LEG-001', 
    'Adv. Ananya Mehta', 
    '2026-08-30 16:45:00+00'
),
(
    'DOC-2026-010', 
    'CAS-2026-0102', 
    'CERT-In Threat Intelligence & IP Attribution Dossier.pdf', 
    'Cyber Forensics', 
    '18.2 MB', 
    19084083, 
    'application/pdf', 
    '/vault/2026/CAS-0102/certin_threat_intel_ip.pdf', 
    'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 
    TRUE, 
    'Secret', 
    TRUE, 
    '99a632f1469e8b98e7ec8d7d91e6b3eb72ab870c946654be00fa740268ee7f07', 
    'USR-IO-001', 
    'Vikramaditya Rathore', 
    '2026-03-05 09:30:00+00'
),
(
    'DOC-2026-011', 
    'CAS-2026-0102', 
    'Final Police Report (Charge Sheet) Sec 193 BNSS.pdf', 
    'Charge Sheet', 
    '22.7 MB', 
    23802675, 
    'application/pdf', 
    '/vault/2026/CAS-0102/final_charge_sheet_bnss193.pdf', 
    '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 
    TRUE, 
    'Restricted', 
    TRUE, 
    '8350e5a3e24c153df2275c9f80692773a6139fe1b2a56b007d720032724428f7', 
    'USR-LEG-001', 
    'Adv. Ananya Mehta', 
    '2026-05-15 15:20:00+00'
),
(
    'DOC-2026-020', 
    'CAS-2026-0103', 
    'Forensic Document Examination Laboratory Report.pdf', 
    'Forensic Evidence', 
    '6.9 MB', 
    7235174, 
    'application/pdf', 
    '/vault/2025/CAS-0103/fdel_handwriting_exam.pdf', 
    '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 
    TRUE, 
    'Secret', 
    TRUE, 
    '1e4e88e36405a116da53384297ecd61f1414e5b682447b3099793f694b9ab936', 
    'USR-IO-001', 
    'Vikramaditya Rathore', 
    '2025-12-14 13:10:00+00'
),
(
    'DOC-2026-030', 
    'CAS-2026-0104', 
    'Seizure Memo of Fictitious Bills of Lading.pdf', 
    'Seizure Memo', 
    '3.1 MB', 
    3250585, 
    'application/pdf', 
    '/vault/2026/CAS-0104/seizure_memo_bills_lading.pdf', 
    'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35', 
    TRUE, 
    'Restricted', 
    FALSE, 
    NULL, 
    'USR-REC-001', 
    'Om Prakash Verma', 
    '2026-09-03 10:05:00+00'
),
(
    'DOC-2026-040', 
    'CAS-2026-0105', 
    'Final Certified Judgement and Order of Conviction.pdf', 
    'Judgement / Order', 
    '5.7 MB', 
    5976883, 
    'application/pdf', 
    '/vault/2025/CAS-0105/certified_judgement_saket.pdf', 
    '4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce', 
    TRUE, 
    'Public Record', 
    TRUE, 
    'ef2d127de37b942baad06145e54b0c619a1f22327b2ebbcfbec78f5564afe39d', 
    'USR-LEG-001', 
    'Adv. Ananya Mehta', 
    '2026-08-12 17:00:00+00'
);

-- 7. SEED CHAIN OF CUSTODY (Evidence Transfer Audit Trail)
INSERT INTO chain_of_custody (id, document_id, case_id, transferred_from_user_id, transferred_to_user_id, sender_name, recipient_name, custody_reason, sha256_verified_at_transfer, verification_status, transfer_timestamp) VALUES
('COC-2026-001', 'DOC-2026-001', 'CAS-2026-0101', 'USR-IO-001', 'USR-REC-001', 'Vikramaditya Rathore (IO)', 'Om Prakash Verma (Archivist)', 'Initial FIR docket archival into Vault-03', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'VERIFIED_MATCH', '2026-04-12 12:00:00+00'),
('COC-2026-002', 'DOC-2026-002', 'CAS-2026-0101', 'USR-FSL-001', 'USR-IO-001', 'Dr. K. S. Ramanujan (CFSL)', 'Vikramaditya Rathore (IO)', 'Digital forensic report transmission with Sec 65B hash certificate', '8f434346648f6b96df89dda901c5176b10a6d83961dd3c1ac88b59b2dc327aa4', 'VERIFIED_MATCH', '2026-06-03 14:30:00+00'),
('COC-2026-003', 'DOC-2026-002', 'CAS-2026-0101', 'USR-IO-001', 'USR-LEG-001', 'Vikramaditya Rathore (IO)', 'Adv. Ananya Mehta (Prosecutor)', 'Forensic dossier handover for court arguments on bail & evidence', '8f434346648f6b96df89dda901c5176b10a6d83961dd3c1ac88b59b2dc327aa4', 'VERIFIED_MATCH', '2026-06-05 10:15:00+00'),
('COC-2026-004', 'DOC-2026-011', 'CAS-2026-0102', 'USR-LEG-001', 'USR-REC-001', 'Adv. Ananya Mehta (Prosecutor)', 'Om Prakash Verma (Archivist)', 'Signed charge-sheet permanent archival under Sec 193 BNSS', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'VERIFIED_MATCH', '2026-05-15 16:00:00+00');

-- 8. SEED INVESTIGATION FINDINGS (Case Diary Entries)
INSERT INTO investigation_findings (id, case_id, author_name, author_user_id, title, description, tag, entry_date) VALUES
('FND-01', 'CAS-2026-0101', 'Vikramaditya Rathore', 'USR-IO-001', 'Preliminary Seizure of Servers & Audit Trails', 'Executing search warrant at Nehru Place corporate office. 4 NVMe hard drives and cloud gateway logs seized under panchnama.', 'Field Seizure', '2026-04-15'),
('FND-02', 'CAS-2026-0101', 'Dr. K. S. Ramanujan', 'USR-FSL-001', 'Forensic Hash Match Confirms Document Alteration', 'Comparative cryptographic analysis of e-tender quotation PDF matches modified digital signatures using compromised cert #4491.', 'Forensic Lab', '2026-06-02'),
('FND-03', 'CAS-2026-0101', 'Vikramaditya Rathore', 'USR-IO-001', 'Bank Remittance Trace Completed', 'Traced diversion of ₹4.82 Crores into three dummy shell corporations incorporated in Mauritius. Letters Rogatory initiated.', 'Financial Audit', '2026-08-20'),
('FND-10', 'CAS-2026-0102', 'Vikramaditya Rathore', 'USR-IO-001', 'IP Origin & Domain Seizure', 'Phishing portal hosted on offshore bulletproof servers seized with assistance of CERT-In & Interpol Notice.', 'Cyber Forensics', '2026-03-01'),
('FND-11', 'CAS-2026-0102', 'Adv. Ananya Mehta', 'USR-LEG-001', 'Formal Charge-sheet Finalized', '900-page comprehensive charge-sheet filed before the Learned CMM with Section 65B certified evidence binder.', 'Charge-sheet', '2026-05-14'),
('FND-20', 'CAS-2026-0103', 'Adv. Ananya Mehta', 'USR-LEG-001', 'Prosecution Witness PW-1 & PW-2 Deposition Concluded', 'Official handwriting expert affirmed that clandestine ledger signatures belong to Accused No. 1.', 'Court Witness', '2026-01-18'),
('FND-30', 'CAS-2026-0105', 'Adv. Ananya Mehta', 'USR-LEG-001', 'Final Conviction Order Delivered', 'The Learned Sessions Court upheld all prosecution charges; certified judgement copy archived in permanent digital vault.', 'Judgement', '2026-08-11');

-- 9. SEED CITIZEN GRIEVANCES
INSERT INTO citizen_grievances (id, case_id, citizen_user_id, subject, status, reply_notes, filing_date) VALUES
('GRV-01', 'CAS-2026-0101', 'USR-CIT-001', 'Request for status update on recovering defrauded earnest money', 'Actioned by IO', 'Property attachment notice issued to Registrar of Companies under Section 107 BNSS.', '2026-07-10');

-- 10. SEED IMMUTABLE AUDIT LOGS
INSERT INTO audit_logs (id, timestamp, actor_name, actor_role, actor_user_id, action, target, ip_address, hash_verification, event_sha256) VALUES
('LOG-9921', '2026-09-18 12:05:22+00', 'Adv. Ananya Mehta', 'Legal Officer', 'USR-LEG-001', 'Hearing Outcome Updated', 'CAS-2026-0103 ( Tis Hazari Special Court )', '10.14.22.81 (Gov-Intranet)', 'PASSED (SHA-256 Valid)', 'd9b9a67a83709b1f2479e0bf55403487c6999a091496a7ffc39f28ec56133be4'),
('LOG-9920', '2026-09-18 10:44:11+00', 'Vikramaditya Rathore', 'Investigator Officer', 'USR-IO-001', 'Investigation Diary Entry Added', 'CAS-2026-0101 (Seizure Memo Annexure-IV)', '10.14.22.39 (Cyber Cell)', 'PASSED (SHA-256 Valid)', '831a29397984f88e22e53ef7a0e3636f406db09fe43a1f8101a2f90a2a5146c8'),
('LOG-9919', '2026-09-18 09:12:03+00', 'Dr. Arvind Sharma, IAS', 'Administrator', 'USR-ADM-001', 'Access Role Approved', 'Inspector Rameshwar Dutt (EOW)', '10.14.1.2 (Secretariat)', 'PASSED (SHA-256 Valid)', '6b2e3b1c5d9f0a2e7c4b8d1a3f6e9c2b5d8a1f4e7c0b3d6a9f2e5b8c1d4a7f0e'),
('LOG-9918', '2026-09-17 17:30:45+00', 'Om Prakash Verma', 'Record Officer', 'USR-REC-001', 'Physical Chain of Custody Handover', 'Exhibit Ex-101/A transferred to CFSL Ballistics', '10.14.8.100 (Central Vault)', 'PASSED (SHA-256 Valid)', '7a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b');
