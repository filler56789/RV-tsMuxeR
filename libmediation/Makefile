BUILD=

ifeq ($(MAKECMDGOALS),debug) 
    BUILD=
endif 
ifeq ($(MAKECMDGOALS),release) 
    BUILD=-Os
endif 
#ifeq (!$(findstring $(BUILD),debug release)) 
#    $(error BUILD=$(BUILD) is unknown, must be BUILD=release or BUILD=debug) 
#endif

ifdef OS
   INCPATH  = -I. -I../mingw-std-threads
   DEFINES  = -DWIN32 -DLIBMEDIATION_API= -DDISABLE_LOG_SUPPORT -DDEBUG_NEW12=new -DNO_SYSTEM_EXCEPT
   SOURCES  = fs/directory.cpp fs/osdep/file_win32.cpp system/terminatablethread.cpp types/types.cpp
   LIBS     = -lpthread -lwinmm
   ifdef MSYSTEM
ifeq ("$(MSYSTEM)", "MINGW32")
      LFLAGS   =
      LDFLAGS  =
      CFLAGS   = -c
else
      LFLAGS   =
      LDFLAGS  =
      CFLAGS   = -c
endif
   else
      LFLAGS   =
      LDFLAGS  =
      CFLAGS   = -c
   endif
else
   INCPATH  = -I./
   DEFINES  = -DLINUX -DLIBMEDIATION_API= -DDISABLE_LOG_SUPPORT -DDEBUG_NEW12=new -DNO_SYSTEM_EXCEPT
   SOURCES  = fs/directory.cpp fs/osdep/file_unix.cpp system/terminatablethread.cpp types/types.cpp
   LIBS     = -lpthread
   LFLAGS   =
   LDFLAGS  =
   CFLAGS   = -c
endif

CC=gcc
TARGET   = libmediationl.a

OBJECTS=$(SOURCES:.cpp=.o)

all: $(SOURCES) $(TARGET)
.PHONY : debug release 
debug: all 
release: all

$(TARGET): $(OBJECTS)
	ar cr $@ $(OBJECTS)
        
.cpp.o: 
	$(CC) $(DEFINES) $(BUILD) $(LFLAGS) $(CFLAGS)  $(INCPATH) $? $(LDFLAGS) -o $@ 
	
clean:
	rm -f $(OBJECTS)
	rm -f ./libmediation.so
	rm -f ./libmediationl.a
