Identification of UEs
=====================

## Table of contents 
  * [Abstract](#abstract)
  * [Introduction](#introduction)
  * [General Public Subscription Identifier (GPSI)](#general-public-subscription-identifier--gpsi-)
  * [External Identifier format of the GPSI](#external-identifier-format-of-the-gpsi)
  * [AF-specific UE external identifier](#af-specific-ue-external-identifier)
    + [AF obtaining the AF-specific UE External Identifier](#af-obtaining-the-af-specific-ue-external-identifier)
    + [NEF obtaining the AF-specific UE External Identifier](#nef-obtaining-the-af-specific-ue-external-identifier)
  * [UE Identification summary](#ue-identification-summary)
  * [References](#references)


## Abstract 

This document provides an overview and discusses the methods that a 5G Core network has for enabling external parties, such as Application Functions, to identify UEs in the network. Furthermore, the document suggests enabling CAMARA APIs with the capability of identifying UEs with a General Public Subscription Identifier (GPSI) or an IP or Ethernet MAC address.

## Introduction 

A number of CAMARA APIs require the API invoker to identify the UE. The API invoker may have different UE identifiers, for example, a GPSI, in any of its various formats or perhaps the IP or MAC address of the UE. While the GPSI and the MAC address of the UE are permanent identifiers, the UE IP address is temporarily allocated to the UE, might be NATted, and may change during the lifetime of the session towards the application server. 

Identifying a UE is not the same as identifying the PDU session that might be related to an API invocation. For example, a UE might have established several PDU sessions, each one on a different connectivity service (e.g., differnet S-NSSAI or DNN). As a result, the UE might be provisioned with different IP addresses for each PDU session. In cases where the UE is assumed to have established a single PDU session, or where it is possible to correlate the the API invoker to a connectivity service, the combination of it and the UE identification might be sufficient to identify one out of multiple PDU sessions as well.

This document analizes the identifiers at the disposal of the API invoker for identifying a UE and proposes that CAMARA APIs, where possible, enable the UE identification accordingly.

## General Public Subscription Identifier (GPSI)

3GPP defines the GPSI in [TS 23.501][1] clause 5.9.8 and [TS 23.003][2] clause 28.8.

The GPSI was created for addressing a 3GPP subscription in data networks outside of the 3GPP system, so that internal identifiers, such as the Subscription Permanent Identifier (SUPI), were not required to be disclosed to external parties.

As such, 5G Core stores an association between each internal SUPI and one or more GPSIs associated to such SUPI.

The GPSI has two possible formats:

1. An MSISDN (defined in [3GPP TS 23.003][2] clause 3.3). For example: `1555123456`
2. An External Identifier (defined in [3GPP TS 23.003][2] clause 19.7.2), which has the format of _username@realm_ as specified in clause 2.1 of IETF [RFC 4282][3].

Example: `user1AD4@subdomain.example.com`

## External Identifier format of the GPSI 

With respect to the External Identifier format of the SUPI, [3GPP TS 23.003][2] indicates in clause 19.7.2 that the _username_ part contains a _Local Identifier_ as specified in [3GPP TS 23.682][4] and the _realm_ part contains a _Domain Identifier_as specified in [3GPP TS 23.682][4], which must be a duly registered Internet domain name.

Observe that the combination of the Local Identifier and the Domain Identifier makes the External Identifier globally unique.

[3GPP TS 23.682][4] specifies the _Domain Identifier_ as a domain that is under the control of a Mobile Network Operator (MNO) and then indicates that the _Domain Identifier_ is used to identify where services provided by the operator network can be accessed. It is possible for an operator to differentiate services by providing different domain identifiers associated to the same subscription.

The _Local Identifier_, also according to [3GPP TS 23.682][4], is used to derive or obtain the SUPI. It is unique within the applicable domain and managed by the Mobile Network Operator.

Although the concepts of the _Domain Identifier_ and _Local Identifier_ were initially created for Cellular IoT environment, these are generally applicable to any type of user subscription in the mobile network.

## AF-specific UE external identifier 

AF-specific UE external identifier is just a GPSI in the format of an External Identifier, that happens to be defined for a specific Application Function (AF), with the regular format of an External Identifier:

`<localIdentifier>@<AF-specific-domainRealm>`

The AF-specific UE external identifier is associated to the SUPI in UDM/UDR. It is assumed that the MNO provisions the AF-specific UE external identifier in UDM/UDR.

The AF-specified UE external identifier was introduced in 3GPP Rel-17 to solve these problems:

- A UE may change its UE IP address when it is served by an Edge Computing site.
- If the AF identifies the UE with its UE IP address, the AF may lose control when the UE IP address changes.
- The AF-specific UE external identifier takes into consideration privacy of the MSISDN, so that it does not require the user to disclose its MSISDN.

The AF keeps the AF-specific UE external identifier for the duration of the AF session. The AF must not keep a binding to the UE IP address, since the UE IP address may change during the lifetime of the PDU session.

3GPP indicates that the AF-specific UE external identifier must not contain an MSISDN, due to privacy reasons. Please note that a GPSI can still contain an MSISDN, should this privacy reasons be properly addressed (e.g., the user discloses its MSISDN).

Note: it is assumed that the UE IP address indicated by the AF is a public IP address. NAT considerations are left outside the scope of this document.

### AF obtaining the AF-specific UE External Identifier

3GPP has specified several mechanisms for allowing an AF to learn the AF-specific UE external identifier. These mechanisms include:

1. The AF may invoke the Nnef\_UEId\_Get service operation for retrieving the AF-specific UE external identifier. The procedure is specified in [3GPP TS 23.502][5] clause 4.15.10 and allows the AF to use the UE IP or Ethernet address as an input to the query in order to obtain the AF-specific UE External Identifier of the UE.
2. The AF may also obtain the AF-specific UE external identifier in a **response** to any of these service operations:

- Nnef\_EventExposure\_Subscribe (Monitoring Events)
- Nnef\_ParameterProvision\_Create
- Nnef\_ParameterProvision\_Update
- Nnef\_ParameterProvision\_Get

In any of the cases, retrieval of the AF-specific UE external identifier requires a query to UDM/UDR based on the SUPI of the UE. UDM returns the AF-specific UE external identifier and, if legal, privacy, and regulatory aspects allow it, UDM may also deliver additional GPSIs associated to the SUPI, such as an MSISDN.

After obtaining it, the AF may use the AF-specific UE external identifier in subsequent requests where a GPSI is used for identifying the UE.

### NEF obtaining the AF-specific UE External Identifier


There might be occasions where the NEF receives from an AF a request for a UE which is identified by its UE IP or Ethernet address, for example, the request may be related to a subscription to Event Reporting or a Parameter Provision subscription. In these cases the NEF needs to obtain the SUPI of the UE, based on the UE IP address prior to contacting 5GC Network Functions. In this case, when the NEF has received a response from 5G Core, the NEF includes the AF-specific UE external identifier in the response towards the AF. Then, the AF may use this AF specific external UE identifier in subsequent requests for the same UE. This is specified in [3GPP TS 23.502][5], clause 4.15.3.2.13.

## UE Identification summary

There are several methods that an Application Function may use to identify a UE:

1. An AF may identify the UE with its UE IP or Ethernet MAC address, as seen from the AF. This identification pinpoints to one PDU session where the UE Identification can be obtained.
2. The AF may get the GPSI out of band. For example: the AF may also have been provisioned, by the user or the AF, with the MSISDN of the UE. The user might have &quot;logged&quot; into the AF server, in which case, the AF already knows the MSISDN of the UE.
3. The AF may also get a GPSI in the format of AF-specific UE Identifier by querying NEF or in response to certain services, where the initial request uses the UE IP or Ethernet MAC address.
4. The NEF may resolve the UE IP or Ethernet MAC address to a SUPI prior to executing a 5GC operation, learn the AF specific UE External identifier, and return it to the AF for use in subsequent requests.

It seems that use cases exists for using GPSI in any of the possible formats.

NOTE: UE identification must not be confused with identification of the PDU session or QoS flow of a UE.

Camara APIs should enable AFs for identifying the UE primarily with:

- A GPSI represented in any of the possible existing formats.

And secondary (optionally) with:

- The UE IP address or Ethernet MAC address (together with the AF Identifier).


## References

[1]:https://www.3gpp.org/DynaReport/23501.htm
[2]:https://www.3gpp.org/DynaReport/2300.htm
[3]:https://www.rfc-editor.org/rfc/rfc4282
[4]:https://www.3gpp.org/DynaReport/23682.htm
[5]:https://www.3gpp.org/DynaReport/23502.htm

* [1]: 3GPP [TS 23.501](https://www.3gpp.org/DynaReport/23501.htm"): "System Architecture for the 5G System; Stage 2".
* [2]: 3GPP [TS 23.003](https://www.3gpp.org/DynaReport/2300.htm): "Numbering, addressing and identification".
* [3]: IETF [RFC 4282](https://www.rfc-editor.org/rfc/rfc4282): "The Network Access Identifier".
* [4]: 3GPP [TS 23.682](https://www.3gpp.org/DynaReport/23682): "Architecture enhancements to facilitate communications with packet data networks and applications".
* [5]: 3GPP [TS 23.502](https://www.3gpp.org/DynaReport/23502.htm): "Procedures for the 5G System (5GS)".
