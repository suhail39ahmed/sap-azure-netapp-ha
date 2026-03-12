# SAP on Azure NetApp HA

**Terraform + Python replication for SAP HANA HA across zones**

High-availability SAP HANA infrastructure on Azure using NetApp Files for shared storage, cross-zone replication via Python automation, Pacemaker clustering, and Terraform-managed infrastructure. Delivered zero-downtime SAP migration.

## Tech

Terraform · Azure NetApp Files · Python · SAP HANA · Pacemaker · Azure · Ansible

## Highlights

- Azure NetApp Files cross-zone replication with < 1s lag
- Python agent for automated failover detection and PCMK control
- Terraform modules for ANF volumes, capacity pools, VNets
- Ansible playbooks for SAP HANA system replication setup
- Zero-downtime cutover with pre-validation test scripts

## Metrics

- Zero data loss RPO
- < 2min RTO failover
- SAP HANA replication lag < 1s
- Key Contributor Award

## License

MIT
