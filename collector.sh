#!/bin/bash
# Deep Audit - Forensic Collector (Bash)

OUTPUT_DIR="./evidence_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"
REPORT="$OUTPUT_DIR/system_snapshot.txt"

echo "--- DEEP AUDIT FORENSIC REPORT ---" > "$REPORT"
echo "Data/Hora: $(date)" >> "$REPORT"

# 1. Coleta de conexões de rede (Netstat)
echo "[+] Coletando conexões de rede..."
echo "--- NETWORK CONNECTIONS ---" >> "$REPORT"
netstat -tunapl >> "$REPORT"

# 2. Listagem de processos (Árvore de processos)
echo "[+] Coletando árvore de processos..."
echo "--- PROCESS TREE ---" >> "$REPORT"
ps auxf >> "$REPORT"

# 3. Listagem de arquivos abertos (LSOF)
echo "[+] Mapeando arquivos abertos..."
echo "--- OPEN FILES ---" >> "$REPORT"
lsof -nP +L1 >> "$REPORT"

# 4. Verificação de usuários logados
echo "[+] Verificando usuários ativos..."
echo "--- LOGGED USERS ---" >> "$REPORT"
who -a >> "$REPORT"

echo "[SUCCESS] Evidências coletadas em $REPORT"
