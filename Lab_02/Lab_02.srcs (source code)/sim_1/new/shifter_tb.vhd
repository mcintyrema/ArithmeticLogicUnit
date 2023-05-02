







----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/03/2023 12:49:25 PM
-- Design Name: 
-- Module Name: Shifter_Unit_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shifter_Unit_TB is
--  Port ( );
end Shifter_Unit_TB;

architecture Behavioral of Shifter_Unit_TB is

component Shifter_Unit is
GENERIC (
      n       : positive := 32);
   PORT( 
      A       : IN     std_logic_vector (n-1 DOWNTO 0);
      SHAMT   : IN     std_logic_vector (4 DOWNTO 0);
      C_op    : IN     std_logic_vector (1 DOWNTO 0);
      R       : OUT    std_logic_vector (n-1 DOWNTO 0)
   );
end component;

--signals
constant n : positive := 32;
signal A : std_logic_vector(n-1 downto 0);
signal SHAMT : std_logic_vector(4 downto 0);
signal C_op : std_logic_vector(1 downto 0);
signal R0 : std_logic_vector(n-1 downto 0);
signal sll_4 : std_logic_vector(n-1 downto 0);
signal srl_4 : std_logic_vector(n-1 downto 0);
signal sra_4 : std_logic_vector(n-1 downto 0);
begin

DUT: Shifter_Unit
generic map(
    n => n)
port map(
    A => A,
    SHAMT => SHAMT,
    C_op => C_op,
    R => R0);

process
begin
--Test case1
A <= X"FEDCBA98";
SHAMT <= "00000";
sll_4 <= X"FEDCBA98";
srl_4 <= X"FEDCBA98";
sra_4 <= X"FEDCBA98";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error1";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error2";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error3";
wait for 10 ns;


--Case 2
 A <= X"FEDCBA98";
SHAMT <= "00001";
sll_4 <= X"FDB97530";
srl_4 <= X"7F6E5D4C";
sra_4 <= X"FF6E5D4C";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error4";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error5";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error6";
wait for 10 ns;


--Case 3
 A <= X"FEDCBA98";
SHAMT <= "00010";
sll_4 <= X"FB72EA60";
srl_4 <= X"3FB72EA6";
sra_4 <= X"FFB72EA6";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error7";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error8";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error9";
wait for 10 ns;


--Case 4
 A <= X"FEDCBA98";
SHAMT <= "00011";
sll_4 <= X"F6E5D4C0";
srl_4 <= X"1FDB9753";
sra_4 <= X"FFDB9753";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error10";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error11";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error12";
wait for 10 ns;


--Case 5
 A <= X"FEDCBA98";
SHAMT <= "00100";
sll_4 <= X"EDCBA980";
srl_4 <= X"0FEDCBA9";
sra_4 <= X"FFEDCBA9";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error13";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error14";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error15";
wait for 10 ns;


--Case 6
A <= X"FEDCBA98";
SHAMT <= "00101";
sll_4 <= X"DB975300";
srl_4 <= X"07F6E5D4";
sra_4 <= X"FFF6E5D4";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error16";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error17";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error18";
wait for 10 ns;


--Case 7
A <= X"FEDCBA98";
SHAMT <= "00110";
sll_4 <= X"B72EA600";
srl_4 <= X"03FB72EA";
sra_4 <= X"FFFB72EA";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error19";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error20";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error21";
wait for 10 ns;


--Case 8
A <= X"FEDCBA98";
SHAMT <= "00111";
sll_4 <= X"6E5D4C00";
srl_4 <= X"01FDB975";
sra_4 <= X"FFFDB975";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error22";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error23";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error24";
wait for 10 ns;


--Case 9
A <= X"FEDCBA98";
SHAMT <= "01000";
sll_4 <= X"DCBA9800";
srl_4 <= X"00FEDCBA";
sra_4 <= X"FFFEDCBA";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error25";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error26";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error27";
wait for 10 ns;


--Case 10
A <= X"FEDCBA98";
SHAMT <= "01001";
sll_4 <= X"B9753000";
srl_4 <= X"007F6E5D";
sra_4 <= X"FFFF6E5D";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error28";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error29";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error30";
wait for 10 ns;


--Case 11
A <= X"FEDCBA98";
SHAMT <= "01010";
sll_4 <= X"72EA6000";
srl_4 <= X"003FB72E";
sra_4 <= X"FFFFB72E";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error31";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error32";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error33";
wait for 10 ns;


--Case 12
A <= X"FEDCBA98";
SHAMT <= "01011";
sll_4 <= X"E5D4C000";
srl_4 <= X"001FDB97";
sra_4 <= X"FFFFDB97";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error34";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error35";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error36";
wait for 10 ns;


--Case 13
A <= X"FEDCBA98";
SHAMT <= "01100";
sll_4 <= X"CBA98000";
srl_4 <= X"000FEDCB";
sra_4 <= X"FFFFEDCB";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error37";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error38";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error39";
wait for 10 ns;


--Case 14
A <= X"FEDCBA98";
SHAMT <= "01101";
sll_4 <= X"97530000";
srl_4 <= X"0007F6E5";
sra_4 <= X"FFFFF6E5";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error40";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error41";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error42";
wait for 10 ns;


--Case 15
 A <= X"FEDCBA98";
SHAMT <= "01110";
sll_4 <= X"2EA60000";
srl_4 <= X"0003FB72";
sra_4 <= X"FFFFFB72";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error43";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error44";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error45";
wait for 10 ns;


--Case 16
 A <= X"FEDCBA98";
SHAMT <= "01111";
sll_4 <= X"5D4C0000";
srl_4 <= X"0001FDB9";
sra_4 <= X"FFFFFDB9";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error46";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error47";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error48";
wait for 10 ns;


--Case 17
 A <= X"FEDCBA98";
SHAMT <= "10000";
sll_4 <= X"BA980000";
srl_4 <= X"0000FEDC";
sra_4 <= X"FFFFFEDC";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error49";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error50";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error51";
wait for 10 ns;


--case 18
 A <= X"FEDCBA98";
SHAMT <= "10001";
sll_4 <= X"75300000";
srl_4 <= X"00007F6E";
sra_4 <= X"FFFFFF6E";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error52";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error53";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error54";
wait for 10 ns;


--case 19
 A <= X"FEDCBA98";
SHAMT <= "10010";
sll_4 <= X"EA600000";
srl_4 <= X"00003FB7";
sra_4 <= X"FFFFFFB7";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error55";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error56";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error57";
wait for 10 ns;


--case 20
 A <= X"FEDCBA98";
SHAMT <= "10011";
sll_4 <= X"D4C00000";
srl_4 <= X"00001FDB";
sra_4 <= X"FFFFFFDB";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error58";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error59";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error60";
wait for 10 ns;


--case 21
 A <= X"FEDCBA98";
SHAMT <= "10100";
sll_4 <= X"A9800000";
srl_4 <= X"00000FED";
sra_4 <= X"FFFFFFED";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error61";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error62";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error63";
wait for 10 ns;


--case 22
 A <= X"FEDCBA98";
SHAMT <= "10101";
sll_4 <= X"53000000";
srl_4 <= X"000007F6";
sra_4 <= X"FFFFFFF6";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error64";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error65";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error66";
wait for 10 ns;


--case 23
 A <= X"FEDCBA98";
SHAMT <= "10110";
sll_4 <= X"A6000000";
srl_4 <= X"000003FB";
sra_4 <= X"FFFFFFFB";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error67";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error68";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error69";
wait for 10 ns;


--case 24
 A <= X"FEDCBA98";
SHAMT <= "10111";
sll_4 <= X"4C000000";
srl_4 <= X"000001FD";
sra_4 <= X"FFFFFFFD";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error70";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error71";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error72";
wait for 10 ns;


--case 25
 A <= X"FEDCBA98";
SHAMT <= "11000";
sll_4 <= X"98000000";
srl_4 <= X"000000FE";
sra_4 <= X"FFFFFFFE";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error73";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error74";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error75";
wait for 10 ns;


--case 26
 A <= X"FEDCBA98";
SHAMT <= "11001";
sll_4 <= X"30000000";
srl_4 <= X"0000007F";
sra_4 <= X"FFFFFFFF";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error76";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error77";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error78";
wait for 10 ns;


--case 27
 A <= X"FEDCBA98";
SHAMT <= "11010";
sll_4 <= X"60000000";
srl_4 <= X"0000003F";
sra_4 <= X"FFFFFFFF";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error79";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error80";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error81";
wait for 10 ns;


--case 28
 A <= X"FEDCBA98";
SHAMT <= "11011";
sll_4 <= X"C0000000";
srl_4 <= X"0000001F";
sra_4 <= X"FFFFFFFF";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error82";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error83";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error84";
wait for 10 ns;


--case 29
A <= X"FEDCBA98";
SHAMT <= "11100";
sll_4 <= X"80000000";
srl_4 <= X"0000000F";
sra_4 <= X"FFFFFFFF";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error85";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error86";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error87";
wait for 10 ns;


--case 30
 A <= X"FEDCBA98";
SHAMT <= "11101";
sll_4 <= X"00000000";
srl_4 <= X"00000007";
sra_4 <= X"FFFFFFFF";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error88";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error89";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error90";
wait for 10 ns;


--case 31
 A <= X"FEDCBA98";
SHAMT <= "11110";
sll_4 <= X"00000000";
srl_4 <= X"00000003";
sra_4 <= X"FFFFFFFF";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error91";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error92";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error93";
wait for 10 ns;


--case 32
 A <= X"FEDCBA98";
SHAMT <= "11111";
sll_4 <= X"00000000";
srl_4 <= X"00000001";
sra_4 <= X"FFFFFFFF";
wait for 10 ns;

C_op <= "00";
wait for 10 ns;
assert(R0 = sll_4) report "error82";

wait for 10ns;
C_op <= "10";
assert(R0 = srl_4) report "error83";

wait for 10 ns;
C_op <= "11";
assert(R0 = sra_4) report "error84";
wait for 10 ns;

end process;   
end Behavioral;
