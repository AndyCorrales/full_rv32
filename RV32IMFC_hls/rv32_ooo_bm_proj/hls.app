<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" top="rv32_ooo_tick" name="rv32_ooo_bm_proj" ideType="classic">
    <files>
        <file name="rv32_ooo.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../../bm_elf.h" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="../../rv32_ooo_baremetal_tb.cpp" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
</AutoPilot:project>

