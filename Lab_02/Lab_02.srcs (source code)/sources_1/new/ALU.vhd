----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2023 02:29:33 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
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
end ALU;

architecture Behavioral of ALU is

    component Logic_Unit is
    GENERIC (
      n       : positive := 32);
    PORT( 
          A       : IN     std_logic_vector (n-1 DOWNTO 0);
          B       : IN     std_logic_vector (n-1 DOWNTO 0);
          C_op    : IN     std_logic_vector (1 DOWNTO 0);
          R       : OUT    std_logic_vector (n-1 DOWNTO 0)
       );
    end component;
    
    component Arith_Unit IS
   GENERIC (
      n       : positive := 32);
   PORT( 
      A       : IN     std_logic_vector (n-1 DOWNTO 0);
      B       : IN     std_logic_vector (n-1 DOWNTO 0);
      C_op    : IN     std_logic_vector (1 DOWNTO 0);
      CO      : OUT    std_logic;
      OFL     : OUT    std_logic;
      S       : OUT    std_logic_vector (n-1 DOWNTO 0);
      Z       : OUT    std_logic
      );
    end component;
    
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
    
    
    component Shifter_Unit is
--  Port ( );
    GENERIC (
      n       : positive := 32);
   PORT( 
      A       : IN     std_logic_vector (n-1 DOWNTO 0);
      SHAMT   : IN     std_logic_vector (4 DOWNTO 0);
      C_op    : IN     std_logic_vector (1 DOWNTO 0);
      R       : OUT    std_logic_vector (n-1 DOWNTO 0)
   );
    end component;

    signal LogicalR : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal ArithR : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal Carryout : STD_LOGIC;
    signal CompR : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal ShiftR : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal ALUOp_Sel : STD_LOGIC_VECTOR(1 DOWNTO 0); 
--------------------------------------------------------------------
begin

    ALU_Logical : Logic_Unit
    generic map(
        n => n)
    port map(
        A => A, 
        B => B,
        C_op => ALUOp(1 downto 0),
        R => LogicalR);
        
        
    ALU_Arith : Arith_Unit
    generic map(
        n => n)
    port map(
        A => A, 
        B => B, 
        C_op => ALUOp(1 downto  0),
        CO => Carryout,
        OFL => Overflow, 
        S => ArithR, 
        Z => Zero);
        
        
    ALU_Comp : Comparator_Unit
    generic map(
        n => n)
    port map(
        A_31 => A(31), 
        B_31 => B(31), 
        CO => Carryout, 
        S_31 => ArithR(31), 
        C_op => ALUOp(1 downto 0), 
        R => CompR
        );
        
        
     ALU_Shift : Shifter_Unit
     generic map(
        n => n)
    port map(
        A => A, 
        SHAMT => SHAMT, 
        C_op => ALUOp(1 downto 0), 
        R => ShiftR
    );
    
    -----------------------------------------------------------
    
    ALUOp_Sel <= ALUOp(3 downto 2);
    
    WITH ALUOp_Sel SELECT
        R <= LogicalR when "00", 
          ArithR when "01", 
          CompR when "10",
          ShiftR when "11",
          (others => '0') when others; 
end Behavioral;
