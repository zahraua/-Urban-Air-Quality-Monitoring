# Decentralized Urban Air Quality Monitoring and Improvement System

A blockchain-based platform that creates a transparent, incentivized network for monitoring and improving urban air quality through decentralized sensor networks, smart contracts, and tokenized rewards.

## Overview

This system combines IoT air quality sensors, blockchain technology, and smart contracts to create a comprehensive urban air quality monitoring and improvement platform. It incentivizes community participation in air quality improvement initiatives while ensuring transparent and tamper-proof data collection.

## Key Features

### Real-time Monitoring Network
- Distributed network of IoT air quality sensors throughout urban areas
- Continuous monitoring of key pollutants (PM2.5, PM10, NO2, SO2, O3, CO)
- Tamper-proof data storage on blockchain
- Real-time air quality index (AQI) calculation and reporting

### Smart Contract System
- Automated data validation and verification
- Transparent reward distribution for air quality improvements
- Voting mechanism for community-driven initiatives
- Integration with public transportation systems for comprehensive data analysis

### Incentive Structure
- Token rewards for sensor node operators
- Incentives for businesses implementing pollution reduction measures
- Community rewards for participating in clean air initiatives
- Special NFTs for significant contributions to air quality improvement

### Mobile Application
- Real-time air quality maps and alerts
- Personal exposure tracking
- Contribution history and reward management
- Community engagement features

## Technical Architecture

### Backend Infrastructure
- Ethereum-based smart contracts for data management and rewards
- IPFS for distributed sensor data storage
- Oracle network for external data validation
- REST API for mobile and web applications

### Hardware Components
- Modified ESP32-based sensor nodes
- PM2.5/PM10 sensors
- Gas sensors (NO2, SO2, O3, CO)
- GPS modules for location tracking
- LoRaWAN connectivity for remote areas

## Smart Contracts

### SensorRegistry.sol
- Manages sensor node registration and validation
- Tracks sensor reputation and data quality
- Handles sensor node rewards distribution

### AirQualityData.sol
- Stores and manages air quality measurements
- Implements data validation rules
- Calculates air quality indices

### RewardSystem.sol
- Manages token distribution
- Handles NFT minting for achievements
- Implements reward calculations

## Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/urban-air-quality-system

# Install dependencies
npm install

# Set up environment variables
cp .env.example .env
# Edit .env with your configuration

# Deploy smart contracts
npx hardhat deploy --network <network-name>

# Start the backend server
npm run start:server

# Launch the frontend application
npm run start:client
```

## Configuration

Create a `.env` file with the following variables:
```
ETHEREUM_RPC_URL=
PRIVATE_KEY=
IPFS_PROJECT_ID=
IPFS_PROJECT_SECRET=
ORACLE_API_KEY=
```

## Usage

### Running a Sensor Node
1. Flash the sensor node firmware
2. Register the node through the web interface
3. Deploy the sensor in a suitable location
4. Monitor node status through the dashboard

### Participating in the Network
1. Create an account in the mobile app
2. View real-time air quality data
3. Participate in improvement initiatives
4. Earn rewards for contributions

## Contributing

We welcome contributions! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

- Project Website: https://airquality.network
- Email: contact@airquality.network
- Twitter: @AirQualityNet
- Discord: https://discord.gg/airquality

## Acknowledgments

- Environmental Protection Agency for air quality standards
- OpenZeppelin for smart contract libraries
- The entire open-source community
