//To interact with the deployed contract from a frontend app, use Web3.js:

const Web3 = require('web3');
const web3 = new Web3(Web3.givenProvider || 'http://localhost:7545'); // Connect to Ganache

// ABI and contract address after deploying via Truffle
const contractABI = [/* ABI from compiled contract */];
const contractAddress = '0xYourDeployedContractAddress';

const mentalHealthContract = new web3.eth.Contract(contractABI, contractAddress);

// Function to add a record
async function addRecord(patientAddress, encryptedRecord) {
  const accounts = await web3.eth.getAccounts();
  await mentalHealthContract.methods.addRecord(patientAddress, encryptedRecord).send({ from: accounts[0] });
}

// Function to get patient's own records
async function getRecords() {
  const accounts = await web3.eth.getAccounts();
  const records = await mentalHealthContract.methods.getRecords().call({ from: accounts[0] });
  return records;
}
