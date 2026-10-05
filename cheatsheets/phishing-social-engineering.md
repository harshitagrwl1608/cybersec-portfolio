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

## Analyst response
Preserve the message → inspect sender/link/attachment → extract IOCs → check reputation → search related telemetry → contain affected account/device if confirmed → document.

## Defenses
Security awareness · phishing-resistant MFA · email/web filtering · attachment sandboxing · URL analysis · DMARC/SPF/DKIM where appropriate · out-of-band verification.