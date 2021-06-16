# motion
Run Motion Webcam Server in a Docker Container

based on https://www.instructables.com/How-to-Make-Raspberry-Pi-Webcam-Server-and-Stream-/

motion project homepage https://motion-project.github.io/

attach a usb device to a proxmox vm https://pve.proxmox.com/wiki/USB_Devices_in_Virtual_Machines

make a pod consume it:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: motion
  name: motion
  namespace: webcam
spec:
  replicas: 1
  selector:
    matchLabels:
      app: motion
  strategy: {}
  template:
    metadata:
      labels:
        app: motion
    spec:
      containers:
      - image: travnewmatic/motion
        imagePullPolicy: Always
        name: motion
        securityContext:
          privileged: true
        volumeMounts:
        - mountPath: /dev/video0
          name: webcam
        ports:
        - containerPort: 8080
          name: control
          protocol: TCP
        - containerPort: 8081
          name: stream
          protocol: TCP
      nodeName: k3s1-node1
      volumes:
      - name: webcam
        hostPath:
          path: /dev/video0
```
