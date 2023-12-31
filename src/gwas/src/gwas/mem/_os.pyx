# cython: language_level=3


cdef extern from "<unistd.h>" nogil:
    long syscall(long number, ...)


cdef extern from "<sys/syscall.h>" nogil:
    enum: SYS_memfd_create


cdef extern from "<linux/memfd.h>" nogil:
    enum: MFD_CLOEXEC


def c_memfd_create(str name, unsigned int flags=MFD_CLOEXEC):
    """
    Python wrapper for sys memfd_create function
    :param name: Address to mmap the memory
    :param flags: Specify speicific flags to this memory
    :return: A file descriptor
    """

    name_bytes = name.encode("utf-8")
    cdef char *c_name = name_bytes

    cdef int fd = syscall(SYS_memfd_create, c_name, flags)
    return fd
