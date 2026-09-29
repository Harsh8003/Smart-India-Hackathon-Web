/**
 * National Legal & Investigation Document Repository (NLADR)
 * Authentication & Access Portal Handler
 */

class AuthManager {
  constructor() {
    this.currentCaptcha = "";
    this.init();
  }

  init() {
    this.generateCaptcha();
    this.setupEventListeners();
    this.setupJurisdictionSelectors();
  }

  generateCaptcha() {
    const chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
    let captcha = "";
    for (let i = 0; i < 5; i++) {
      captcha += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    this.currentCaptcha = captcha;

    const captchaDisplay = document.getElementById("captchaDisplay");
    if (captchaDisplay) {
      captchaDisplay.textContent = captcha;
    }

    const regCaptchaDisplay = document.getElementById("regCaptchaDisplay");
    if (regCaptchaDisplay) {
      regCaptchaDisplay.textContent = captcha;
    }
  }

  setupEventListeners() {
    // Refresh Captcha buttons
    document.querySelectorAll(".captcha-refresh-btn").forEach(btn => {
      btn.addEventListener("click", (e) => {
        e.preventDefault();
        this.generateCaptcha();
      });
    });

    // Login Role selection - dynamic 'Others' handler
    const loginRoleSelect = document.getElementById("loginRoleSelect");
    const loginConditionalBox = document.getElementById("loginConditionalBox");
    const loginCustomRoleInput = document.getElementById("loginCustomRoleInput");

    if (loginRoleSelect && loginConditionalBox) {
      loginRoleSelect.addEventListener("change", (e) => {
        if (e.target.value === "Others") {
          loginConditionalBox.style.display = "block";
          if (loginCustomRoleInput) loginCustomRoleInput.required = true;
        } else {
          loginConditionalBox.style.display = "none";
          if (loginCustomRoleInput) {
            loginCustomRoleInput.required = false;
            loginCustomRoleInput.value = "";
          }
        }
      });
    }

    // Register Role selection - dynamic 'Others' handler
    const regRoleSelect = document.getElementById("regRoleSelect");
    const regConditionalBox = document.getElementById("regConditionalBox");
    const regCustomRoleInput = document.getElementById("regCustomRoleInput");

    if (regRoleSelect && regConditionalBox) {
      regRoleSelect.addEventListener("change", (e) => {
        if (e.target.value === "Others") {
          regConditionalBox.style.display = "block";
          if (regCustomRoleInput) regCustomRoleInput.required = true;
        } else {
          regConditionalBox.style.display = "none";
          if (regCustomRoleInput) {
            regCustomRoleInput.required = false;
            regCustomRoleInput.value = "";
          }
        }
      });
    }

    // Login Tabs (Sign In vs Register)
    const tabLogin = document.getElementById("tabLogin");
    const tabRegister = document.getElementById("tabRegister");
    const formLogin = document.getElementById("formLogin");
    const formRegister = document.getElementById("formRegister");

    if (tabLogin && tabRegister) {
      tabLogin.addEventListener("click", () => {
        tabLogin.classList.add("active");
        tabRegister.classList.remove("active");
        if (formLogin) formLogin.style.display = "block";
        if (formRegister) formRegister.style.display = "none";
      });

      tabRegister.addEventListener("click", () => {
        tabRegister.classList.add("active");
        tabLogin.classList.remove("active");
        if (formLogin) formLogin.style.display = "none";
        if (formRegister) formRegister.style.display = "block";
        this.generateCaptcha();
      });
    }

    // Handle Login Form Submit
    if (formLogin) {
      formLogin.addEventListener("submit", (e) => {
        e.preventDefault();
        this.handleLoginSubmit();
      });
    }

    // Handle Register Form Submit
    if (formRegister) {
      formRegister.addEventListener("submit", (e) => {
        e.preventDefault();
        this.handleRegisterSubmit();
      });
    }

    // Demo Role Switcher quick buttons
    document.querySelectorAll(".role-chip-btn").forEach(btn => {
      btn.addEventListener("click", (e) => {
        const targetRole = btn.getAttribute("data-role");
        this.quickSwitchRole(targetRole);
      });
    });

    // Global Logout button
    const logoutBtn = document.getElementById("logoutNavBtn");
    if (logoutBtn) {
      logoutBtn.addEventListener("click", () => {
        appState.logout();
        window.appRouter.render();
        window.showToast("You have been securely logged out from NLADR Portal.", "normal");
      });
    }

    // Forgot Password link & modal workflow
    this.setupForgotPasswordWorkflow();
  }

  
  setupJurisdictionSelectors() {
    const typeSelect = document.getElementById("loginJurisdictionType");
    const stateSelect = document.getElementById("loginStateSelect");
    const districtSelect = document.getElementById("loginDistrictSelect");
    const policeBaseSelect = document.getElementById("loginPoliceBaseSelect");
    const stateLabel = document.getElementById("lblStateSelect");

    if (!typeSelect || !stateSelect || !districtSelect) return;

    const populateStatesOrUTs = () => {
      const isUT = typeSelect.value === "UT";
      const source = isUT ? (typeof INDIAN_UT_DISTRICTS !== "undefined" ? INDIAN_UT_DISTRICTS : {}) : (typeof INDIAN_STATES_DISTRICTS !== "undefined" ? INDIAN_STATES_DISTRICTS : {});
      const keys = Object.keys(source).sort();

      if (stateLabel) {
        stateLabel.textContent = isUT ? "Select Union Territory" : "Select State";
      }

      stateSelect.innerHTML = '<option value="">Select ' + (isUT ? "Union Territory" : "State") + '</option>' + 
        keys.map(k => '<option value="' + k + '">' + k + '</option>').join("");
      
      districtSelect.innerHTML = '<option value="">Select District</option>';
      if (policeBaseSelect) {
        policeBaseSelect.innerHTML = '<option value="">All Bases / Station Units</option>';
      }

      if (isUT && keys.includes("Delhi (NCT)")) {
        stateSelect.value = "Delhi (NCT)";
        populateDistricts();
      } else if (!isUT && keys.includes("Maharashtra")) {
        stateSelect.value = "Maharashtra";
        populateDistricts();
      } else if (keys.length > 0) {
        stateSelect.value = keys[0];
        populateDistricts();
      }
    };

    const populateDistricts = () => {
      const isUT = typeSelect.value === "UT";
      const source = isUT ? (typeof INDIAN_UT_DISTRICTS !== "undefined" ? INDIAN_UT_DISTRICTS : {}) : (typeof INDIAN_STATES_DISTRICTS !== "undefined" ? INDIAN_STATES_DISTRICTS : {});
      const selected = stateSelect.value;
      const districts = (source[selected] || []).slice().sort();

      districtSelect.innerHTML = '<option value="">Select District</option>' + 
        districts.map(d => '<option value="' + d + '">' + d + '</option>').join("");

      if (districts.length > 0) {
        districtSelect.value = districts[0];
        populateBases();
      }
    };

    const populateBases = () => {
      if (!policeBaseSelect) return;
      const dist = districtSelect.value || "Central";
      policeBaseSelect.innerHTML = 
        '<option value="">All Police Stations in ' + dist + '</option>' +
        '<option value="PS ' + dist + ' Sadar" selected>PS ' + dist + ' Sadar (Commission Division)</option>' +
        '<option value="PS ' + dist + ' City Central">PS ' + dist + ' City Central</option>' +
        '<option value="PS ' + dist + ' Cyber Crime Unit">PS ' + dist + ' Cyber Crime Unit</option>' +
        '<option value="PS ' + dist + ' Economic Offences Wing">PS ' + dist + ' Economic Offences Wing</option>';
    };

    typeSelect.addEventListener("change", populateStatesOrUTs);
    stateSelect.addEventListener("change", populateDistricts);
    districtSelect.addEventListener("change", populateBases);

    populateStatesOrUTs();
  }

  setupForgotPasswordWorkflow() {
    const linkForgot = document.getElementById("linkForgotPassword");
    const modalForgot = document.getElementById("modalForgotPassword");

    if (linkForgot && modalForgot) {
      linkForgot.addEventListener("click", () => {
        this.openForgotPassword();
      });
    }

    const btnNext1 = document.getElementById("btnForgotNext1");
    const btnNext2 = document.getElementById("btnForgotNext2");
    const btnSubmit = document.getElementById("btnForgotSubmit");
    const btnBack1 = document.getElementById("btnForgotBack1");
    const btnBack2 = document.getElementById("btnForgotBack2");
    const btnComplete = document.getElementById("btnForgotComplete");

    if (btnNext1) {
      btnNext1.addEventListener("click", () => this.handleForgotStep1());
    }

    if (btnNext2) {
      btnNext2.addEventListener("click", () => this.handleForgotStep2());
    }

    if (btnSubmit) {
      btnSubmit.addEventListener("click", () => this.handleForgotStep3());
    }

    if (btnBack1) {
      btnBack1.addEventListener("click", () => this.showForgotStep(1));
    }

    if (btnBack2) {
      btnBack2.addEventListener("click", () => this.showForgotStep(2));
    }

    if (btnComplete) {
      btnComplete.addEventListener("click", () => {
        const modal = document.getElementById("modalForgotPassword");
        if (modal) modal.classList.remove("open");

        if (this.resetUser) {
          const idInput = document.getElementById("loginIdentifier");
          const passInput = document.getElementById("loginPassword");
          const roleSelect = document.getElementById("loginRoleSelect");

          if (idInput) idInput.value = this.resetUser.username;
          if (passInput) passInput.value = this.newAssignedPassword || "";
          if (roleSelect && this.resetUser.role) roleSelect.value = this.resetUser.role;

          window.showToast(`Credentials updated for ${this.resetUser.name}! Enter captcha to sign in.`, "success");
          document.getElementById("loginCaptchaInput")?.focus();
        }
      });
    }
  }

  openForgotPassword() {
    const modal = document.getElementById("modalForgotPassword");
    if (!modal) return;

    this.resetUser = null;
    this.resetOtp = null;
    this.newAssignedPassword = null;

    const currentId = document.getElementById("loginIdentifier")?.value.trim() || "";
    const input = document.getElementById("forgotIdentifierInput");
    if (input) input.value = currentId;

    this.showForgotStep(1);
    modal.classList.add("open");
  }

  showForgotStep(stepNumber) {
    for (let i = 1; i <= 4; i++) {
      const stepEl = document.getElementById(`forgotStep${i}`);
      if (stepEl) {
        stepEl.style.display = i === stepNumber ? "block" : "none";
      }
    }
  }

  handleForgotStep1() {
    const idInput = document.getElementById("forgotIdentifierInput");
    const query = idInput ? idInput.value.trim().toLowerCase() : "";

    if (!query) {
      window.showToast("Please enter your Gov Email, Username, or Badge ID.", "urgent");
      return;
    }

    const user = appState.users.find(u => 
      u.username.toLowerCase() === query ||
      u.email.toLowerCase() === query ||
      (u.badgeNumber && u.badgeNumber.toLowerCase() === query) ||
      (u.phone && u.phone.includes(query))
    );

    if (!user) {
      window.showToast(`No registered officer found matching: "${query}". Check your input or contact Admin.`, "urgent");
      return;
    }

    this.resetUser = user;
    this.resetOtp = String(Math.floor(100000 + Math.random() * 900000));

    // Update Step 2 preview
    const maskedContact = document.getElementById("forgotMaskedContact");
    if (maskedContact) {
      const parts = user.email.split("@");
      const maskedEmail = parts[0].substring(0, 3) + "***@" + parts[1];
      maskedContact.textContent = `${maskedEmail} / ${user.phone}`;
    }

    const demoBadge = document.getElementById("forgotDemoOtpBadge");
    if (demoBadge) {
      demoBadge.textContent = this.resetOtp;
    }

    const otpInput = document.getElementById("forgotOtpInput");
    if (otpInput) {
      otpInput.value = this.resetOtp; // Auto-prefill for easy SIH demo experience
    }

    window.showToast(`OTP ${this.resetOtp} sent to ${user.name}'s official channel.`, "success");
    this.showForgotStep(2);
  }

  handleForgotStep2() {
    const otpInput = document.getElementById("forgotOtpInput");
    const enteredOtp = otpInput ? otpInput.value.trim() : "";

    if (!enteredOtp) {
      window.showToast("Please enter the 6-digit verification token.", "urgent");
      return;
    }

    // Allow entered OTP or demo bypass 123456
    if (enteredOtp !== this.resetOtp && enteredOtp !== "123456") {
      window.showToast("Invalid verification token. Please re-check the OTP.", "urgent");
      return;
    }

    window.showToast("Identity Token Verified! Enter your new password.", "success");
    this.showForgotStep(3);
    document.getElementById("forgotNewPass")?.focus();
  }

  handleForgotStep3() {
    const pass1 = document.getElementById("forgotNewPass")?.value;
    const pass2 = document.getElementById("forgotConfirmPass")?.value;

    if (!pass1 || pass1.length < 6) {
      window.showToast("Password must be at least 6 characters long.", "urgent");
      return;
    }

    if (pass1 !== pass2) {
      window.showToast("Passwords do not match. Please re-enter.", "urgent");
      return;
    }

    if (!this.resetUser) return;

    // Update password in state
    appState.resetUserPassword(this.resetUser.id, pass1);
    this.newAssignedPassword = pass1;

    const userLabel = document.getElementById("forgotSuccessUsername");
    if (userLabel) {
      userLabel.textContent = `${this.resetUser.name} (${this.resetUser.username})`;
    }

    this.showForgotStep(4);
  }

  handleLoginSubmit() {
    const roleSelect = document.getElementById("loginRoleSelect");
    const customRoleInput = document.getElementById("loginCustomRoleInput");
    const identifierInput = document.getElementById("loginIdentifier");
    const passwordInput = document.getElementById("loginPassword");
    const captchaInput = document.getElementById("loginCaptchaInput");

    const role = roleSelect ? roleSelect.value : "Administrator";
    const customRole = customRoleInput ? customRoleInput.value.trim() : "";
    const identifier = identifierInput ? identifierInput.value.trim() : "";
    const password = passwordInput ? passwordInput.value : "";
    const captcha = captchaInput ? captchaInput.value.trim() : "";

    // Verify Captcha
    if (captcha.toUpperCase() !== this.currentCaptcha.toUpperCase()) {
      window.showToast("Security Captcha is incorrect. Please re-enter the code.", "urgent");
      this.generateCaptcha();
      if (captchaInput) captchaInput.value = "";
      return;
    }

    // Match user: First check identifier explicitly if provided
    let matchedUser = null;
    const cleanId = identifier.toLowerCase();

    if (cleanId) {
      matchedUser = appState.users.find(u => 
        u.username.toLowerCase() === cleanId ||
        u.email.toLowerCase() === cleanId ||
        (u.badgeNumber && u.badgeNumber.toLowerCase() === cleanId) ||
        (u.phone && u.phone.includes(cleanId))
      );
    }

    // Fallback match by role if no exact match by identifier
    if (!matchedUser) {
      if (role === "Others") {
        matchedUser = appState.users.find(u => u.role === "Others");
        if (!matchedUser) {
          // Create on-the-fly authorized session for this specified designation
          matchedUser = {
            id: "USR-OTH-" + Math.floor(100 + Math.random() * 900),
            username: identifier || "special.officer",
            password: password || "GovtSecured@2026",
            name: identifier ? `Officer (${identifier})` : "Special Magistrate / Expert",
            role: "Others",
            customRole: customRole || "Special Judicial Investigator",
            designation: customRole || "External Specialist",
            department: "Allied Judicial & Enforcement Wing",
            badgeNumber: "SPE-2026-99",
            email: "officer@gov.in",
            phone: "+91 99000 11223",
            status: "Active",
            avatar: "SO",
            approvedAt: new Date().toISOString()
          };
          appState.users.push(matchedUser);
        }
      } else {
        matchedUser = appState.users.find(u => u.role === role);
      }
    }

    if (!matchedUser) {
      window.showToast(`No active profile found for identifier: ${identifier || role}`, "urgent");
      return;
    }

    // Validate Password
    const expectedPassword = matchedUser.password || "GovtSecured@2026";
    if (password && password !== expectedPassword) {
      window.showToast(`Authentication Failed: Incorrect Access Key / Password for ${matchedUser.username}. Use "Forgot Password?" to reset.`, "urgent");
      if (passwordInput) {
        passwordInput.focus();
        passwordInput.style.borderColor = "var(--gov-red)";
      }
      return;
    }

    appState.setCurrentUser(matchedUser);
    window.showToast(`Welcome, ${matchedUser.name} (${matchedUser.role}${matchedUser.customRole ? ` - ${matchedUser.customRole}` : ""})`, "success");
    window.appRouter.render();
  }

  handleRegisterSubmit() {
    const name = document.getElementById("regFullName")?.value.trim();
    const email = document.getElementById("regEmail")?.value.trim();
    const phone = document.getElementById("regPhone")?.value.trim();
    const role = document.getElementById("regRoleSelect")?.value;
    const customRole = document.getElementById("regCustomRoleInput")?.value.trim() || "";
    const department = document.getElementById("regDepartment")?.value.trim() || "";
    const idProofType = document.getElementById("regIdType")?.value;
    const idProofNumber = document.getElementById("regIdNumber")?.value.trim() || "";
    const reason = document.getElementById("regReason")?.value.trim() || "";
    const captcha = document.getElementById("regCaptchaInput")?.value.trim() || "";

    if (captcha.toUpperCase() !== this.currentCaptcha.toUpperCase()) {
      window.showToast("Security Captcha is incorrect. Please check and retry.", "urgent");
      this.generateCaptcha();
      return;
    }

    if (!name || !email || !role) {
      window.showToast("Please fill all mandatory fields marked with *", "urgent");
      return;
    }

    const newReq = appState.submitRegistrationRequest({
      name,
      email,
      phone,
      role,
      customRole,
      department,
      idProofType,
      idProofNumber,
      reason
    });

    window.showToast(`Registration request #${newReq.id} submitted! It is now pending clearance by the Administrator.`, "success");

    // Reset register form & switch back to login
    document.getElementById("formRegister")?.reset();
    document.getElementById("tabLogin")?.click();
  }

  quickSwitchRole(roleName) {
    if (roleName === "Others") {
      let otherUser = appState.users.find(u => u.role === "Others");
      if (!otherUser) {
        otherUser = {
          id: "USR-OTH-099",
          username: "special.expert",
          name: "Dr. K. S. Ramanujan",
          role: "Others",
          customRole: "Director - Forensic Science Laboratory",
          designation: "Director - Digital Forensics Wing",
          department: "Central Forensic Science Laboratory, CBI Campus",
          badgeNumber: "CFSL-DFW-2018-099",
          email: "ramanujan.fsl@delhi.gov.in",
          phone: "+91 98661 22334",
          status: "Active",
          avatar: "KR",
          approvedAt: "2024-01-05T10:00:00Z"
        };
        appState.users.push(otherUser);
      }
      appState.setCurrentUser(otherUser);
    } else {
      const user = appState.users.find(u => u.role === roleName);
      if (user) {
        appState.setCurrentUser(user);
      }
    }

    window.appRouter.render();
    window.showToast(`Switched active role to: ${roleName}`, "normal");
  }
}
