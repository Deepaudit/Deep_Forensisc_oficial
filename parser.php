<?php
/**
 * Deep Audit - Forensic Parser
 * Processa o relatório bruto e destaca ameaças.
 */

$file = 'system_snapshot.txt'; // Altere para o caminho gerado pelo Bash

if (!file_exists($file)) {
    die("[-] Erro: Arquivo de evidência não encontrado.\n");
}

$content = file_get_contents($file);

// Exemplo: Buscar por conexões ESTABLISHED em portas comuns de RATs ou Shells
echo "--- ANÁLISE DE SEGURANÇA DEEP AUDIT ---\n";

if (preg_match_all('/ESTABLISHED\s+(\d+\.\d+\.\d+\.\d+):(\d+)/', $content, $matches)) {
    foreach ($matches[1] as $index => $ip) {
        $port = $matches[2][$index];
        echo "[!] Conexão Ativa Detectada: IP $ip na porta $port\n";
    }
} else {
    echo "[+] Nenhuma conexão externa suspeita encontrada no log.\n";
}

// Aqui você pode integrar o código de upload para o GitHub que criamos antes
