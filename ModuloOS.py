#!/usr/bin/env /usr/bin/python3
import os

def listar_archivos():
    try:
        files = os.listdir('.')
        for file in files:
            print(file)
    except Exception as e:
        print("Error al listar archivos:", e)

def mostrar_directorio_actual():
    try:
        print(os.getcwd())
    except Exception as e:
        print("Error al mostrar el directorio actual:", e)

def crear_directorio():
    nombre = input("Introduce el nombre del directorio a crear: ")
    try:
        os.mkdir(nombre)
        print("Directorio creado correctamente.")
    except Exception as e:
        print("Error al crear el directorio:", e)

def borrar_archivo():
    nombre = input("Introduce el nombre del archivo a borrar: ")
    try:
        os.unlink(nombre)
        print("Archivo borrado correctamente.")
    except Exception as e:
        print("Error al borrar el archivo:", e)

def copiar_archivo():
    origen = input("Introduce el nombre del archivo origen: ")
    destino = input("Introduce el nombre del archivo destino: ")
    try:
        with open(origen, 'rb') as fsrc, open(destino, 'wb') as fdst:
            fdst.write(fsrc.read())
        print("Archivo copiado correctamente.")
    except Exception as e:
        print("Error al copiar el archivo:", e)

def mostrar_contenido_archivo():
    nombre = input("Introduce el nombre del archivo a mostrar: ")
    try:
        with open(nombre, 'r') as file:
            print(file.read())
    except Exception as e:
        print("Error al mostrar el contenido del archivo:", e)

def editar_archivo():
    nombre = input("Introduce el nombre del archivo a editar: ")
    try:
        with open(nombre, 'r+') as file:
            contenido = file.read()
            print("Contenido actual del archivo:")
            print(contenido)
            file.seek(0)
            nuevo_contenido = input("Introduce el nuevo contenido:\n")
            file.write(nuevo_contenido)
            file.truncate()
        print("Archivo editado correctamente.")
    except Exception as e:
        print("Error al editar el archivo:", e)

def mostrar_espacio_disponible():
    try:
        statvfs = os.statvfs(os.getcwd())
        free_space = statvfs.f_frsize * statvfs.f_bavail
        print(f"Espacio disponible: {free_space} bytes")
    except Exception as e:
        print("Error al mostrar el espacio disponible:", e)

def mostrar_procesos_activos():
    try:
        with open("/proc/meminfo", 'r') as file:
            print(file.read())
    except Exception as e:
        print("Error al mostrar los procesos activos:", e)

def mostrar_informacion_sistema():
    try:
        with open("/proc/cpuinfo", 'r') as file:
            print(file.read())
    except Exception as e:
        print("Error al mostrar la información del sistema:", e)

def ejecutar_comando_personalizado():
    comando = input("Introduce el comando personalizado: ")
    try:
        os.system(comando)
    except Exception as e:
        print("Error al ejecutar el comando personalizado:", e)

def mostrar_menu():
    print("\nMenu:")
    print("1. Listar archivos")
    print("2. Mostrar directorio actual")
    print("3. Crear directorio")
    print("4. Borrar archivo")
    print("5. Copiar archivo")
    print("6. Mostrar contenido de archivo")
    print("7. Editar archivo")
    print("8. Mostrar espacio disponible")
    print("9. Mostrar procesos activos")
    print("10. Mostrar información del sistema")
    print("11. Ejecutar comando personalizado")
    print("0. Salir")

def main():
    while True:
        mostrar_menu()
        opcion = input("Selecciona una opción: ")
       
        if opcion == "1":
            listar_archivos()
        elif opcion == "2":
            mostrar_directorio_actual()
        elif opcion == "3":
            crear_directorio()
        elif opcion == "4":
            borrar_archivo()
        elif opcion == "5":
            copiar_archivo()
        elif opcion == "6":
            mostrar_contenido_archivo()
        elif opcion == "7":
            editar_archivo()
        elif opcion == "8":
            mostrar_espacio_disponible()
        elif opcion == "9":
            mostrar_procesos_activos()
        elif opcion == "10":
            mostrar_informacion_sistema()
        elif opcion == "11":
            ejecutar_comando_personalizado()
        elif opcion == "0":
            print("Saliendo del programa...")
            break
        else:
            print("Opción inválida. Inténtalo de nuevo.")

if __name__ == "__main__":
    main()
