# program which finds difference between two foldes
import os
from os import path


first_dir_path = input("Введіть шлях до першої папки\n")			# Получення шляхів папок
second_dir_path = input("Введіть шлях до другої папки\n")


first_dir_files = []												# Створення масивів з іменами файлів
second_dir_files = []


first_dir_files = set(os.listdir(first_dir_path))
second_dir_files = set(os.listdir(second_dir_path))


first_dir_files_to_copy = []										# Створення масивів з іменами файлів, котрі потрібно буде копіювати
second_dir_files_to_copy = []


first_dir_files_to_copy = first_dir_files.difference(second_dir_files)
second_dir_files_to_copy = second_dir_files.difference(first_dir_files)


copy_to_second = set(os.listdir(first_dir)).difference(set(os.listdir(second_dir)))