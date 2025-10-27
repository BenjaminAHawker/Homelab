### 👤 User Management Commands (Debian)

| Action                | Command                                    | Notes                      |
|-----------------------|--------------------------------------------|----------------------------|
| Create new user       | `adduser {USERNAME}`                       | Prompts for password/info |
| Add user to group     | `usermod -aG {GROUP} {USERNAME}`           | Appends to group (safe)   |
| List all users        | `getent passwd`                            | Shows all system users    |
| Copy directory and all content to another directory | `cp -r source_folder destination_folder` | use -r to add recursive option |