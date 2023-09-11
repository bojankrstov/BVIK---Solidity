const hre = require("hardhat");

async function main() {
    const FinkiNFT = await hre.ethers.getContractFactory("FinkiNFT");
    const finkiNFT = await FinkiNFT.deploy();

    await finkiNFT.deployed();

    console.log("Finki NFT deployed to:", finkiNFT.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
