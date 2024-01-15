<h1 align="center">CẤU HÌNH OSSEC</h1>

<h2>Cấu hình Ossec Agent</h2>

  Để thêm một Agent mới vào Server truy cập vào 
  ```
  /var/ossec/bin/mamage_agents
  ```

```
****************************************
* OSSEC HIDS v3.7.0 Agent manager.     *
* The following options are available: *
****************************************
   (A)dd an agent (A).
   (E)xtract key for an agent (E).
   (L)ist already added agents (L).
   (R)emove an agent (R).
   (Q)uit.
Choose your action: A,E,L,R or Q:

```
<br>Phần mềm sẽ hiện lên một bảng hệ thống bao gồm các lệnh</br>
```
 A: Thêm một Agent
 E: Key kích hoạt Agent
 L: Danh sách các Agents đã thêm vào |
 R: Xóa một Agent
 Q: Thoát khỏi bảng hệ thống
```
Lựa chọn A để thêm một Agent theo như yêu cầu:
```
Choose your action: A,E,L,R or Q: A

- Adding a new agent (use '\q' to return to the main menu).
  Please provide the following:
   * A name for the new agent: 192.168.1.105 ( nhập tên của Agent muốn tạo )
   * The IP Address of the new agent: 001 ( nhập ip của máy Agent)
   * An ID for the new agent[001]: ( ID của Agent )
Agent information:
   ID: 001
   Name:win7
   IP Address:192.168.1.105

Confirm adding it?(y/n): y ( chọn y để hoàn thành việc thêm Agent )
Agent added with ID 001.

```
Sau đó tiếp tục chọn E để có thế lấy key kích hoạt Agent
```
Available agents:
   ID: 001, Name: win7, IP: 192.168.1.105
Provide the ID of the agent to extract the key (or '\q' to quit): 001

Agent key information for '001' is:
*********************************************************************************************

```
Sau đó lưu lại Extract key
Cài đặt Agent thông qua link: https://updates.atomicorp.com/channels/atomic/windows/ossec-agent-win32-3.7.0-24343.exe
Di chuyển sang máy Agent

![image](https://github.com/Duxk12801/ossec-install/assets/89244582/43222282-a588-478c-abd8-35dc4372be50)

Sau khi quá trình cài đặt hoàn tất, điền ip của Ossec Server vào phần Ossec Server IP đồng thời điền Extract key vào phần Authentication key
Cuối cùng truy cập phần Manage ở góc trái màn hình chọn Start

Trở lại Ossec Server, nhập lệnh 
```
/var/ossec/bin/ossec-control restart
```
Để khởi động lại Server

<h2>Rules trong Ossec</h2>

OSSEC làm việc dựa trên các luật được định nghĩa sẵn trong các file. Các
file được đặt trong thư mục /var/ossec/rules/. Mỗi rule được định nghĩa trong các
file XML đã được phân loại . Ví dụ, tất cả các rule liên quan đến Apache HTTP
Server được lưu trong file có tên là apache_rules.xml, hay tất cả các rule dành cho
Cisco PIX firewall được lưu trong file pix_rules.xml.

![1](https://github.com/Duxk12801/ossec-install/assets/89244582/12f8b68d-416e-44e8-8b04-d77d239326e5)
![2](https://github.com/Duxk12801/ossec-install/assets/89244582/616e35c1-8e93-4f27-8fc5-e2f1df44e894)
![3](https://github.com/Duxk12801/ossec-install/assets/89244582/89109c00-f3c7-44e0-9ace-2e8ac3c628a4)
![4](https://github.com/Duxk12801/ossec-install/assets/89244582/384399fc-42ca-4d09-9c7f-c4ee16161e63)

OSSEC có 16 cấp độ luật:
```

00 - Ignored: Không thực hiện hành động nào. Khi gặp luật có cấp độ này thì sẽ không có thông báo. Các luật này được quét trước tất cả các luật khác. Chúng bao gồm các sự kiện không có sự liên quan về bảo mật.

01 - None (không).

02 - System low priority notification (hệ thống thông báo ưu tiên thấp): Thông báo hệ thống hoặc thông báo trạng thái. Không có sự liên quan về bảo mật.

03 - Successful/Authorized events (sự kiện thành công/được ủy quyền): Bao gồm các lần đăng nhập thành công, tường lửa cho phép sự kiện, v.v.

04 - System low priority error(lỗi ưu tiên hệ thống thấp): Các lỗi liên quan đến cấu hình hoặc thiết bị/ứng dụng không sử dụng. Chúng không có sự liên quan về bảo mật và thường được gây ra bởi các cài đặt mặc định hoặc kiểm thử phần mềm.

05 - User generated error(lỗi do người dùng tạo): Chúng bao gồm mật khẩu bị bỏ lỡ, hành động bị từ chối, v.v. Chính chúng không có sự liên quan về bảo mật.

06 - Low relevance attack (tấn công mức độ liên quan thấp): Chúng chỉ ra một con sâu hoặc virus không ảnh hưởng đến hệ thống (như mã màu đỏ cho các máy chủ apache, vv). Chúng cũng bao gồm các sự kiện IDS thường xuyên và các lỗi thường xuyên.

07 - “Bad word” matching (kết hợp “Từ xấu”): Chúng bao gồm các từ như "bad", "error", v.v. Những sự kiện này hầu như không được phân loại và có thể có một số mức độ liên quan về bảo mật.

08 - First time seen (lần đầu tiên nhìn thấy): Bao gồm các sự kiện lần đầu tiên được xem. Lần đầu tiên một sự kiện IDS được kích hoạt hoặc lần đầu tiên người dùng đăng nhập. Nếu bạn mới bắt đầu sử dụng OSSEC HIDS, những thông báo này có thể sẽ thường xuyên. Sau một thời gian sẽ giảm dần, Nó cũng bao gồm các hành động bảo mật có liên quan (như bắt đầu của một sniffer).

09 - Error from invalid source(lỗi từ nguồn không hợp lệ): Bao gồm các lần đăng nhập dưới dạng người dùng không xác định hoặc từ nguồn không hợp lệ. Có thể có sự liên quan về bảo mật (đặc biệt nếu được lặp lại). Chúng cũng bao gồm các lỗi liên quan đến tài khoản "quản trị" (root).

10 - Multiple user generated errors (tập hợp lỗi do người dùng tạo): Chúng bao gồm nhiều mật khẩu không hợp lệ, nhiều lần đăng nhập không thành công, v.v. Họ có thể chỉ ra một cuộc tấn công hoặc có thể chỉ là người dùng vừa quên thông tin đăng nhập của mình.

11 - Integrity checking warning (cảnh báo kiểm tra tính toàn vẹn): Chúng bao gồm các thông báo liên quan đến việc sửa đổi các tệp nhị phân hoặc sự hiện diện của rootkit (bằng kiểm tra root). Nếu bạn chỉ cần sửa đổi cấu hình hệ thống của bạn, bạn sẽ được báo về các thông báo "syscheck". Nó có thể chỉ ra một cuộc tấn công thành công. Cũng bao gồm các sự kiện IDS sẽ bị bỏ qua (số lần lặp lại cao).

12 - High importancy event (sự kiện quan trọng cao): Chúng bao gồm các thông báo lỗi hoặc cảnh báo từ hệ thống, hạt nhân, v.v. Chúng có thể chỉ ra một cuộc tấn công chống lại một ứng dụng cụ thể.

13 - Unusual error (high importance) - Lỗi bất thường (mức độ quan trọng cao): Hầu hết các lần khớp với một kiểu tấn công chung.

14 - High importance security event (sự kiện bảo mật quan trọng cao): Hầu hết thời gian được thực hiện với sự tương quan và nó chỉ ra một cuộc tấn công.

15 - Severe attack (tấn công nghiêm trọng): Cần chú ý ngay lập tức.
```

<h2>Cấu hình Active Respones</h2>

https://www.ossec.net/docs/docs/manual/ar/ar-unix.html#commands-configuration
https://www.ossec.net/docs/docs/manual/ar/ar-custom.html#configure-the-active-response
