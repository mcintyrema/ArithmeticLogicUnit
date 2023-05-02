----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2023 09:47:36 AM
-- Design Name: 
-- Module Name: Logic_Unit_TB - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Logic_Unit_TB is
end Logic_Unit_TB;

architecture Behavioral of Logic_Unit_TB is

component Logic_Unit is
--  Port ( );
    GENERIC (
      n       : positive := 32);
   PORT( 
      A       : IN     std_logic_vector (n-1 DOWNTO 0);
      B       : IN     std_logic_vector (n-1 DOWNTO 0);
      C_op    : IN     std_logic_vector (1 DOWNTO 0);
      R       : OUT    std_logic_vector (n-1 DOWNTO 0)
   );
end component;

constant BITS : INTEGER := 32;
signal A : std_logic_vector(BITS-1 downto 0);
signal B : std_logic_vector(BITS-1 downto 0);
signal C_op : std_logic_vector(1 downto 0);
signal R1 : std_logic_vector(BITS-1 downto 0);

begin
DUT: Logic_Unit
    generic map(
        n => BITS)
    port map(
        A => A,
        B => B,
        C_op => C_op,
        R => R1);

process 
    begin
--        initialize A and B
        A <= "00000000000000000000000000000011";
        B <= "00000000000000000000000000000001";
        
        -- testing AND
        wait for 10 ns;
        C_op <= "00";
        wait for 10ns;
        assert(R1 = (A and B)) report "error1"; --1
        
        -- testing OR
        C_op <= "01";
        wait for 10ns;
        assert (R1 = (A or B)) report "error2"; --3
        
        --testing XOR
        C_op <= "10";
        wait for 10ns;
        assert (R1 = (A xor B)) report "error3"; --2
        
        --test NOR
        C_op <= "11";
        wait for 10 ns;
        assert (R1 = (A nor B)) report "error4";
        
        --other values
         A <= "11111000000000000000000000000011";
        B <= "00000000000000000001111000000001";
        
        -- testing AND
        C_op <= "00";
        wait for 10ns;
        assert(R1 = (A and B)) report "error1"; 
        
        -- testing OR
        C_op <= "01";
        wait for 10ns;
        assert (R1 = (A or B)) report "error2"; 
        
        --testing XOR
        C_op <= "10";
        wait for 10ns;
        assert (R1 = (A xor B)) report "error3"; 
        
        --test NOR
        C_op <= "11";
        wait for 10 ns;
        assert (R1 = (A nor B)) report "error4";
        
        --other values
         A <= "00000000000000011100000000000011";
        B <= "00000011100000000001111000000001";
        
        -- testing AND
        C_op <= "00";
        wait for 10ns;
        assert(R1 = (A and B)) report "error1"; 
        
        -- testing OR
        C_op <= "01";
        wait for 10ns;
        assert (R1 = (A or B)) report "error2"; 
        
        --testing XOR
        C_op <= "10";
        wait for 10ns;
        assert (R1 = (A xor B)) report "error3"; 
        
        --test NOR
        C_op <= "11";
        wait for 10 ns;
        assert (R1 = (A nor B)) report "error4";
        
        --other values
         A <= "00000000000000000000000000000001";
        B <= "00000000000000000000000000000011";
        
        -- testing AND
        C_op <= "00";
        wait for 10ns;
        assert(R1 = (A and B)) report "error1"; 
        
        -- testing OR
        C_op <= "01";
        wait for 10ns;
        assert (R1 = (A or B)) report "error2"; 
        
        --testing XOR
        C_op <= "10";
        wait for 10ns;
        assert (R1 = (A xor B)) report "error3"; 
        
        --test NOR
        C_op <= "11";
        wait for 10 ns;
        assert (R1 = (A nor B)) report "error4";
end process;
        
end Behavioral;
