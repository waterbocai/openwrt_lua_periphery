C_PERIPHERY_CFLAGS 		= $(CFLAGS) -std=gnu99 -pedantic -fstrict-aliasing -Wall -Wextra -Wno-unused-parameter -Wno-pointer-to-int-cast -Iinclude

C_PERIPHERY_LIB			= libcperiphery.so
C_PERIPHERY_LIB_LDFLAGS = $(LDFLAGS) -shared
C_PERIPHERY_LIB_OBJ		= i2c.o serial.o spi.o mmio.o gpio.o

LUA_PERIPHERY 			= periphery.so
LUA_PERIPHERY_LDFLAGS	= $(LDFLAGS) -shared -L. -lcperiphery -llua
LUA_PERIPHERY_OBJS		= lua_gpio.o lua_i2c.o lua_mmio.o lua_periphery.o lua_spi.o lua_serial.o

%.o: %.c
	$(CC) $(C_PERIPHERY_CFLAGS) $(FPIC) -c -o $@ $<
	
compile: clean $(C_PERIPHERY_LIB_OBJ) $(LUA_PERIPHERY_OBJS)
	$(CC) $(C_PERIPHERY_LIB_LDFLAGS) 	-o $(C_PERIPHERY_LIB) $(C_PERIPHERY_LIB_OBJ)
	$(CC) $(LUA_PERIPHERY_LDFLAGS) 		-o $(LUA_PERIPHERY) $(LUA_PERIPHERY_OBJS)
clean:
	rm -f *.o $(C_PERIPHERY_LIB) $(LUA_PERIPHERY) $(LUA_PERIPHERY_OBJS) $(C_PERIPHERY_LIB_OBJ)
