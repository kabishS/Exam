echo "Enter a number:"
read num

if [ $num -gt 0 ]
then
    echo "Number is Positive"
elif [ $num -lt 0 ]
then
    echo "Number is Negative"
else
    echo "Number is Zero"
fi
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#include <stdio.h>

int semaphore = 1;

void wait() {
    semaphore--;
    printf("Process entered critical section\n");
}

void signal() {
    semaphore++;
    printf("Process exited critical section\n");
}

int main() {
    printf("Initial semaphore value: %d\n", semaphore);

    wait();
    printf("Semaphore value after wait: %d\n", semaphore);

    signal();
    printf("Semaphore value after signal: %d\n", semaphore);

    return 0;
}
