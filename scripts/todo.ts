import { ethers } from "hardhat";

async function main() {
  
  const [deployer] = await ethers.getSigners();
  console.log(`Address deploying the contract --> ${deployer.address}`);

  const vaultAmount = ethers.utils.parseEther("1");

  const todo = await ethers.getContractFactory("TodoList");
  const Todo = await todo.deploy();

  await Todo.deployed();

  console.log("Vault of 1 ETH deployed to:", Todo.address);

  let result = await Todo.createTodo(
        "play games",
        1661449247
  )

  let response = (await result.wait());

 console.log("factory cloned successfully", response);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
