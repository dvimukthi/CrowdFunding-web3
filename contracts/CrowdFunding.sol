// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Campaign {
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountColected;
        string image;
        address[] donators;
        address[] donations;
    }

    mapping(uint256 => Campaign) public campaigns;

    uint256 public numberofCampaigns = 0;

    function createCampaign(
        address _owner,
        string memory _title,
        string memory _description,
        uint256 _target,
        uint256 _deadline,
        string memory _image
    ) public returns (uint256) {
        Campaign storage campaign = campaigns[numberofCampaigns];

        require(
            campaign.deadline < block.timestamp,
            "The deadline should be a date in the future."
        );

        campaign.owner = _owner;
        campaign.title = _title;
        campaign.description = _description;
        campaign.target = _target;
        campaign.deadline = _deadline;
        campaign.amountColected = 0;
        campaign.image = _image;

        numberofCampaigns++;

        return numberofCampaigns - 1;
    }

    function donateToCampaign() {}

    function getDonators() {}

    function getCampaigns() {}
}
