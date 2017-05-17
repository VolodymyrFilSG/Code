'''random from 1 and 2'''
def rand():
        import random
        import time
        inp = [1 , 2]
        '''print('Введите количество итераций')
        imax = int(input())'''
        '''print('Введите количество итераций для вывода за раз')
        numax = int(input())'''
        z = 0
        z1 = 0
        z2 = 0
        num = 0
        i = 0
        while True:
                if i < 10000000:
                    if num < 1000000:
                        num += 1
                        z = random.choice(inp)
                        if z == 1:
                            z1 += 1
                            z = 0
                            i += 1
                        else:
                            z2 += 1
                            z = 0
                            i += 1
                    else:
                        num = 0
                        print ('Итерация ', i, 'Количество [1] ', z1, 'Количество [2] ', z2)
                else:
                    last = (time.ctime()), 'Тест завершен', 'Итераций пройдено ', str(i), ' Количество [1] ', str(z1), ' Количество [2] ', str(z2)
                    print(last)
                    output = [str(i), '\t\t', str(z1), '\t\t', str(z2), '\n']
                    f = open('rand.txt', 'a')
                    for index in output:
                        f.write(index)
                    f.close()
                    break

rand()
