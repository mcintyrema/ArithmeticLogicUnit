----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2023 11:15:31 AM
-- Design Name: 
-- Module Name: Logic_Unit - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Logic_Unit is
--  Port ( );
    GENERIC (
      n       : positive := 32);
   PORT( 
      A       : IN     std_logic_vector (n-1 DOWNTO 0);
      B       : IN     std_logic_vector (n-1 DOWNTO 0);
      C_op    : IN     std_logic_vector (1 DOWNTO 0);
      R       : OUT    std_logic_vector (n-1 DOWNTO 0)
   );
end Logic_Unit;

architecture Behavioral of Logic_Unit is

begin
    R <= (A and B) when (C_op(0) = '0' and C_op(1) = '0') else
       (A or B) when (C_op(0) = '1' and C_op(1) = '0') else
       (A xor B) when (C_op(0) = '0' and C_op(1) = '1') else
       (A nor B) when (C_op(0) = '1' and C_op(1) = '1');

end Behavioral;
