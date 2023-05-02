----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2023 01:45:28 PM
-- Design Name: 
-- Module Name: Comparator_TB - Behavioral
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

entity Comparator_TB is
--  Port ( );
end Comparator_TB;

architecture Behavioral of Comparator_TB is

component Comparator_Unit is
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
    end component;
    
    constant n : positive := 32; 
    signal A_31 : std_logic;
    signal B_31 : std_logic;
    signal S_31 : std_logic;
    signal CO : std_logic;
    signal C_op : std_logic_vector(1 downto 0);
    signal R : std_logic_vector(n-1 downto 0);
    signal R_negative: std_logic_vector(n-1 downto 0) := X"00000001";
    signal R_positive: std_logic_vector(n-1 downto 0) := X"00000000";

begin

DUT : Comparator_Unit
    generic map(
        n => n)
    port map(
        A_31 => A_31,
        B_31 => B_31,
        S_31 => S_31,
        CO => CO,
        C_op => C_op,
        R => R);

process
    begin
    --test case 1
    A_31 <= '0';
    B_31 <= '0';
    S_31 <= '0';
    CO <= '1';
    C_op <= "00";
    wait for 10 ns;
    assert(R = R_positive) report "error1";
    wait for 10 ns;
    
    --case 2
    A_31 <= '1';
    B_31 <= '0';
    S_31 <= '0';
    CO <= '0';
    C_op <= "00";
    wait for 10 ns;
    assert(R = R_positive) report "error2";
    wait for 10 ns;
    
    --case 3
    A_31 <= '0';
    B_31 <= '0';
    S_31 <= '0';
    CO <= '1';
    C_op <= "11";
    wait for 10 ns;
    assert(R = R_positive) report "error3";
    wait for 10 ns;
    
    --case 4
    A_31 <= '0';
    B_31 <= '0';
    S_31 <= '0';
    CO <= '0';
    C_op <= "11";
    wait for 10 ns;
    assert(R = R_negative) report "error4";
    wait for 10 ns;
    
    --case 5
    A_31 <= '0';
    B_31 <= '0';
    S_31 <= '0';
    CO <= '1';
    C_op <= "01";
    wait for 10 ns;
    assert(R = R_positive) report "error5";
    wait for 10 ns;
    
    --case 6
    A_31 <= '0';
    B_31 <= '0';
    S_31 <= '1';
    CO <= '0';
    C_op <= "10";
    wait for 10 ns;
    assert(R = R_negative) report "error6";
    wait for 10 ns;
    
    --case 7
    A_31 <= '1';
    B_31 <= '0';
    S_31 <= '0';
    CO <= '0';
    C_op <= "10";
    wait for 10 ns;
    assert(R = R_negative) report "error7";
    wait for 10 ns;
    
    --case 8
    A_31 <= '1';
    B_31 <= '1';
    S_31 <= '1';
    CO <= '0';
    C_op <= "10";
    wait for 10 ns;
    assert(R = R_negative) report "error8";
    wait for 10 ns;
    
end process;
end Behavioral;
