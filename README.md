# Azure Enterprise Landing Zone (Hub & Spoke Architecture)

## Project Overview
This repository contains the Infrastructure as Code (IaC) necessary to deploy a foundational Azure Landing Zone. Built entirely with Terraform, this project demonstrates a scalable, secure, and enterprise-ready cloud environment utilizing a traditional Hub and Spoke network topology. 

The goal of this project is to showcase automated cloud infrastructure provisioning, bridging the gap between day-to-day operational support and robust, scalable cloud engineering.

## Architecture Diagram

```mermaid
graph TD
    %% Management Groups
    Root["Tenant Root Group"]
    Plat["Platform"]
    LZ["Landing Zones"]
    
    Root --> Plat
    Root --> LZ
    
    %% Subscription
    Sub["Subscription (Basic plan)"]
    LZ --> Sub
    
    %% Firewall
    FW["Azure Firewall<br/>(Basic SKU, routes traffic)"]
    
    %% Network Layer
    subgraph Network_Layer["Network layer"]
        direction LR
        subgraph Hub["Hub VNet (10.0.0.0/16)"]
            H_Sub1["AzureFirewallSubnet 10.0.1.0/26"]
            H_Sub2["AzureBastionSubnet 10.0.2.0/26"]
        end
        
        subgraph Spoke["Spoke VNet (10.1.0.0/16)"]
            S_Sub1["Workload subnet 10.1.0.0/24"]
            S_Sub2["+ Mgmt subnet 10.0.3.0/26"]
        end
        
        Hub <==>|"Peering"| Spoke
    end
    
    Sub --> Network_Layer
    FW -.-> H_Sub1