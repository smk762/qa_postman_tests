#!/usr/bin/env python3
import os
import sys
import string
import secrets
import argparse

HOME = os.path.expanduser("~")

def generate_rpc_pass(length=24):
    special_chars = "@~-_|():+"
    rpc_chars = string.ascii_letters + string.digits + special_chars
    return "".join(secrets.choice(rpc_chars) for _ in range(length))

def create_conf(
    addnode="komodod",
    conf_folder=f"{HOME}/.komodo",
    conf_fn="komodo.conf",
    p2p_port=7770,
    rpc_port=7771,
    rpc_user=None,
    rpc_pass=None
):
    conf_path = f"{conf_folder}/{conf_fn}"
    if not os.path.exists(conf_folder):
        os.makedirs(conf_folder)
    if not p2p_port:
        p2p_port = int(rpc_port) + 1
    if not rpc_user:
        rpcuser = generate_rpc_pass()
    if not rpc_pass:
        rpcpass = generate_rpc_pass()
    if os.path.exists(conf_path):
        with open(conf_path, 'r') as f:
            lines = f.readlines()
            for line in lines:
                if line.startswith('rpcuser'):
                    rpc_user = line.split('=')[1].strip()
                if line.startswith('rpcpassword'):
                    rpc_pass = line.split('=')[1].strip()
                if line.startswith('port'):
                    p2p_port = int(line.split('=')[1].strip())
                if line.startswith('rpcport'):
                    rpc_port = int(line.split('=')[1].strip())
        
    with open(conf_path, 'w') as conf:
        conf.write(f'rpcuser={rpc_user}\n')
        conf.write(f'rpcpassword={rpc_pass}\n')
        conf.write('txindex=1\n')
        conf.write('addressindex=1\n')
        conf.write('spentindex=1\n')
        conf.write('server=1\n')
        conf.write('daemon=1\n')
        conf.write('rpcworkqueue=256\n')
        conf.write('rpcallowip=0.0.0.0/0\n')
        conf.write(f'port={p2p_port}\n')
        conf.write(f'rpcport={rpc_port}\n')
        conf.write(f'addnode={addnode}\n')

if __name__ == "__main__":
    desc = "Create .conf files for komodod and asset chains."
    parser = argparse.ArgumentParser(description=desc)
    parser.add_argument("--addnode", help="IP or docker service name running komodod", required=True)
    parser.add_argument("--conf_fn", help="Conf filename (e.g. komodo.conf)", required=True)
    parser.add_argument("--conf_path", help="Path to folder containing chain data (e.g. /home/user/.komodo/CHAINNAME)", required=True)
    parser.add_argument("--rpc_port", help="Port for RPC connection to komodod", required=True)
    # Optional params. If not supplied, values will be generated
    parser.add_argument("--rpc_pass", help="Password for RPC connection to komodod", required=False, default=None)
    parser.add_argument("--rpc_user", help="Username for RPC connection to komodod", required=False, default=None)
    parser.add_argument("--p2p_port", help="Port for connection to komodod peers", required=False, default=None)
    
    if len(sys.argv) == 1:
        parser.print_help(sys.stderr)
        sys.exit(1)
    args = parser.parse_args()

    # create conf file    
    create_conf(
        conf_folder=args.conf_path,
        conf_fn=args.conf_fn,
        p2p_port=args.p2p_port,
        rpc_port=args.rpc_port,
        rpc_user=args.rpc_user,
        rpc_pass=args.rpc_pass,
        addnode=args.addnode,
    )
    print(f"Created {args.conf_fn} in {args.conf_path}")
    sys.exit(0)
