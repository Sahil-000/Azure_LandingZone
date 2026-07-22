# Azure Enterprise Landing Zone (Hub & Spoke Architecture)

## Project Overview
This repository contains the Infrastructure as Code (IaC) necessary to deploy a foundational Azure Landing Zone. Built entirely with Terraform, this project demonstrates a scalable, secure, and enterprise-ready cloud environment utilizing a traditional Hub and Spoke network topology. 

The goal of this project is to showcase automated cloud infrastructure provisioning, bridging the gap between day-to-day operational support and robust, scalable cloud engineering.

## Architecture Diagram
```mermaid
graph TD
    subgraph Management Group Hierarchy
        Root[Tenant Root Group]
        Plat[Platform Management Group]
        LZ[Landing Zones Management Group]
        
        Root --> Plat
        Root --> LZ
    end

    subgraph Hub Virtual Network
        FW[Azure Firewall]
        HubSubnet[Hub Subnets]
    end

    subgraph Spoke Virtual Network
        AppSubnet[Application Workloads]
    end

    Plat -. Governs .-> HubSubnet
    LZ -. Governs .-> AppSubnet

    HubSubnet <==>|VNet Peering| AppSubnet
    AppSubnet -->|Routes traffic through| FW