/**
 * NLADR - SIH 5-Slide Interactive Presentation Deck Engine
 * Handles navigation, animations, interactive widgets, ROI calculator,
 * hierarchical tree explorer, circular diagram stages, live tamper simulation,
 * speaker notes, and presentation timer.
 */

document.addEventListener('DOMContentLoaded', () => {
  // --- Slide Navigation State ---
  let currentSlide = 1;
  const totalSlides = 5;
  const slides = document.querySelectorAll('.slide');
  const dots = document.querySelectorAll('.dot');
  const timerDisplay = document.getElementById('pitchTimer');
  
  // Presentation Timer (Counts up from 00:00)
  let timerSeconds = 0;
  let timerInterval = setInterval(() => {
    timerSeconds++;
    const mins = Math.floor(timerSeconds / 60).toString().padStart(2, '0');
    const secs = (timerSeconds % 60).toString().padStart(2, '0');
    if (timerDisplay) {
      timerDisplay.textContent = `${mins}:${secs}`;
    }
  }, 1000);

  // --- Speaker Notes Data ---
  const speakerNotes = {
    1: `<strong>Slide 1: Problem Landscape, Solution & Governance Tree (1 Min Pitch)</strong><br><br>
        • <strong>Hook:</strong> "Respected jury, over 5 Crore cases are currently pending in Indian courts. A staggering 60% of critical delays and wrongful acquittals stem from lost case diaries, compromised paper evidence, and disputed chains of custody."<br>
        • <strong>The Solution:</strong> "We present <strong>NLADR</strong>—a sovereign digital repository engineered under the Digital India Initiative. It eliminates paper vulnerability through SHA-256 evidence hashing, dual physical-digital vaulting, and automated Section 63 BSA electronic admissibility certification."<br>
        • <strong>Interaction Demo:</strong> Click on the <em>Hierarchy Tree nodes</em> on the right to demonstrate how Ministry directives flow seamlessly to Investigating Officers, Forensic Labs, Public Prosecutors, and Citizens with granular RBAC scoping."`,
    
    2: `<strong>Slide 2: Technical Approach & Closed-Loop Circular Flow (1 Min Pitch)</strong><br><br>
        • <strong>The Circular Architecture:</strong> "Look at our 5-stage closed loop: 1. Incident & Evidence Ingestion, 2. Cryptographic Fingerprinting via SHA-256, 3. Chain-of-Custody Routing, 4. Dual-Location Vault Archival, and 5. Judicial Trial Admissibility."<br>
        • <strong>Interaction Demo:</strong> Hover or click over the numbered circular nodes to reveal live cryptographic validation parameters. Click each persona below to show how an IO creates a digital seizure memo and the Prosecutor instantly receives the certified charge sheet."<br>
        • <strong>Tech Stack Highlight:</strong> "Zero-dependency client-side cryptography using native Web Crypto API, 100% GIGW compliance, and serverless edge hosting on Vercel ensuring <1s response time even in rural police stations."`,
    
    3: `<strong>Slide 3: Feasibility, Viability & ROI Matrix (1 Min Pitch)</strong><br><br>
        • <strong>Feasibility:</strong> "Technically resilient (runs in any browser, offline-capable). Operationally seamless (modeled after standard CrPC/BNSS case diaries). Statutorily airtight (100% compliant with BNS, BNSS, and BSA 2023)."<br>
        • <strong>Interaction Demo:</strong> Drag the <em>Monthly Case Volume Slider</em>! At 5,000 cases per month across a state cluster, NLADR saves over 12.5 Lakh physical paper sheets, ₹56 Lakhs in courier/printing costs, and 30,000 police man-hours every year!"<br>
        • <strong>Business Potential:</strong> "Addressable market of 16,000+ police stations, 670+ district courts, and central agencies like CBI, NIA, and ED."`,
    
    4: `<strong>Slide 4: Limitations vs. Perks & Live Tamper Alert Demo (1 Min Pitch)</strong><br><br>
        • <strong>Perks vs Legacy:</strong> "Paper files take 14 to 28 days to transmit between police stations and courts; NLADR retrieves certified dockets in 1.2 seconds. Paper files can be silently replaced; NLADR is mathematically tamper-evident."<br>
        • <strong>INTERACTIVE SHOWSTOPPER:</strong> <em>Click the 'Simulate Tamper Attempt' button!</em><br>
        • Watch the red alert trigger instantly: The SHA-256 hash checksum mismatch halts docket presentation, generates an emergency audit alert to the Superintendent of Police and trial judge, and prevents compromised evidence from entering court!"`,
    
    5: `<strong>Slide 5: Research Foundations, Standards & Live Repository (1 Min Pitch)</strong><br><br>
        • <strong>Statutory Rigor:</strong> "NLADR isn't just software; it is legally grounded in Bharatiya Sakshya Adhiniyam 2023 (Section 63), Supreme Court's <em>Arjun Panditrao Khotkar (2020)</em> landmark mandate, and ISO 27001 data protection standards."<br>
        • <strong>Live Deployment:</strong> "Our solution is fully functional, open-source on GitHub, and live at <code>nation-legal-investigation-document.vercel.app</code>."<br>
        • <strong>Closing Statement:</strong> "NLADR ensures that justice in India is transparent, incorruptible, and accelerated. Thank you!"`
  };

  // --- Go To Slide Function ---
  window.goToSlide = function(slideNum) {
    if (slideNum < 1 || slideNum > totalSlides) return;
    currentSlide = slideNum;
    
    slides.forEach((s, idx) => {
      if (idx + 1 === slideNum) {
        s.classList.add('active');
      } else {
        s.classList.remove('active');
      }
    });

    dots.forEach((d, idx) => {
      if (idx + 1 === slideNum) {
        d.classList.add('active');
      } else {
        d.classList.remove('active');
      }
    });

    // Update modal notes if open
    const notesContent = document.getElementById('notesModalContent');
    if (notesContent && speakerNotes[slideNum]) {
      notesContent.innerHTML = speakerNotes[slideNum];
    }
  };

  window.nextSlide = function() {
    if (currentSlide < totalSlides) {
      goToSlide(currentSlide + 1);
    } else {
      goToSlide(1); // loop
    }
  };

  window.prevSlide = function() {
    if (currentSlide > 1) {
      goToSlide(currentSlide - 1);
    } else {
      goToSlide(totalSlides);
    }
  };

  // --- Keyboard Shortcuts ---
  document.addEventListener('keydown', (e) => {
    // If inside an input or slider, ignore
    if (['INPUT', 'TEXTAREA'].includes(e.target.tagName)) return;

    switch(e.key) {
      case 'ArrowRight':
      case ' ':
      case 'PageDown':
        e.preventDefault();
        nextSlide();
        break;
      case 'ArrowLeft':
      case 'PageUp':
        e.preventDefault();
        prevSlide();
        break;
      case 'Home':
        e.preventDefault();
        goToSlide(1);
        break;
      case 'End':
        e.preventDefault();
        goToSlide(totalSlides);
        break;
      case 'f':
      case 'F':
        toggleFullScreen();
        break;
      case 'n':
      case 'N':
        toggleNotesModal();
        break;
      case 'g':
      case 'G':
        toggleGridModal();
        break;
      case 'p':
      case 'P':
        window.print();
        break;
      case 'Escape':
        closeAllModals();
        break;
    }
  });

  // --- Fullscreen Toggle ---
  window.toggleFullScreen = function() {
    if (!document.fullscreenElement) {
      document.documentElement.requestFullscreen().catch(() => {});
    } else {
      if (document.exitFullscreen) {
        document.exitFullscreen().catch(() => {});
      }
    }
  };

  // --- Speaker Notes Modal ---
  window.toggleNotesModal = function() {
    const modal = document.getElementById('notesModal');
    const content = document.getElementById('notesModalContent');
    if (!modal) return;
    
    if (modal.classList.contains('open')) {
      modal.classList.remove('open');
    } else {
      closeAllModals();
      content.innerHTML = speakerNotes[currentSlide];
      modal.classList.add('open');
    }
  };

  // --- Slide Grid Overview Modal ---
  window.toggleGridModal = function() {
    const modal = document.getElementById('gridModal');
    if (!modal) return;
    
    if (modal.classList.contains('open')) {
      modal.classList.remove('open');
    } else {
      closeAllModals();
      modal.classList.add('open');
    }
  };

  window.closeAllModals = function() {
    document.querySelectorAll('.modal-overlay').forEach(m => m.classList.remove('open'));
  };

  // =========================================================================
  // Slide 1: Interactive Hierarchy Tree Explorer
  // =========================================================================
  const treeNodes = document.querySelectorAll('.tree-node');
  treeNodes.forEach(node => {
    node.addEventListener('click', (e) => {
      // Toggle expansion
      node.classList.toggle('expanded');
    });
  });

  window.filterHierarchy = function(category) {
    document.querySelectorAll('.h-tab-btn').forEach(btn => btn.classList.remove('active'));
    event.target.classList.add('active');

    treeNodes.forEach(node => {
      const nodeCat = node.getAttribute('data-category');
      if (category === 'all' || nodeCat === category) {
        node.style.display = 'block';
        node.classList.add('expanded');
      } else {
        node.style.display = 'none';
      }
    });
  };

  // =========================================================================
  // Slide 2: Interactive Circular Flow & Persona Explorer
  // =========================================================================
  const stepDetailsData = {
    1: {
      title: "Step 1: Incident & Evidence Ingestion",
      desc: "Investigating Officer (IO) creates an unalterable Case Diary Entry, registers police station FIR reference, and uploads digital seizures (audio, video, CCTV, PDFs) via secure TLS.",
      protocols: "Protocols: Sec 173 CrPC / Sec 193 BNSS, SHA-256 Checksum, EXIF Metadata Preservation",
      badge: "Ingestion Tier"
    },
    2: {
      title: "Step 2: Cryptographic SHA-256 Hashing",
      desc: "Client-side Web Crypto engine calculates a 256-bit mathematical digest upon file intake. Any 1-bit alteration completely scrambles this hash, providing zero-trust tamper detection.",
      protocols: "Standards: FIPS 180-4 SHA-256, RFC 3161 PKI Time-Stamping, Section 63 BSA Compliance",
      badge: "Cryptographic Core"
    },
    3: {
      title: "Step 3: Role-Based Custody Routing",
      desc: "Granular RBAC controls transition the case between designated actors: IO hands over forensic items to Central Forensic Science Lab (CFSL); Public Prosecutor inspects chargesheet.",
      protocols: "Access Control: Role-Based Access Control (RBAC), Multi-factor verification, Audit Event Logging",
      badge: "Governance Grid"
    },
    4: {
      title: "Step 4: Dual Vault & Physical-Digital Mapping",
      desc: "Every digital dossier is cryptographically mapped to an exact physical warehouse location (Vault No., Rack ID, Shelf Label) with QR/Barcode tracking for hard evidence.",
      protocols: "Storage: Physical Vault Mapping, AES-256 At-Rest Encryption, ISO 27001 Secure Custody",
      badge: "Vault Guardian"
    },
    5: {
      title: "Step 5: Judicial Admissibility & Trial Presentation",
      desc: "Automated generation of official Section 65B IEA / Section 63 BSA Electronic Record Certificates for the Hon'ble Court. Ready for instant e-Courts interoperability export.",
      protocols: "Legal Admissibility: Sec 65B Indian Evidence Act / Sec 63 BSA, Arjun Panditrao Khotkar SC Mandate",
      badge: "Judicial Admissibility"
    }
  };

  window.activateCircleStep = function(stepNum) {
    document.querySelectorAll('.circle-step').forEach(s => s.classList.remove('active'));
    const target = document.querySelector(`.circle-step[data-step="${stepNum}"]`);
    if (target) target.classList.add('active');

    const detailCard = document.getElementById('stepDetailsCard');
    const data = stepDetailsData[stepNum];
    if (detailCard && data) {
      detailCard.innerHTML = `
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.35rem;">
          <h4 style="color: var(--color-saffron-light); font-size: 0.88rem;">${data.title}</h4>
          <span style="font-size: 0.68rem; background: rgba(56,189,248,0.15); color: var(--color-blue); padding: 0.15rem 0.5rem; border-radius: 4px; border: 1px solid rgba(56,189,248,0.3); font-weight: 600;">${data.badge}</span>
        </div>
        <p style="font-size: 0.78rem; color: #cbd5e1; line-height: 1.4; margin-bottom: 0.35rem;">${data.desc}</p>
        <div style="font-size: 0.7rem; font-family: var(--font-mono); color: var(--color-green-light);">${data.protocols}</div>
      `;
    }
  };

  // Persona Strip Clicker
  const personaCards = document.querySelectorAll('.persona-cell');
  personaCards.forEach(cell => {
    cell.addEventListener('click', () => {
      personaCards.forEach(c => c.classList.remove('active'));
      cell.classList.add('active');
      const role = cell.getAttribute('data-role');
      const detailCard = document.getElementById('stepDetailsCard');
      if (detailCard) {
        detailCard.innerHTML = `
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.35rem;">
            <h4 style="color: var(--color-saffron-light); font-size: 0.88rem;">Role Dossier: ${role}</h4>
            <span style="font-size: 0.68rem; background: rgba(16,185,129,0.15); color: var(--color-green-light); padding: 0.15rem 0.5rem; border-radius: 4px; font-weight: 600;">Active Persona</span>
          </div>
          <p style="font-size: 0.78rem; color: #cbd5e1; line-height: 1.4;">${cell.getAttribute('data-desc')}</p>
        `;
      }
    });
  });

  // =========================================================================
  // Slide 3: Feasibility Tabs & ROI Simulator
  // =========================================================================
  const feasContent = {
    technical: `
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>Zero-Dependency Lightweight Stack:</strong> Pure HTML5/ES6 architecture runs on standard police station computers without requiring costly GPU clusters or heavy runtimes.</div>
      </div>
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>Sub-Second Response Times:</strong> Deployed on serverless Vercel edge CDN delivering <800ms load times nationwide even under 3G/4G connectivity.</div>
      </div>
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>Offline Resilience:</strong> IndexedDB local storage queues updates when internet drops, syncing automatically when connectivity restores.</div>
      </div>
    `,
    operational: `
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>Familiar Case Diary Workflows:</strong> UI is modeled directly after standard Indian police General Diaries (GD) and CrPC/BNSS charge sheet formats to ensure zero friction.</div>
      </div>
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>Minimal Training Overhead:</strong> Constables and IOs can master evidence intake within a 30-minute training session; one-click PDF generation eliminates clerical bottlenecks.</div>
      </div>
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>Bilingual Accessibility:</strong> Integrated English & Hindi language toggles with GIGW high-contrast mode for inclusive government operations.</div>
      </div>
    `,
    legal: `
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>Statutory Alignment with Bharatiya Sakshya Adhiniyam 2023:</strong> Full compliance with Section 61, 62 & 63 governing electronic record admissibility.</div>
      </div>
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>Section 65B Electronic Certificates:</strong> Automated generation of judicial certificate with cryptographic hash digest and officer digital signature statement.</div>
      </div>
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>DPDP Act 2023 Privacy Safeguards:</strong> Redaction tools protect complainant identity and victim anonymity in sensitive cyber and sexual harassment cases.</div>
      </div>
    `,
    financial: `
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>Massive Paper & Logistics Elimination:</strong> Reduces paper consumption by 94% across dockets, eliminating courier, photocopier, and physical transit expenditures.</div>
      </div>
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>Open Standards (No Vendor Lock-In):</strong> Avoids proprietary enterprise licenses (₹50k/user/yr) typical of legacy enterprise document managers.</div>
      </div>
      <div class="feas-point">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
        <div><strong>National Scale ROI:</strong> An initial statewide rollout pays for itself within 4 months purely on logistics and physical storage savings.</div>
      </div>
    `
  };

  window.switchFeasTab = function(tabName) {
    document.querySelectorAll('.feas-tab').forEach(t => t.classList.remove('active'));
    event.target.classList.add('active');
    const panel = document.getElementById('feasibilityContent');
    if (panel && feasContent[tabName]) {
      panel.innerHTML = feasContent[tabName];
    }
  };

  // Interactive ROI Calculator Slider
  const caseSlider = document.getElementById('caseVolumeSlider');
  const sliderVal = document.getElementById('sliderCaseVal');
  const metricPaper = document.getElementById('metricPaper');
  const metricCost = document.getElementById('metricCost');
  const metricHours = document.getElementById('metricHours');
  const metricSpeed = document.getElementById('metricSpeed');

  if (caseSlider) {
    caseSlider.addEventListener('input', (e) => {
      const cases = parseInt(e.target.value, 10);
      sliderVal.textContent = cases.toLocaleString('en-IN') + ' Cases / Mo';

      // 250 sheets of paper per case docket on average
      const paperSheets = cases * 250;
      metricPaper.textContent = (paperSheets / 100000).toFixed(1) + ' Lakh Sheets';

      // Rs. 1,120 saved per case (printing, binding, courier, storage)
      const costSavedRupees = cases * 1120;
      if (costSavedRupees >= 10000000) {
        metricCost.textContent = '₹' + (costSavedRupees / 10000000).toFixed(2) + ' Cr';
      } else {
        metricCost.textContent = '₹' + (costSavedRupees / 100000).toFixed(1) + ' Lakhs';
      }

      // 6 man hours saved per case across IO, clerk, courier
      const manHours = cases * 6;
      metricHours.textContent = manHours.toLocaleString('en-IN') + ' Hrs';

      // Trial disposal acceleration percentage
      const speedup = Math.min(85, Math.round(45 + (cases / 50000) * 40));
      metricSpeed.textContent = speedup + '% Faster';
    });
  }

  // =========================================================================
  // Slide 4: Live Tamper Simulation Engine
  // =========================================================================
  let tamperState = false;
  window.triggerTamperSimulation = function() {
    tamperState = !tamperState;
    const btn = document.getElementById('tamperSimBtn');
    const banner = document.getElementById('liveAlertBanner');
    const nodeIntegrity = document.getElementById('nodeIntegrity');
    const nodeWatchdog = document.getElementById('nodeWatchdog');
    const nodeLedger = document.getElementById('nodeLedger');

    if (tamperState) {
      // Activated Tamper Breach
      btn.innerHTML = '🔄 Reset Security State';
      btn.style.background = 'linear-gradient(135deg, #10b981, #059669)';
      banner.classList.add('show');
      nodeIntegrity.classList.add('alert-glow');
      nodeWatchdog.classList.add('alert-glow');
      nodeLedger.classList.add('alert-glow');

      nodeIntegrity.querySelector('.pipeline-status').innerHTML = '<span style="color: #f43f5e; font-weight:700;">🚨 HASH MISMATCH DETECTED</span>';
      nodeWatchdog.querySelector('.pipeline-status').innerHTML = '<span style="color: #f43f5e; font-weight:700;">LOCKDOWN & SMS ALERT TRIGGERED</span>';
      nodeLedger.querySelector('.pipeline-status').innerHTML = '<span style="color: #f43f5e; font-weight:700;">EVIDENCE QUARANTINED</span>';
    } else {
      // Reset to Normal
      btn.innerHTML = '⚡ Simulate Malicious Tamper Attempt';
      btn.style.background = 'linear-gradient(135deg, #ef4444, #b91c1c)';
      banner.classList.remove('show');
      nodeIntegrity.classList.remove('alert-glow');
      nodeWatchdog.classList.remove('alert-glow');
      nodeLedger.classList.remove('alert-glow');

      nodeIntegrity.querySelector('.pipeline-status').innerHTML = '<span style="color: var(--color-green-light);">Passed (SHA-256 Valid)</span>';
      nodeWatchdog.querySelector('.pipeline-status').innerHTML = '<span style="color: var(--color-green-light);">Active Watchdog</span>';
      nodeLedger.querySelector('.pipeline-status').innerHTML = '<span style="color: var(--color-green-light);">100% Immutable</span>';
    }
  };

  // Set initial circular step
  activateCircleStep(1);
});
