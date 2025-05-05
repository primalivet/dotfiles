{ pkgs, ... }:
{
  users.users.gustaf = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$.TJ/b9UC4jo3TOvz$DqfuGS5oj6O.X/zyHRRP9pjHJ9MbqcOHvfjSZbOFoBgMOE6dBvwXCbdqG0qkX2tC27pFZ0Hzgbics5TH2XDmU/";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDp7yzlnHtcS7TliFQcaHKiojr6frzHsZ62F5kp62eeE0mmACB4vnwvWF+z6jusZpqZ1vNej5Sjh6O1phj4igtTQ5OV+D9imbhBmFvGfP9hvaIvWgdqBipeJ454u9G8n7rx9rgiPekzJfNuCpjRqJrDdc8upQJfTZTVzuDjA3yPg4rVq9L4wJWBZUzukzDEKRjrkmXE6Cuwa5xUhpViedz49+IIQypSXT/v3REnrsCO0qNm45kXhEMFH9qv12HS56jZW6ndx+OJjfhXyab8UChivFiAt/QpF3bdhtRCJ74M0bAFSsAb3UhGJ/37mslatZUH0NQpQdzIrWpzIYUFMAmKPN0pyOEzo7IVMlSdD9Tm8DkpeXPv8qDF/CBo6ms7FpDqPKm+J2kH9V7lo88Jm0FjFLYBGXcTv4a92o+nkYAB0Ga/thhbqL/Q2Zmjf+0X8S2QL5v7hey9HmVNV60hAn0merFesg2BX7oVp7QxyvUy8Vj1GnB41Ph2BSFvLhShpW8= gustaf@Gustafs-MacBook-Pro.local"
    ];
    packages = with pkgs; [ ];
  };
}
