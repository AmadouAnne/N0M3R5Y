# Enumeration

# OSCP Enumeration Cheat Sheet

A collection of commands and tools used for conducting enumeration during my OSCP journey.

## Description

This is an enumeration cheat sheet that I created while pursuing the OSCP. It also includes the commands that I used on platforms such as Vulnhub and Hack the Box.

## Disclaimer

This cheat sheet should not be considered to be complete and only represents a snapshot in time when I used these commands for performing enumeration during my OSCP journey. These commands should only be used for educational purposes or authorised testing.

# Table of Contents

- [Enumeration](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
    - [Host](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [Nmap](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [Proxychains](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [Autorecon](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
    - [Services](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [FTP (21/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [SSH (22/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [SMTP (25/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [DNS (53/tcp, 53/udp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [HTTP/HTTPS (80/tcp, 443/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [Kerberos (88/tcp, 464/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [POP3/POP3S (110/tcp, 995/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [RPC (111/tcp, 135/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [ident (113/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [NTP (123/udp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [NetBIOS-NS (137/udp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [SMB (139/tcp, 445/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [IMAP/IMAPS (143/tcp, 993/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [SNMP (161/udp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [LDAP (389/tcp, 3268/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [Java RMI (1100/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [MSSQL (1433/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [Oracle TNS listener (1521/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [NFS (2049/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [MySQL (3306/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [RDP (3389/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [SIP (5060/udp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [PostgreSQL (5432/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [VNC (5900/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
        - [AJP (8009/tcp)](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)
    - [Active Directory](https://www.notion.so/Enumeration-1c06b0db72558007ad46c30275ee4034?pvs=21)

# Enumeration

## Host

### Nmap

```
# Full TCP port scan
sudo nmap -Pn -p- -oN alltcp_ports.txt $ip

# Full TCP port scan (safe scripts + version detection)
sudo nmap -Pn -sC -sV -p- -oN alltcp.txt $ip

# Top 20 UDP port scan
sudo nmap -Pn -sU -sV -sC --top-ports=20 -oN top_20_udp_nmap.txt $ip

```

### Proxychains

```
# Top 20 TCP port scan
proxychains nmap -Pn -sT --top-ports=20 --open -oN top_20_tcp_nmap.txt $ip

# Top 1000 TCP port scan
proxychains nmap -Pn -sT --top-ports=1000 --open -oN top_1000_tcp_nmap.txt $ip

# Scan TCP ports (safe scripts + version detection)
proxychains nmap -Pn -sT -sC -sV -p 21,22,80 -oN tcp_nmap_sC_sV.txt $ip

```

### Autorecon

```
# Scan single target
sudo autorecon -o enumeration $ip

# Scan multiple targets
sudo autorecon -o enumeration $ip1 $ip2 $ip3 $ip4

```

## Services

### FTP (21/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 21 --script="banner,(ftp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "tcp_21_ftp_nmap.txt" $ip

```

### SSH (22/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 22 --script=banner,ssh2-enum-algos,ssh-hostkey,ssh-auth-methods -oN tcp_22_ssh_nmap.txt $ip

```

### SMTP (25/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 25 "--script=banner,(smtp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN tcp_25_smtp_nmap.txt $ip

```

[smtp-user-enum](https://pypi.org/project/smtp-user-enum)

```
/home/kali/.local/bin/smtp-user-enum -V -m RCPT -w -f '<user@example.com>' -d 'domain.local' -U "/usr/share/metasploit-framework/data/wordlists/unix_users.txt" $ip 25 2>&1 | tee "tcp_25_smtp_user-enum.txt"

```

### DNS (53/tcp, 53/udp)

```
# Version detection + NSE scripts
sudo nmap -Pn -sU -sV -p 53 "--script=banner,(dns* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN udp_53_dns_nmap.txt $ip

```

```
# Perform zone transfer (only works over port 53/tcp)
dig axfr @$ip $domain 2>&1 | tee "tcp_53_dns_dig.txt"

# Perform reverse DNS lookup (may display NS record containing domain name)
nslookup $ip $ip

# Brute force subdomains
gobuster dns -d $domain -w /usr/share/seclists/Discovery/DNS/bitquark-subdomains-top100000.txt -t 16 -o "tcp_53_dns_gobuster.txt"

```

### HTTP/HTTPS (80/tcp, 443/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p $port "--script=banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN tcp_port_protocol_nmap.txt $ip

```

**Nikto**

```
nikto -h $url 2>&1 | tee "tcp_port_protocol_nikto.txt"

```

**Directory brute force**

```
gobuster dir -u $url -w /usr/share/seclists/Discovery/Web-Content/common.txt -x "txt,html,php,asp,aspx,jsp" -s "200,204,301,302,307,403,500" -k -t 16 -o "tcp_port_protocol_gobuster.txt"

python3 /opt/dirsearch/dirsearch.py -u $url -t 16 -e txt,html,php,asp,aspx,jsp -f -x 403 -w /usr/share/seclists/Discovery/Web-Content/common.txt --plain-text-report="tcp_port_protocol_dirsearch.txt"

Dirbuster (GUI): only perform extension brute force - disable 'Brute Force Dirs'

wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/common.txt --hc 404 -t 16 $url/FUZZ 2>&1 | tee "tcp_port_http_wfuzz.txt"

# Directory brute force recursively with max depth = 2
python3 /opt/dirsearch/dirsearch.py -u $url/apps/ -t 16 -e txt,html,php -f -x 403 -r -R 2 -w /usr/share/seclists/Discovery/Web-Content/common.txt --plain-text-report="tcp_port_protocol_dirsearch_apps.txt"

```

**Whatweb**

```
whatweb --color=never --no-errors -a 3 -v $url 2>&1 | tee "tcp_port_protocol_whatweb.txt"

```

**Wordpress**

```
# Enumerate vulnerable plugins and themes, timthumbs, wp-config.php backups, database exports, usernames and media IDs
wpscan --url $url --no-update --disable-tls-checks -e vp,vt,tt,cb,dbe,u,m --plugins-detection aggressive --plugins-version-detection aggressive -f cli-no-color 2>&1 | tee tcp_port_protocol_wpscan.txt

# Enumerate all plugins
wpscan --url $url --disable-tls-checks --no-update -e ap --plugins-detection aggressive -f cli-no-color 2>&1 | tee tcp_port_protocol_wpscan_plugins.txt

```

**Robots.txt**

```
/robots.txt

```

**Only get HTTP headers**

```
curl -I $url

```

**Cewl**

```
cewl $url/index.php -m 3 --with-numbers -w cewl.txt

```

**Drupal**

```
python3 drupwn --version 7.28 --mode enum --target $url

droopescan scan drupal -u $url

```

**Shellshock**

```
# Check if bash vulnerable to CVE-2014-6271 (bash vulnerable if ‘vulnerable’ in output)
env x='() { :;}; echo vulnerable' bash -c "echo this is a test"

# Brute force CGI files
gobuster dir -u $url/cgi-bin/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -x "cgi,sh,pl,py" -s "200,204,301,302,307,403,500" -t 16 -o "tcp_port_protocol_gobuster_shellshock.txt"

wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/CGIs.txt --hc 404 -t 16 $url/cgi-bin/FUZZ 2>&1 | tee "tcp_port_protocol_wfuzz.txt"

Webmin uses cgi files - versions up to 1.700 vulnerable to shellshock (<http://www.webmin.com/security.html>)

```

### Kerberos (88/tcp, 464/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p $port --script="banner,krb5-enum-users" -oN "tcp_port_kerberos_nmap.txt" $ip

```

### POP3/POP3S (110/tcp, 995/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p $port "--script=banner,(pop3* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN tcp_port_pop3_nmap.txt $ip

```

### RPC (111/tcp, 135/tcp)

**msrpc/rpcbind**

```
# Version detection + NSE scripts
nmap -Pn -sV -p $port --script=banner,msrpc-enum,rpc-grind,rpcinfo -oN tcp_port_rpc_nmap.txt $ip

```

**rpcinfo**

```
# List all registered RPC programs
rpcinfo -p $ip

# Provide compact results
rpcinfo -s $ip

```

**Null session**

```
rpcclient -U "" -N $ip
    srvinfo
    enumdomusers
    getdompwinfo
    querydominfo
    netshareenum
    netshareenumall

```

### ident (113/tcp)

**Enumerate users services running as**

```
ident-user-enum $ip 22 25 80 445

```

### NTP (123/udp)

```
# Run ntp-info NSE script
sudo nmap -sU -p 123 --script ntp-info $ip

```

### NetBIOS-NS (137/udp)

**enum4linux**

```
enum4linux -a -M -l -d $ip 2>&1 | tee "enum4linux.txt"

```

**nbtscan**

```
nbtscan -rvh $ip 2>&1 | tee "nbtscan.txt"

```

### SMB (139/tcp, 445/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 445 "--script=banner,(nbstat or smb* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" --script-args=unsafe=1 -oN tcp_445_smb_nmap.txt $ip

```

**smbmap**

```
# List share permissions
smbmap -H $ip -P 445 2>&1 | tee -a "smbmap-share-permissions.txt"; smbmap -u null -p "" -H $ip -P 445 2>&1 | tee -a "smbmap-share-permissions.txt"

# List share contents
smbmap -H $ip -P 445 -R 2>&1 | tee -a "smbmap-list-contents.txt"; smbmap -u null -p "" -H $ip -P 445 -R 2>&1 | tee -a "smbmap-list-contents.txt"

```

**enum4linux**

```
enum4linux -a -M -l -d $ip 2>&1 | tee "enum4linux.txt"

```

- *Enumerate Samba version (\nix)*

```
# NB: change interface tcpdump listening on
sudo ./smbver.sh $ip 139

```

**Null session**

```
smbmap -H $ip
smbclient -L //$ip/ -U '' -N

```

**Enumerate shares**

```
nmap --script smb-enum-shares -p 445 $ip

```

**Connect to wwwroot share (try blank password)**

```
smbclient \\\\\\\\$ip\\\\wwwroot

```

**Nmap scans for SMB vulnerabilities (NB: can cause DoS)**

```
# RRAS Service Overflow
# <https://docs.microsoft.com/en-us/security-updates/securitybulletins/2006/ms06-025>
nmap -Pn -sV -p 445 --script="smb-vuln-ms06-025" --script-args="unsafe=1" -oN "tcp_445_smb_ms06-025.txt" $ip

# DNS RPC Service Overflow
# <https://docs.microsoft.com/en-us/security-updates/securitybulletins/2007/ms07-029>
nmap -Pn -sV -p 445 --script="smb-vuln-ms07-029" --script-args="unsafe=1" -oN "tcp_445_smb_ms07-029.txt" $ip

# Server Service Vulnerability
# <https://docs.microsoft.com/en-us/security-updates/securitybulletins/2008/ms08-067>
nmap -Pn -sV -p 445 --script="smb-vuln-ms08-067" --script-args="unsafe=1" -oN "tcp_445_smb_ms08-067.txt" $ip

# Eternalblue
# <https://docs.microsoft.com/en-us/security-updates/securitybulletins/2017/ms17-010>
nmap -p 445 --script smb-vuln-ms17-010 -oN "tcp_445_smb_ms08-067.txt" $ip

```

### IMAP/IMAPS (143/tcp, 993/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p $port "--script=banner,(imap* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN tcp_port_imap_nmap.txt $ip

```

### SNMP (161/udp)

```
# Version detection + NSE scripts
sudo nmap -Pn -sU -sV -p 161 --script="banner,(snmp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "udp_161_snmp-nmap.txt" $ip

```

**Brute force community strings**

```
onesixtyone -c /usr/share/seclists/Discovery/SNMP/common-snmp-community-strings-onesixtyone.txt $ip 2>&1 | tee "udp_161_snmp_onesixtyone.txt"

```

**snmpwalk**

```
# Enumerate entire MIB tree
snmpwalk -c public -v1 -t 10 $ip

# Enumerate Windows users
snmpwalk -c public -v1 $ip 1.3.6.1.4.1.77.1.2.25

# Enumerate running Windows processes
snmpwalk -c public -v1 $ip 1.3.6.1.2.1.25.4.2.1.2

# Enumerate open TCP ports
snmpwalk -c public -v1 $ip 1.3.6.1.2.1.6.13.1.3

# Enumerate installed software
snmpwalk -c public -v1 $ip 1.3.6.1.2.1.25.6.3.1.2

```

**Enumerate SNMP device (places info in readable format)**

```
snmp-check $ip -c public

```

### LDAP (389/tcp, 3268/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p $port --script="banner,(ldap* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "tcp_port_ldap_nmap.txt" $ip

```

**enum4linux**

```
enum4linux -a -M -l -d $ip 2>&1 | tee "enum4linux.txt"

```

### Java RMI (1100/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 1100 --script="banner,rmi-vuln-classloader,rmi-dumpregistry" -oN "tcp_110_rmi_nmap.txt" $ip

```

### MSSQL (1433/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 1433 --script="banner,(ms-sql* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" --script-args="mssql.instance-port=1433,mssql.username=sa,mssql.password=sa" -oN "tcp_1433_mssql_nmap.txt" $ip

```

**mssqlclient.py**

```
# MSSQL shell
mssqlclient.py -db msdb hostname/sa:password@$ip

# List databases
SELECT name FROM master.dbo.sysdatabases

# List tables
SELECT * FROM <database_name>.INFORMATION_SCHEMA.TABLES

# List users and password hashes
SELECT sp.name AS login, sp.type_desc AS login_type, sl.password_hash, sp.create_date, sp.modify_date, CASE WHEN sp.is_disabled = 1 THEN 'Disabled' ELSE 'Enabled' END AS status FROM sys.server_principals sp LEFT JOIN sys.sql_logins sl ON sp.principal_id = sl.principal_id WHERE sp.type NOT IN ('G', 'R') ORDER BY sp.name

```

### Oracle TNS listener (1521/tcp)

**tnscmd10g**

```
tnscmd10g version -h $ip
tnscmd10g status -h $ip

```

### NFS (2049/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 111,2049 --script="banner,(rpcinfo or nfs*) and not (brute or broadcast or dos or external or fuzzer)" -oN "tcp_111_2049_nfs_nmap.txt" $ip

```

**Show mount information**

```
showmount -e $ip

```

**Mount share**

```
sudo mount -o rw,vers=2 $ip:/home /mnt

# '-o nolock' used to disable file locking, needed for older NFS servers
sudo mount -o nolock $ip:/home /mnt/

```

### MySQL (3306/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 3306 --script="banner,(mysql* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "tcp_3306_mysql_nmap.txt" $ip

```

**MySQL shell**

```
mysql --host=$ip -u root -p

```

**MySQL system variables**

```
SHOW VARIABLES;

```

**Show privileges granted to current user**

```
SHOW GRANTS;

```

**Show privileges granted to root user**

```
# Replace 'password' field with 'authentication_string' if it does not exist
SELECT user,password,create_priv,insert_priv,update_priv,alter_priv,delete_priv,drop_priv FROM mysql.user WHERE user = 'root';

```

**Exact privileges**

```
SELECT grantee, table_schema, privilege_type FROM information_schema.schema_privileges;

```

**Enumerate file privileges (see [here](https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html#priv_file) for discussion of file_priv)**

```
SELECT user FROM mysql.user WHERE file_priv='Y';

```

### RDP (3389/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 3389 --script="banner,(rdp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "tcp_3389_rdp_nmap.txt" $ip

```

### SIP (5060/udp)

**Scans for SIP devices on network**

```
svmap $ip

```

**Identifies active extensions on PBX**

```
svwar -m INVITE -e 200-250 $ip

```

### PostgreSQL (5432/tcp)

**Log into postgres remotely**

```
PGPASSWORD=postgres psql -h $ip -p 5437 -U postgres

```

**List databases**

```
\\list
SELECT datname FROM pg_database;

```

**Use postgres database**

```
\\c postgres

```

**List tables**

```
\\d

```

**Describe table**

```
\\d table

```

**Check if current user superuser (on = yes, off = no)**

```
SELECT current_setting ('is_superuser');

```

**Get user roles**

```
\\du+

```

**Check user’s privileges over table (pg_shadow)**

```
SELECT grantee, privilege_type FROM information_schema.role_table_grants WHERE table_name='pg_shadow';

```

**Read file (/etc/passwd)**

```
CREATE TABLE demo(t text);
COPY demo FROM '/etc/passwd';
SELECT * FROM demo;

```

**Read usernames and password hashes**

```
# Postgresql password hash format: md5(secret || username) where || denotes string concatenation (remove md5 before cracking hash)
SELECT usename, passwd from pg_shadow;

```

**Check if plpgsql enabled**

```
# Below result indicates that plpgsql enabled:
# lanname | lanacl
#---------+---------
# plpgsql |
SELECT lanname,lanacl FROM pg_language WHERE lanname = 'plpgsql'

```

**PostgreSQL config file location**

```
SHOW config_file;

```

### VNC (5900/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 5900 --script="banner,(vnc* or realvnc* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" --script-args="unsafe=1" -oN "tcp_5900_vnc_nmap.txt" $ip

```

### AJP (8009/tcp)

```
# Version detection + NSE scripts
nmap -Pn -sV -p 8009 -n --script ajp-auth,ajp-headers,ajp-methods,ajp-request -oN tcp_8009_ajp_nmap.txt $ip

```

## Active Directory

**Enumerate users**

```
net user
net user /domain
net user $domain_user /domain

```

**Enumerate groups**

```
net group /domain

# Includes domain users that are part of local administrators group
net localgroup administrators

```

**PowerView**

```
# Import PowerView
PS> Import-Module .\\PowerView.ps1

# Get info about current domain
PS> Get-NetDomain

# List members of Domain Admins group
PS> Get-NetGroupMember -GroupName "Domain Admins"

# List all computers in domain
PS> Get-NetComputer

# Enumerate logged-on users
# NB: only lists users logged on to target if we have local administrator privileges on target
PS> Get-NetLoggedon -ComputerName $hostname

# Enumerate active user sessions on servers e.g. file servers or domain controllers
PS> Get-NetSession -ComputerName $hostname

# Enumerate SPNs
PS> Get-NetUser -SPN | select serviceprincipalname

```