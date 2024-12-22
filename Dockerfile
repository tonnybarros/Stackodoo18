FROM odoo:18.0

# Troca para o usuário root para instalar dependências
USER root

# Atualiza o sistema e instala o venv
RUN apt-get update && apt-get install -y python3-venv \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir erpbrasil.base email-validator num2words phonenumbers brazilcep \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Define o PATH para o ambiente virtual
ENV PATH="/opt/venv/bin:$PATH"

# Restaura o usuário para "odoo"
USER odoo
