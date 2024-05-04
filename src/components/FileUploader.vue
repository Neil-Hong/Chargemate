<template>
  <div id="FileUploader">
    <!-- <b-form-file
      v-model="files"
      v-if="address!==null"
      :state="Boolean(files)"
      placeholder="Choose a file or drop it here..."
      :multiple="true"
    ></b-form-file> -->

    <!-- <p v-if="address===null">Connect Your Wallet </p> -->

    <br /><br />

    <div v-if="sending===false">
      <b-button
        v-if="address===null"
        variant="secondary"
        @click="requestAccount()"
      > 
        Connect My Wallet
      </b-button>
      
      <b-button
        v-if="address!==null"
        variant="outline-dark"
        @click="switchtoMantle()"
      > 
        Connect MANTLE
      </b-button>
      &nbsp;&nbsp;&nbsp;
      <b-button
        v-if="address!==null"
        variant="outline-dark"
        @click="switchtoBase()"
      > 
      Connect &nbsp;&nbsp;BASE&nbsp;&nbsp;&nbsp;&nbsp;
      </b-button>
      
      <!-- <p>Drivers Verification: </p>
      <b-button
        variant="outline-dark"
        @click="switchtoBase()"
      > 
      Verify with World ID
      </b-button>
      <br /><br />

      <p>Vehicle type Verification: </p>
      <div class="input-group mb-3">
        <div class="input-group-prepend" id="button-addon3">
          <button class="btn btn-outline-secondary" type="button">Eletrical</button>
          <button class="btn btn-outline-secondary" type="button">Hybrid</button>
          <button class="btn btn-outline-secondary" type="button">Combustion</button>
        </div>
      </div>

      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text" id="basic-addon1">Registration Number: </span>
        </div>
        <input type="text" class="form-control" placeholder="e.g. DX-332" aria-label="RDX-332" aria-describedby="basic-addon1">
      </div>

      <b-button
        variant="outline-dark"
        @click="switchtoBase()"
      > 
      Next
      </b-button> -->
<!-- 
      <p>Driver: Verified ✅</p>
      <p>Vechicle Type: EV ⚡️ ✅</p>
      <br />

      <p>Start Location: 1600 Amp Parkway, Mountain View, CA</p>
      <p>Start Time: Saturday, 4 May 2024 7:20pm</p>

      <p>Start Location: 100 Lude st, Mountain View, CA</p>
      <p>Start Time: Saturday, 4 May 2024 8:00pm</p> -->

      <!-- <svg xmlns="http://www.w3.org/2000/svg" width="160" height="160" fill="currentColor" class="bi bi-ev-front" viewBox="0 0 16 16">
      <path d="M9.354 4.243a.19.19 0 0 0-.085-.218.186.186 0 0 0-.23.034L6.051 7.246a.188.188 0 0 0 .136.316h1.241l-.673 2.195a.19.19 0 0 0 .085.218c.075.043.17.03.23-.034l2.88-3.187a.188.188 0 0 0-.137-.316H8.572z"/>
      <path d="M4.819 2A2.5 2.5 0 0 0 2.52 3.515l-.792 1.848a.8.8 0 0 1-.38.404c-.5.25-.855.715-.965 1.262L.05 8.708a2.5 2.5 0 0 0-.049.49v.413c0 .814.39 1.543 1 1.997V13.5a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-1.338c1.292.048 2.745.088 4 .088s2.708-.04 4-.088V13.5a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-1.892c.61-.454 1-1.183 1-1.997v-.413q0-.248-.049-.49l-.335-1.68a1.8 1.8 0 0 0-.964-1.261.8.8 0 0 1-.381-.404l-.792-1.848A2.5 2.5 0 0 0 11.181 2H4.82ZM3.44 3.91A1.5 1.5 0 0 1 4.82 3h6.362a1.5 1.5 0 0 1 1.379.91l.792 1.847a1.8 1.8 0 0 0 .853.904c.222.112.381.32.43.564l.336 1.679q.03.146.029.294v.413a1.48 1.48 0 0 1-1.408 1.484c-1.555.07-3.786.155-5.592.155s-4.037-.084-5.592-.155A1.48 1.48 0 0 1 1 9.611v-.413q0-.148.03-.294l.335-1.68a.8.8 0 0 1 .43-.563c.383-.19.685-.511.853-.904z"/>
    </svg> -->

    <!-- <br /><br />

      <b-button
        variant="outline-dark"
        @click="switchtoBase()"
      > 
      Get Reward
      </b-button> -->
      
    </div>
<br /> 
<br />
    <p v-if="address!==null && sending===false">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wallet" viewBox="0 0 16 16">
          <path d="M0 3a2 2 0 0 1 2-2h13.5a.5.5 0 0 1 0 1H15v2a1 1 0 0 1 1 1v8.5a1.5 1.5 0 0 1-1.5 1.5h-12A2.5 2.5 0 0 1 0 12.5zm1 1.732V12.5A1.5 1.5 0 0 0 2.5 14h12a.5.5 0 0 0 .5-.5V5H2a2 2 0 0 1-1-.268M1 3a1 1 0 0 0 1 1h12V2H2a1 1 0 0 0-1 1"/>
        </svg>
        {{ address[0].slice(0,3) }}...{{ address[0].slice(-4) }}</p>



    <div v-if="sending===true">
      <b-spinner label="Spinning"></b-spinner>
      <b-card-text>Sending to IPFS</b-card-text>
    </div>


  </div>
</template>

<script>
  import { Web3Storage } from 'web3.storage';
  import Dwetransfer from '../../artifacts/contracts/Dwetransfer.sol/Dwetransfer.json'
  import { BigNumber, ethers } from "ethers";

  export default {
    name: "FileUploader",
    data() {
      return {
        files: null,
        sending: false,
        address: null,
        fileId: null,
      }
    },
    methods: {
      async switchtoBase() {
        window.ethereum.request({
          method: 'wallet_switchEthereumChain',
          params: [{ chainId: '0x14a34' }]
        }).then(response => console.log(response))
      },

      async switchtoMantle() {
        window.ethereum.request({
          method: 'wallet_switchEthereumChain',
          params: [{ chainId: '0x138b' }]
        }).then(response => console.log(response))
      },

      async requestAccount() {
        var currentAccount = null;

        if(window.ethereum) {
          console.log("Metamask detected");
        } else {
          console.log("Metamask not detected...");
        }

        currentAccount = await window.ethereum.request({ method: 'eth_requestAccounts' });

        this.address = currentAccount;
        
        console.log("Current Account :" + currentAccount);
      },

      async uploadFile(files) {
        console.log(files);

        const client = new Web3Storage({ token: process.env.VUE_APP_WEB3STORAGE_API_TOKEN });

        const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const signer = provider.getSigner()

        try {
          const contract = new ethers.Contract(contractAddress, Dwetransfer.abi, signer)
          const options = {value: ethers.utils.parseEther("1")};
          let rootCid = "";

          
          try {
              this.sending = true;
              rootCid = await client.put(files);
              console.log("Successfully sent to IPFS");
              console.log("rootCid :" + [rootCid]);
          } catch {
            this.sending = false;
            this.$emit('update-error', true);
            console.log("Failed to send file... ");
          }

          let tx = await contract.uploadFile(rootCid, options);
          let rc = await tx.wait();
          let BigNumberFileIdHex = rc.events[0].args["fileId"]._hex;
          this.fileId = BigNumber.from(BigNumberFileIdHex).toNumber();
          console.log(tx);
          console.log("rc:");
          console.log(rc);
          console.log(rc.events[0].args["fileId"]._hex);
          console.log("fileId");
          console.log(this.fileId);

          this.sending = false;
          this.$emit('update-fileid', this.fileId);
          this.$emit('update-cids', [rootCid]);
          console.log("contract executed successfully!")
          console.log("https://localhost:8080/download/" + this.fileId);
          
            
        } catch {
            this.$emit('update-error', true);
            console.log("Failed to execute contract!");
        }
      } 
    }
  }
</script>