This is an example for enable/disable services in different ports.

The usage of this sample is for example if we have a node port service, and we want
to stop traffic form one port.

In the sample we have two different services with different ports to the same port, 
that will let us to have a different port for smoke test's.

Application installation:

```
make set-app
```

- Disable service 1, and enable service 2:

```
make disable-route-one
```

- Disable service 2, and enable service 1:

```
make disable-route-two
```