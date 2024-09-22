module CPU(
    input clk,reset,
    input instruction
    output result
);
    wire reg_data1,reg_data2,alu_result;
    wire reg_writec,mem_read,mem_write,branch;
    wire opcode=instruction;
    wire dest_reg=instruction;
    wire src_reg1=instruction;
    wire src_reg2=instruction;

    RegisterFile rf(
        .clk(clk),
        .read_reg1(src_reg1),
        .read_reg2(src_reg2),
        .write_reg(dest_reg),
        .write_reg(alu_result),
        .reg_write(reg_write),
        .read_data1(reg_data1),
        .read_data2(reg_data2)
    );

    ALU alu(
        .opcode(opcode),
        .reg1(reg_data1),
        .reg2(reg_data2),
        .result(alu_result)
    );

    ControlUnit cu(
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch(branch)
    );

    assign result=alu_result;
    