# Screen Manager Script

This script provides a simple interface for managing GNU Screen sessions on a Linux system. It's a Bash script that leverages the `whiptail` dialog utility to provide a graphical menu, allowing users to list, create, attach to, and delete Screen sessions.

## Features

- List all active and detached Screen sessions.
- Create new Screen sessions.
- Attach to existing Screen sessions.
- Delete existing Screen sessions.

## Dependencies

- GNU Screen
- whiptail

These dependencies can usually be installed from your distribution's package manager. For example, on Debian/Ubuntu:

```bash
sudo apt-get install screen whiptail
```

## Usage

1. Clone the repository or download the `screen_manager.sh` script to your system.
2. Make the script executable:

```bash
chmod +x screen_manager.sh
```

3. Run the script:

```bash
./screen_manager.sh
```

You'll be presented with a menu where you can choose to list, create, attach to, or delete Screen sessions.

## License

This script is released under the MIT License. See the `LICENSE` file for details.

## Acknowledgments

This project was collaboratively developed with the assistance of ChatGPT by OpenAI.
