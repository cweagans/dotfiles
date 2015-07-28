#!/usr/bin/python

import re, subprocess, argparse

def get_keychain_pass(account=None, server=None):
    # Map some URLs/usernames to the canonical record in the keychain.
    if (server == "localhost"):
        server = "ecmail.inbcu.com"
    if (server == "caldav.messagingengine.com"):
        server = "mail.messagingengine.com"
    if (account == "tfayd\\206451874"):
        account = "cameron.eagans@nbcuni.com"

    params = {
        'security': '/usr/bin/security',
        'command': 'find-internet-password',
        'account': account,
        'server': server,
        'keychain': '/Users/cweagans/Library/Keychains/login.keychain',
    }
    # command = "sudo -u cweagans %(security)s -v %(command)s -g -a %(account)s -s %(server)s %(keychain)s" % params
    command = "%(security)s -v %(command)s -g -s %(server)s -a %(account)s %(keychain)s" % params
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines()
               if l.startswith('password: ')][0]

    return re.match(r'password: "(.*)"', outtext).group(1)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Query the keychain for account passwords')
    parser.add_argument("account", help="The account to find a password for.")
    parser.add_argument("server", help="The server that the account exists on.")
    args = parser.parse_args()
    print get_keychain_pass(args.account, args.server)
    
