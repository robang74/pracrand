# PractRand

The PracRand source and website cpy and past fork for github with instrctions for compiling it

- Official Web Site: [pracrand.sourceforge.net](https://pracrand.sourceforge.net)
- Source Forge project: [sourceforge.net/projects/pracrand](https://sourceforge.net/projects/pracrand)
- Source Forge download: [PractRand_0.96.zip](https://sourceforge.net/projects/pracrand/files/PractRand_0.96.zip/download)
  - `PractRand_0.96.zip 2025-12-26 904.8 kB`
  - `SHA1: c9c45729f84d995cc2a1ded95a83b40c601b1b09`
  - `MD5: 624221574e8f43754c823db89057a089`
- Last available version: 0.96

## Documentation

- [PractRand.txt](doc/PractRand.txt) - overall features, lists of competitors
- [installation.txt](doc/installation.txt) - brief installation instructions
- [tools.txt](doc/tools.txt) - some command lines tools for random number generation and testing
- [license.txt](doc/license.txt) - legal stuff
- [portability.txt](doc/portability.txt) - notes on portability
- [versions.txt](doc/versions.txt) - list of changes between versions
- [RNG_usage.txt](doc/RNG_usage.txt) - basics of the PractRand random number generation interface
- [RNG_engines.txt](doc/RNG_engines.txt) - list of RNGs, rated for quality, size, speed, other properties
- [RNG_speed.txt](doc/RNG_speed.txt) - some benchmarks of the recommended RNGs
- [RNG_multithreading.txt](doc/RNG_multithreading.txt) - notes on using PractRand RNGs in multithreaded programs
- [RNG_parallel.txt](doc/RNG_parallel.txt) - notes on avoiding correlation between different RNG instances in parallel computation scenarios
- [RNG_interface_variations.txt](doc/RNG_interface_variations.txt) - light-weight RNGs, polymorphic RNGs, raw RNGs, entropy pooling RNGs
- [RNG_entropy_pools.txt](doc/RNG_entropy_pools.txt) - notes on "entropy pools" - RNGs specialized for dealing with exotic seeding scenarios
- [Tests_usage.txt](doc/Tests_usage.txt) - how to use the library (as opposed to the command line tools) to do statistical tests
- [Tests_results.txt](doc/Tests_results.txt) - Results of the PractRand standard test battery compared to other test suites on a variety of RNGs
- [Tests_batteries.txt](doc/Tests_batteries.txt) - Describes the various batteries of tests that PractRand defines
- [Tests_engines.txt](doc/Tests_engines.txt) - Describes the statistical tests in PractRand
- [Tests_overview.txt](doc/Tests_overview.txt) - How to use RNG_test, general discussion of testing, how to use competitors
- [Tests_performance.txt](doc/Tests_performance.txt) - speed of testing, not quality - for quality, see Tests_results.txt
- [to_do.txt](doc/to_do.txt)

## Compiling

```sh
flags="-O3 -Iinclude -pthread -std=gnu++11 -s"
g++ -c src/*.cpp src/RNGs/*.cpp src/RNGs/other/*.cpp $flags
ar rcs libPractRand.a *.o

flags="$flags libPractRand.a"
g++ -o RNG_test tools/RNG_test.cpp $flags
g++ -o RNG_benchmark tools/RNG_benchmark.cpp $flags
g++ -o RNG_output tools/RNG_output.cpp $flags

rm -f *.o; du -ks libPractRand.a RNG_*
```

Expected results compiled dymamic against glibc:

```sh
3636	libPractRand.a
 260	RNG_benchmark
2208	RNG_output
2268	RNG_test
```
