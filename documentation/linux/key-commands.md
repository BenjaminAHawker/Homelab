### 👤 User Management Commands (Debian)

| Action                | Command                                    | Notes                      |
|-----------------------|--------------------------------------------|----------------------------|
| Create new user       | `adduser {USERNAME}`                       | Prompts for password/info |
| Add user to group     | `usermod -aG {GROUP} {USERNAME}`           | Appends to group (safe)   |
| List all users        | `getent passwd`                            | Shows all system users    |