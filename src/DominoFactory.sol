/*---------------------------------------------
|  A chain of ideals, fleeting yet infinite.  |
|  To topple them is to destroy,              |
|  yet in destruction lies the rebirth.       |
---------------------------------------------*/

// SPDX-License-Identifier: WTFPL
pragma solidity ^0.8.0;

import "./Domino.sol";
import "./01_SocialWelfare.sol";
import "./02_FoodSupply.sol";
import "./03_HealthcareService.sol";
import "./04_EducationalSupport.sol";
import "./05_GenderEquality.sol";
import "./06_WaterResourceManagement.sol";
import "./07_RenewableEnergy.sol";
import "./08_LaborStandards.sol";
import "./09_InfrastructureInvestment.sol";
import "./10_SocialInclusion.sol";
import "./11_UrbanPlanning.sol";
import "./12_CircularEconomy.sol";
import "./13_EmissionReduction.sol";
import "./14_MarineConservation.sol";
import "./15_ForestConservation.sol";
import "./16_Peacebuilding.sol";
import "./17_InternationalCooperation.sol";

contract DominoFactory {

    // You can topple the dominoes over and over again.
    function place() public returns (address) {
        Domino[17] memory dominos;
        dominos[0] = new SocialWelfare();
        dominos[1] = new FoodSupply();
        dominos[2] = new HealthcareService();
        dominos[3] = new EducationalSupport();
        dominos[4] = new GenderEquality();
        dominos[5] = new WaterResourceManagement();
        dominos[6] = new RenewableEnergy();
        dominos[7] = new LaborStandards();
        dominos[8] = new InfrastructureInvestment();
        dominos[9] = new SocialInclusion();
        dominos[10] = new UrbanPlanning();
        dominos[11] = new CircularEconomy();
        dominos[12] = new EmissionReduction();
        dominos[13] = new MarineConservation();
        dominos[14] = new ForestConservation();
        dominos[15] = new Peacebuilding();
        dominos[16] = new InternationalCooperation();
        for (uint256 i = 0; i < dominos.length - 1; i++) {
            dominos[i].place(address(dominos[i + 1]));
        }
        return address(dominos[0]);
    }

    // Destroy everything. Ref. EIP-6780.
    function placeAndTopple() public {
        address domino01 = place();
        Domino(payable(domino01)).topple();
    }
}
