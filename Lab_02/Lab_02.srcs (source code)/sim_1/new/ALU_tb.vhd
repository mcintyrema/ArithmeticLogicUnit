library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_Testbench is
--  Port ( );
end ALU_Testbench;

architecture main of ALU_Testbench is
	component ALU is
      GENERIC (
          n       : positive := 32);
        Port ( 
            A : in std_logic_vector(n-1 downto 0);
            B : in std_logic_vector(n-1 downto 0);
            ALUOp : in std_logic_vector(3 downto 0);
            SHAMT : in std_logic_vector(4 downto 0);
            Zero : out std_logic;
            Overflow : out std_logic;
            R : out std_logic_vector(n-1 downto 0)
             );
    end component;

	signal		A : 		STD_LOGIC_VECTOR (31 downto 0):="00000000000000000000000000000000";
	signal		B : 		STD_LOGIC_VECTOR (31 downto 0):="00000000000000000000000000000000";
	signal		SHAMT : 	STD_LOGIC_VECTOR (4 downto 0):="00000";
	signal		ALUOp : 	STD_LOGIC_VECTOR (3 downto 0):="0000";
	signal		Zero : 			STD_LOGIC:='0';
	signal		Overflow : 	STD_LOGIC:='0';
	signal		R0, R1 : 		STD_LOGIC_VECTOR (31 downto 0):="00000000000000000000000000000000";
begin

	DUT: ALU 
	port map(
	   A => A,
	   B => B,
	   SHAMT => SHAMT,
	   ALUOp => ALUOp,
	   Zero => Zero,
	   Overflow => Overflow,
	   R => R0);

process
	begin
		for i in -100 to 100 loop
			A <= std_logic_vector(to_signed(i, 32));
			for j in -100 to 100 loop	
            	B <= std_logic_vector(to_signed(j, 32));
            	wait for 10ns;
            	
            	
--ADD 
				ALUOp <= "0100";
				R1 <= std_logic_vector(to_signed(i,32) + to_signed(j,32));
				wait for 10 ns;
				assert(R1 = R0) report "error10";
				wait for 10 ns;	
--UADD
				ALUOp <= "0101";
				R1 <= std_logic_vector(to_unsigned(i,32) + to_unsigned(j,32));
				wait for 10 ns;
				assert(R1 = R0) report "error11";
				wait for 10 ns;	
--SUB
				ALUOp <= "0110";
				R1 <= std_logic_vector(to_signed(i,32) - to_signed(j,32) );
				wait for 10 ns;
				assert(R1 = R0) report "error12";
				wait for 10 ns;
--USUB
				ALUOp <= "0111";
				R1 <= std_logic_vector(to_unsigned(i,32) - to_unsigned(j,32) );
				wait for 10 ns;
				assert(R1 = R0) report "error13";
				wait for 10 ns;			
            	

--Logical AND
				ALUOp <= "0000";
				R1 <= A AND B;
				wait for 10 ns;
				assert(R1 = R0) report "error1";
				wait for 10 ns;
				
--Logical OR
				ALUOp <= "0001";
				R1 <= A OR B;
				wait for 10ns;
				assert(R1 = R0) report "error2";
				wait for 10 ns;
				
--Logical XOR
				ALUOp <= "0010";
				R1 <= A XOR B;
				wait for 10ns;
				assert(R1 = R0) report "error3";
				wait for 10 ns;
				
--Logical NOR
				ALUOp <= "0011";
				R1 <= A NOR B;
				wait for 10ns;
				assert(R1 = R0) report "error4";
				wait for 10 ns;
				
				
--Comparator STL
				ALUOp <= "1010";
				if (to_signed(i, 32) < to_signed(j,32)) then
					R1 <= "00000000000000000000000000000001";
				else
					R1 <= "00000000000000000000000000000000";
				end if;
				wait for 10 ns;
				assert(R1 = R0) report "error5";
				wait for 10 ns;	
--Comparator SLTU 
				ALUOp <= "1011";
				if (to_unsigned(i, 32)<to_unsigned(j, 32)) then
					R1 <= "00000000000000000000000000000001";
				else
					R1 <= "00000000000000000000000000000000";
				end if;
				wait for 10 ns;
				wait for 10 ns;
				assert(R1 = R0) report "error6";
				wait for 10 ns;		
			end loop;
			
			
			for k in 0 to 31 loop
            	SHAMT <= std_logic_vector(to_unsigned(k, 5));
            	wait for 10ns;
            	
--Shifter LSL
				ALUOp <= "1100";
				R1 <= std_logic_vector(to_signed(i,32) sll k);
				wait for 10 ns;
				wait for 10 ns;
				assert(R1 = R0) report "error7";
				wait for 10 ns;	

--Shifter LSR 
				ALUOp <= "1110";
				R1 <= std_logic_vector(to_signed(i,32) srl k);
				wait for 10 ns;
				assert(R1 = R0) report "error8";
				wait for 10 ns;	
----Shifter ASR	
				ALUOp <= "1111";
				R1 <= std_logic_vector(shift_right(to_signed(i,32),k));
				wait for 10 ns;
				assert(R1 = R0) report "error9";
				wait for 10 ns;		
								
			end loop;
		end loop;
	wait;
	end process;
end main;