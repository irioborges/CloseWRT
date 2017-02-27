clear
echo "######################################################################"
echo "# SCRIPT IPTABLES FORWARD PARA BLOQUEIO DE PORTAS EM INTERVALO DE IPS#"
echo "# DATA DE CRIACAO 27/02/17                                           #"
echo "# IRIO RAFAEL DE MENEZES BORGES                                      #"
echo "######################################################################"
echo ""
echo ""
echo ""
echo ""
echo "DIGITE OS 9 PRIMEIROS DIGITOS DO IP NO FORMATO[(999.999.999), (SE O FORMATO TIVER ERRADO DA M!@#A)"
read IP
echo "DIGITE OS 3 ULTIMOS DIGITOS DA FAIXA INICIAL DE IP NO FORMAT(999)"
read IP_INICIAL
echo "DIGITE OS 3 ULTIMOS DIGITOS DA FAIXA FINAL DE IP NO FORMAT(999)"
read IP_FINAL
echo "DIGITE AS PORTAS A SEREM BLOQUEADAS"
read PORTAS

IP_RESUL=`expr $IP_FINAL - $IP_INICIAL + 1`

for i in $(seq $IP_RESUL); do
  echo "IP'S Bloqueados "$IP.`expr $i + $IP_INICIAL - 1`;
  iptables -A FORWARD -s $IP.`expr $i + $IP_INICIAL - 1` -p tcp --dport $PORTAS -j DROP;
done
