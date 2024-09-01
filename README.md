<p align="center">
<img src="https://readme-typing-svg.herokuapp.com?color=%2336BCF7&center=true&vCenter=true&lines=Welcome+to+github+Rerechan02" />
</p>
<b>
<p align='center'><a href="https://api.daily.dev/get?r=Rerechan02"><img src="https://telegra.ph/file/0cd2f21fc503b748258c8.png" width="150" alt="Hayuk"/></a></p>

![Rerechan02 card name](https://cardivo.vercel.app/api?name=Rerechan%20Store&description=Hi,%20everyone!%20and%20Nice%20to%20meet%20you%20%F0%9F%91%8B&image=https://raw.githubusercontent.com/Rerechan02/simple-xray/main/funny1.jpg?v=4&backgroundColor=%23ecf0f1&telegram=/&github=Rerechan02&pattern=leaf&colorPattern=%23eaeaea)
</b>


<br />
<br />
<p align="center">
<img height=21 src="https://komarev.com/ghpvc/?username=Rerechan02">
</p>
<p align="center">
<img src="https://readme-typing-svg.herokuapp.com?color=%2336BCF7&center=true&vCenter=true&lines=R+E+R+E+C+H+A+N+0+2" />
</p>
<div height='45' align="center">

### API
Integrated API With Autoscript By [**FN Project**](https://t.me/fn_project)

<div height='45' align="left">

## Configuration

Menu API:

    menu-api

## Endpoint

Format :

    http://[domain.com]/api/[path]

Example :

    http://www.rerechan.com/api/addssh

## Create
Method : `POST`

|Tunnel|Path|API Token|username|password|expired|core|limit-ip|
|--|--|--|--|--|--|--||
|SSH/OpenVPN|/addssh|✅|✅|✅|✅|⛔️|✅|
|VMess|/add-vmess|✅|✅|⛔️|✅|✅|⛔️|
|VLess|/add-vless|✅|✅|⛔️|✅|✅|⛔️|
|Trojan|/add-trojan|✅|✅|⛔️|✅|✅|⛔️|
|Shadowsocks|/add-ss|✅|✅|⛔️|✅|✅|⛔️|
|Socks5|/add-socks|✅|✅|✅|✅|✅|⛔️|
|NoobZVPNS|/add-noobz|✅|✅|✅|✅|⛔️|⛔️|

## CEK TOTAL ACCOUNT
Method : `GET`

|Tunnel|Path|API Token|usermame|password|expired|core|
|--|--|--|--|--|--|--|
|SSH/OpenVPN|/list-ssh|✅|⛔|⛔|⛔|⛔|
|X-Ray|/list-xray|✅|⛔|⛔|⛔|⛔|
|NoobZVPNS|/list-noobz|✅|⛔|⛔|⛔|⛔|

## CEK User IP Login ACCOUNT
Method : `GET`

|Tunnel|Path|API Token|usermame|password|expired|core|
|--|--|--|--|--|--|--|
|SSH/OpenVPN|/cek-ssh|✅|⛔|⛔|⛔|⛔|
|X-Ray|/cek-xray|✅|⛔|⛔|⛔|⛔|

## DELETE Account
Method : `DELETE`

|Tunnel|Path|API Token|usermame|password|expired|core|
|--|--|--|--|--|--|--|
|SSH/OpenVPN|/delete-ssh|✅|✅|⛔|⛔|⛔|
|X-Ray|/delete-xray|✅|✅|⛔|⛔|⛔|
|NoobZVPNS|/delete-noobz|✅|✅|⛔|⛔|⛔|

## Renew Account
Method : `PUT` or `POST`
|Tunnel|Path|API Token|usermame|password|days|core|
|--|--|--|--|--|--|--|
|SSH/OpenVPN|/renew-ssh|✅|✅|⛔|✅|⛔|
|X-Ray|/renew-xray|✅|✅|⛔|✅|⛔|


**Note**

✅ - Required

⛔️ - not required

## Response

Success

    {
    	"ok": true,
    	...
    }

Failed

    {
    	"ok": false,
    	"description": "Error Message"
    }
