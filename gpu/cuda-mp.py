import cupy

#import numpy as cupy
#cupy.asnumpy = lambda x: x

import multiprocessing
from multiprocessing import Process, Queue
import time
import os

N = 2000000

def f(x):
    #get some data from the global context
    global glob_var

    #get the device ID from the global context
    global device_id
    
    print("f: process PID {}, GPU {}".format(multiprocessing.current_process().pid, device_id))

    #ensure computation is on the device allocated to this process
    with cupy.cuda.Device(device_id):
        y = x*cupy.ones((glob_var.shape[0], glob_var.shape[1], glob_var.shape[1]), dtype=cupy.float32)
        ret = y @ glob_var
        ret = ret.swapaxes(1,2) @ y
        ret = cupy.asnumpy(ret.mean())
    return ret

def init_vars(queue):
    global glob_var
    global device_id

    #get the device assigned to this process
    device_id = queue.get()
    print("init_vars: process PID {}, GPU {}".format(multiprocessing.current_process().pid, device_id))

    #allocate data on the device
    with cupy.cuda.Device(device_id):
        glob_var = cupy.ones((N, 6, 1), dtype=cupy.float32)

if __name__ == '__main__':
    multiprocessing.set_start_method('forkserver')
   
    cvd = os.environ["CUDA_VISIBLE_DEVICES"]
    cvd = [int(x) for x in cvd.split(",")]
    NUM_GPUS = len(cvd) 
    PROC_PER_GPU = 8
    queue = Queue()
    #even though CUDA_VISIBLE_DEVICES could be e.g. 3,4
    #here the indexing will be from 0,1, as nvidia hides the other devices
    for gpu_ids in range(NUM_GPUS):
        for _ in range(PROC_PER_GPU):
            queue.put(gpu_ids)

    t0 = time.time()
    input_data = range(1000)

    pool = multiprocessing.Pool(NUM_GPUS*PROC_PER_GPU, initializer=init_vars, initargs=(queue, ))
    ret = sum(pool.map(f, input_data))
    print(ret)

    ret = sum(pool.map(f, input_data))
    print(ret)

    ret = sum(pool.map(f, input_data))
    print(ret)

    pool.close()
    pool.join()

    t1 = time.time()
    print(t1 - t0)

