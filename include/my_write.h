#ifndef MY_WRITE_H
#define MY_WRITE_H

#include <unistd.h>

ssize_t my_write(int fd, const void *buf, size_t count);

#endif
