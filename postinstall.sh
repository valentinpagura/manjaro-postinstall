#!/bin/bash

# Verificar si el script se ejecuta como root
if [[ $EUID -ne 0 ]]; then
  echo "⚠️  Este script debe ejecutarse como root (usá sudo)"
  exit 1
fi

echo "🚀 Iniciando post-instalación de Manjaro..."

# 1. Actualizar el sistema
echo "📦 Actualizando el sistema..."
pacman -Syu --noconfirm

# 2. Configurar mirrors más rápidos
echo "🌐 Configurando mirrors..."
pacman-mirrors --fasttrack && pacman -Syy

# 3. Instalar paquetes útiles
echo "📥 Instalando paquetes útiles..."
pacman -S --noconfirm git neofetch zsh wget htop vim base-devel

# 4. Cambiar shell por defecto a zsh
echo "💻 Cambiando shell por defecto a zsh para el usuario actual..."
chsh -s /bin/zsh $SUDO_USER

# 5. Mostrar información del sistema
echo "📊 Mostrando información del sistema..."
neofetch

echo "✅ ¡Post-instalación finalizada!"
