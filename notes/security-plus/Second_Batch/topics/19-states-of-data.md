# States of Data, Sovereignty and Geolocation
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 3.3 – Protecting Data → States of Data
**Coverage:** source pages 54–55

## Data at rest
Data stored on a device or storage system. The notes call for encryption and access permissions.

## Data in transit
Data being transmitted over a network. The notes recommend encryption such as TLS, IPsec, VPNs, and firewalls/IPS as complementary controls.

## Data in use
Data actively processed in RAM/cache/CPU registers. The notes emphasize that data in use may be decrypted and therefore can be an attractive target.

## Example: Target breach
The notes reference the 2013 Target breach as an example of data compromise involving large volumes of payment-card information.

## Data sovereignty
Data may be subject to the laws of the country where it resides. The notes use EU/GDPR as an example and emphasize that local legal requirements can constrain where citizen data is stored.

## Geolocation
Geolocation asks “Where is the data?” and “Where is the user?” Sources can include GPS, mobile providers, and other location signals. Geolocation can be used to enforce data-access rules, geographic restrictions, or location-based policies.
