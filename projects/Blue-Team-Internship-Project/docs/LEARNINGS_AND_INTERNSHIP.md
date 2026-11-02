# Internship details and learning reflection

## Internship context

The provided offer letter describes a **Cyber Security Intern** position with **Hack Secure**. It states that the program is educational and training-based, is scheduled during 2026, and lasts three weeks. The letter is dated 13 October 2026. It does not specify exact start and end dates in the visible text, so this project does not invent them.

Student details supplied for this report:

- **Name:** Harshit
- **University:** J.C. Bose University of Science and Technology, YMCA, Faridabad
- **Course:** B.Tech IT
- **Track:** Blue Team

This repository documents the Blue Team web assessment component. It is not a certificate of completion or a claim of employment.

## Answer: What key skills or knowledge did I gain from this internship?

During this internship project, I learned how to turn web traffic and test results into a clear defensive assessment. I used Wireshark to follow HTTP requests and responses and to confirm that form fields were sent without encryption. I practiced using Gobuster to inventory common paths, while learning that a discovered path or a 200/301 response does not automatically mean sensitive data is exposed.

I also used SQLMap to validate an injection issue on a deliberately vulnerable training site and to enumerate database names without dumping records. For XSS, I checked the browser behavior and captured the alert as evidence. These exercises helped me understand how insecure input handling can affect a web application and its visitors.

From a SOC analyst perspective, I learned to preserve evidence, connect an event to its likely impact, and avoid overstating what the evidence proves. For example, three failed logins are not enough to claim a brute-force attack, and a 404 response does not prove that every sensitive directory is protected. I also learned to separate actual observations from proposed SIEM detections, because this exercise did not include access to a live SIEM or server-side logs.

The main skills I practiced were:

- Packet filtering and HTTP request/response analysis in Wireshark.
- Basic web attack surface discovery with Gobuster.
- SQL injection validation and limited database-name enumeration with SQLMap.
- Browser verification of reflected XSS.
- Evidence handling, severity prioritization, and concise incident reporting.
- Mapping observed test behaviors to MITRE ATT&CK without implying attribution.
- Explaining what was not tested and what additional logs would be needed for a real incident investigation.
