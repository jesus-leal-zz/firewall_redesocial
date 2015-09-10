# firewall_redesocial
# Para meu amigos Administradores ou entusiastas em Servidores Linux -- Automatizando liberação e bloqueio de
# determinados conteúdos por horário usando Shell Script Cron e regras Netfilter Iptables. A princípio parace
# simples mas vai ajudar muito esse conteúdo que desenvolvi, pois o netfilter abre o pacote e verifica o seu conteúdo
# usando essas regas de alto nível, rápido e eficiente.
# Quero compartilhar com todos e qualquer idéia ou ajuda será bem vinda para melhorar o código. Dúvidas é só perguntar.
#
###### Usar o cront para executar este script nos horarios 0800 1200 1330 1800 horas - outros horarios que preferir
# só alterar dentro do script e em FOR, o que se quer liberar/bloquear. ######
# OBS: Não esquecer de mudar o caminho da VAR FW / script Firewall.

 ###### Usar estas regras Mangle no seu Script de Firewall devidamente bem alocado, para mais chaves de bloqueio
 # repetir a linha e informar conteudo do pacote ######

iptables -A INPUT -m string --string "facebook" --algo bm -j DROP
iptables -A INPUT -m string --string "twitter" --algo bm -j DROP
iptables -A INPUT -m string --string "X-Kazaa" --algo bm -j DROP
iptables -A INPUT -m string --string "torrent" --algo bm -j DROP
