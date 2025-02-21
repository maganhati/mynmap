# mynmap

`mynmap` is a Bash script designed to streamline network scanning using `nmap`, a powerful tool for security analysis and penetration testing. This script offers various scanning options, including version detection, comprehensive scanning, vulnerability scripts, and evasion techniques to avoid detection.

## Features

- **Version Detection**: Identifies versions of services running on open ports.
- **Comprehensive Scanning**: Includes OS detection, version detection, script scanning, and traceroute.
- **Vulnerability Scripts**: Utilizes `nmap` scripts to identify known vulnerabilities.
- **Evasion Techniques**: Includes options to avoid detection by defense systems.
- **Proxychains Support**: Allows scans through proxies to conceal the origin.
- **Full Port Scanning**: Checks all ports from 1 to 65535.
- **Regex-based Input Validation**: Uses regex to determine if the user input is an IP address or a domain.
- **DNS Resolution via Tor**: Resolves domain names using `tor-resolve` for enhanced privacy.

## How to Use

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/mynmap.git
   cd mynmap
   ```

2. **Make the script executable**:
   ```bash
   chmod +x mynmap
   ```

3. **Run the script**:
   ```bash
   mynmap
   ```

4. **Follow the prompts**: The script will ask you to enter the target (IP or domain) and choose a scanning option.

## Scanning Options

- **[1]** `nmap -sV`: Version detection.
- **[2]** `nmap -A`: Comprehensive scan.
- **[3-9]**: Scans with vulnerability scripts and evasion techniques.

## install.sh will install automatically:  

- **nmap**: will ensure `nmap` is installed on your system.
- **Proxychains**: Required for options using proxychains.
- **Tor**: Required for DNS resolution via Tor.

## Legal Disclaimer

This script is intended for educational and research purposes only. The author assumes no responsibility for any misuse of this tool. Use it responsibly and always with explicit permission.

## Contributions

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the [MIT License](LICENSE).

---

Created by Diego Becker.
