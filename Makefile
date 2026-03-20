#
# (c) 2026, Roberto A. Foglietta <roberto.foglietta@gmail.com>, MIT license
#

# Variabili di compilazione
CXX      := $(CCPREFIX)g++
CXXFLAGS := -O3 -Iinclude -pthread -std=gnu++11 $(CCSYSROOT)
AR       := $(CCPREFIX)ar
ARFLAGS  := rcs
STRIP    := $(CCPREFIX)strip --strip-all

# Target finali
LIB_NAME := libPractRand.a
BINS     := RNG_test RNG_benchmark RNG_output

# Sorgenti della libreria
LIB_SRCS := $(wildcard src/*.cpp) \
            $(wildcard src/RNGs/*.cpp) \
            $(wildcard src/RNGs/other/*.cpp)

# Trasforma i .cpp in .o
LIB_OBJS := $(LIB_SRCS:.cpp=.o)

# Sorgenti dei tool (eseguibili)
TOOLS_SRCS := tools/RNG_test.cpp tools/RNG_benchmark.cpp tools/RNG_output.cpp

# --- Regole Principali ---

.PHONY: all clean

all: $(LIB_NAME) $(BINS)
	@echo "Build completata."
	@du -ks $(LIB_NAME) $(BINS) | sort -n

# Regola per la libreria statica
$(LIB_NAME): $(LIB_OBJS)
	$(AR) $(ARFLAGS) $@ $^
	@# Rimuove i .o dopo la creazione della libreria
	rm -f $(LIB_OBJS)

# Regola generica per compilare i .cpp in .o
%.o: %.cpp
	$(CXX) -c $< -o $@ $(CXXFLAGS)

# Regole per gli eseguibili
RNG_test: tools/RNG_test.cpp $(LIB_NAME)
	$(CXX) -o $@ $< $(CXXFLAGS) $(LIB_NAME)
	$(STRIP) $@

RNG_benchmark: tools/RNG_benchmark.cpp $(LIB_NAME)
	$(CXX) -o $@ $< $(CXXFLAGS) $(LIB_NAME)
	$(STRIP) $@

RNG_output: tools/RNG_output.cpp $(LIB_NAME)
	$(CXX) -o $@ $< $(CXXFLAGS) $(LIB_NAME)
	$(STRIP) $@

# Pulizia dei file generati
clean:
	rm -f $(LIB_NAME) $(BINS) *.o
