/********************************************************************************************/
/*
/*     ___                _   _       ___               _         _    _ _    
/*    / __|_ __  ___  ___| |_| |_    / __|_ _ _  _ _ __| |_ ___  | |  (_) |__ 
/*    \__ \ '  \/ _ \/ _ \  _| ' \  | (__| '_| || | '_ \  _/ _ \ | |__| | '_ \
/*   |___/_|_|_\___/\___/\__|_||_|  \___|_|  \_, | .__/\__\___/ |____|_|_.__/
/*                                         |__/|_|           
/*              
/* Copyright (C) 2023 - Renaud Dubois - This file is part of SCL (Smooth CryptoLib) project
/* License: This software is licensed under MIT License        
/* Description: this contract wrap the ASM Poseidon generated by circomlibjs from Jordy  Baylina                               
/********************************************************************************************/
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19 <0.9.0;

//how to use: you need to initiate the constructor with the address of the deployed bytecode
//bytecode to deploy is wirtten in poseidon5.json, after displaying this line of circomlibs
//https://github.com/iden3/circomlibjs/blob/4f094c5be05c1f0210924a3ab204d8fd8da69f49/test/poseidoncontract.js#L29

contract Poseidon5{
  
   //a pointer to the bytecode of the contract
   address bytecode;

   constructor(address where){
    bytecode=where;
   }

   function poseidon(uint256[5] memory input) public returns(bool flag, bytes memory res)
    {
      bytes memory payload = abi.encodeWithSignature("poseidon(uint256[5])",input);

     return( address(bytecode).call(payload));
     
    }
}