from multiprocessing import Pool
from time import sleep
def test(i):
    with open("./test" + str(i), 'w') as f:
        pass
    print("exit!")


if __name__ == "__main__":
    p = Pool()
    for i in range(5):
        p.apply_async(test, args=(i, ))
    p.close()
    print("main process exit")