
mkdir -p /home/${USER}/.zcash-params
komodo/fetch-params.sh
komodo/create_kmd_conf.py --addnode ADDNODE --conf_fn QATEST.conf --conf_path ${HOME}/.komodo/QATEST_A --rpc_port 9689 --rpc_pass RPC_CONTRoL_USERP@SSW0RD --rpc_user rpcuser
komodo/create_kmd_conf.py --addnode ADDNODE --conf_fn QATEST.conf --conf_path ${HOME}/.komodo/QATEST_B --rpc_port 9789 --rpc_pass RPC_CONTRoL_USERP@SSW0RD --rpc_user rpcuser
