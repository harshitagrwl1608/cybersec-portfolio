# Phishing & Social Engineering

## Fast phishing checks
1. **Sender:** does the address/domain match the claimed organization?
2. **Pressure:** urgency, threats, deadlines, secrecy.
3. **Link:** visible text vs actual destination.
4. **Attachment:** unexpected file/type/source.
5. **Request:** credentials, MFA code, payment, sensitive data.

## Common types
Phishing = broad deceptive message.  
Spear phishing = targeted.  
Whaling = high-value/executive target.  
Smishing = SMS.  
Vishing = voice.

## Other human attacks
Pretexting = believable fabricated scenario.  
Impersonation = pretend to be trusted identity.  
Elicitation = extract information conversationally.  
Watering hole = compromise site a target group visits.  
Tailgating = follow authorized person into secure area.

## Email security controls
- **Secure email gateway:** filters spam/phishing, checks links/attachments, quarantines suspicious mail, and logs results.
- **SPF:** DNS policy identifies mail servers allowed to send for a domain's SMTP envelope identity.
- **DKIM:** cryptographic signature helps verify signed message content and signing domain.
- **DMARC:** aligns SPF/DKIM authentication with the visible domain, publishes a policy, and enables reporting.
- A pass is not proof an email is safe; use alignment, sender context, reputation and message content together.

## Analyst response
Preserve the message → inspect sender/link/attachment → extract IOCs → check reputation → search related telemetry → contain affected account/device if confirmed → document.

## Defenses & awareness
Security awareness · phishing-resistant MFA · email/web filtering · attachment sandboxing · URL analysis · SPF/DKIM/DMARC · out-of-band verification.

Use onboarding and role-based training, refresh it as systems/threats change, and include hybrid/remote-work risks. Track completion and measure whether users can recognize and report suspicious activity. Phishing simulations should improve controls and training—not treat every click as proof of negligence.