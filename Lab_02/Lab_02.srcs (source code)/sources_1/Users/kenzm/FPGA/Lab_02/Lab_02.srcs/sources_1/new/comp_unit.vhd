----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/03/2023 02:11:57 PM
-- Design Name: 
-- Module Name: Comparator_Unit - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Comparator_Unit is
    GENERIC (
      n       : positive := 32);
    Port ( 
        A_31 : IN STD_LOGIC;
        B_31 : IN STD_LOGIC;
        S_31 : IN STD_LOGIC;
        CO : IN STD_LOGIC;
        C_op : IN STD_LOGIC_VECTOR(1 downto 0);
        R : OUT STD_LOGIC_VECTOR(n-1 downto 0)
    );
end Comparator_Unit;

architecture Behavioral of Comparator_Unit is

begin
    R(n-1 downto 1) <= 
                    (others => '0');
                    
    R(0) <= '0' when (C_op(1) = '1' and C_op(0) = '0' and A_31 = '0' and B_31 = '0' and S_31 = '0') else
            '1' when (C_op(1) = '1' and C_op(0) = '0' and A_31='0' and B_31 = '0' and S_31 = '1') else
            '0' when (C_op(1) = '1' and C_op(0) = '0' and A_31='1' and B_31 = '1' and S_31 = '0') else
            '1' when (C_op(1) = '1' and C_op(0) = '0' and A_31='1' and B_31 = '1' and S_31 = '1') else
            '1' when (C_op(1) = '1' and C_op(0) = '0' and A_31='1' and B_31 = '1') else
            '0' when (C_op(1) = '1' and C_op(0) = '0' and A_31='0' and B_31 = '1') else
            '0' when (C_op(1) = '1' and C_op(0) = '1' and CO = '1') else
            '1' when (C_op(1) = '1' and C_op(0) = '1' and CO = '0') else
            '0' when (C_op(1) = '0' and C_op(0) = '0') else
            '0' when (C_op(1) = '0' and C_op(0) = '1');
            

end Behavioral;
