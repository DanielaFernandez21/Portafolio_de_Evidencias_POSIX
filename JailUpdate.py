#!/usr/bin/env /usr/bin/python3
import subprocess
import re

def run_cmd(cmd, get_output=True, timeout=35, stop_on_error=True):
    "Run cmd logging input and output"
    output = ""
    try:
        if get_output:
            p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True, shell=True)
            output, err = p.communicate(timeout=timeout)
            rc = p.returncode
        else:
            result = subprocess.check_call(cmd, stderr=subprocess.STDOUT, shell=True, timeout=timeout)
    except subprocess.CalledProcessError as e:
        if stop_on_error:
            msg = 'Failed sudo_cmd: %s' % (e.returncode, str(e))
    except Exception as e:
        if stop_on_error:
            msg = 'Failed sudo_cmd: %s' % str(e)
    return output

# Función de bienvenida
def welcome():
    print("""
      .--.
     |o_o |
     |:_/ |
    //   \ \\
   (|     | )
  /'\_   _/`\\
  \_)=(_/

¡Bienvenido al juego CTF jail1!
Tienes 5 vidas. Cada comando incorrecto te resta una vida.
Solo se permiten los siguientes caracteres: mlasrobndeatx.-/ y espacios.
¡Buena suerte!
""")

# Llamar a la función de bienvenida
welcome()

# Definir el número inicial de vidas
vidas = 5

# Bucle principal
while True:
    try:
        if vidas == 0:
            print("Te quedaste sin vidas. ¡Juego terminado!")
            break

        s = input('CTF jail1 >> ')

        # Verificar si el comando es válido
        cmd = s.strip()
        if cmd.lower() == "ls":
            try:
                output = run_cmd(cmd, get_output=True, stop_on_error=True)
                print(output)
            except OSError:
                print('Error desconocido al ejecutar el comando.')
            continue

        pattern = r'[^mlasrobndeatx.\-/\s]'
        if re.search(pattern, cmd):
            print('Comando no válido. Solo se permiten los siguientes caracteres: mlasrobndeatx.-/ y espacios.')
            vidas -= 1
            print(f'Te quedan {vidas} vidas.')
            continue

        # Ejecutar el comando
        try:
            output = run_cmd(cmd, get_output=True, stop_on_error=True)
            print(output)
        except OSError:
            print('Error desconocido al ejecutar el comando.')
    except KeyboardInterrupt:
        print("\n¡Juego interrumpido!")
        break
