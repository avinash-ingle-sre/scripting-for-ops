import ssl
import socket
import datetime

HOSTNAME = 'google.com' # तुझी वेबसाईट इथे टाक

def check_ssl_expiry(hostname):
    ssl_date_fmt = r'%b %d %H:%M:%S %Y %Z'
    context = ssl.create_default_context()
    
    with socket.create_connection((hostname, 443)) as sock:
        with context.wrap_socket(sock, server_hostname=hostname) as ssock:
            ssl_info = ssock.getpeercert()
            
            # १. सर्टिफिकेटची 'Not After' तारीख मिळवणे
            expiry_str = ssl_info['notAfter']
            expiry_date = datetime.datetime.strptime(expiry_str, ssl_date_fmt)
            
            # २. उरलेले दिवस मोजणे
            remaining = expiry_date - datetime.datetime.utcnow()
            
            print(f"--- SSL Audit for {hostname} ---")
            print(f"Expiry Date: {expiry_date}")
            print(f"Days Left: {remaining.days}")
            
            if remaining.days < 30:
                print(f"🚨 WARNING: SSL Certificate for {hostname} expires in {remaining.days} days!")
            else:
                print(f"✅ SSL Certificate is valid for more than 30 days.")

if __name__ == "__main__":
    check_ssl_expiry(HOSTNAME)
