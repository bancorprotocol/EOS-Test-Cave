TEST_NAME="Generate set contract update json data"

. ../runner.sh

# Usage: cleos multisig exec [OPTIONS] proposer proposal_name [executer]

NAME="eosio"
msig_json="$GLOBALPATH/log/tmp_msig_data.json"

CMD=$( $GLOBALPATH/bin/cleos.sh set contract $NAME $GLOBALPATH/contracts_update/eosio.system  -p ${NAME}@active -d -j -s 2> $tpm_stderr | tail -n +4 > $msig_json )

ERR=$(cat $tpm_stderr)
if [[ $ERR != "" ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
fi

echo "1:$TEST_NAME"
