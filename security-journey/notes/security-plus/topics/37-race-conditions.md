# Race Conditions

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 66
# Race Condition
- A programming command running happens at same time
- Bad if unexplained

### Example: Time-of-check to Time-of-use (TOCTOU)
- Check the system
- When do you use the results of your last check
- Sometimes might happen in btw that change value

### Example
Imagine 2 people using same bank account. Deposits are updated real-time but withdrawals are not, so the 2nd person might run into problem if one withdraws money while its not updated and 2nd one thinks he still got all.
