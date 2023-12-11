
extern void enable_interrupt();

void trap_handler(void *epc, unsigned int cause){
    *((int*)0x4) = 0x2022;
}

int main(){
    *((int*)0x4) = 0xDEADBEEF;
    enable_interrupt();
    for(;;);
}