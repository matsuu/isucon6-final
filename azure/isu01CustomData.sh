#!/bin/sh

set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y ansible git

cd /tmp
cat > .id_rsa <<EOF
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEApYYNairj4va7CiY2pEe3n/uzspiivADfhqDukClVrtO9XAcK
EyaUQYR9yJTEMwA7dx5T9Z+hcUUfONqySdsLF64Bwb39eTDoWmoTAF2ZraNrmxRj
fhJRypo33w8ZxRe0BCnQGMoSNMkNr1eReL7Gi/yoDHdR3X+LHbMMbwl8h2gLc+Kn
bLGb9GZ3flkJAEgGgGnKZPfPGBa005c7gPez79MRDqsl4az9a4fz4QlrKJIIhYPY
JOP73EgoYpHsFqWWM6TAG9uujbsfm1L/bXb3oytIwhlfh1ls2C6et/Su6FaboBzs
eHTeY/c7b2GfnkQX1j290rEbMLiWeC23RekdxwIDAQABAoIBAB4VQgTkrKxIWXAb
x9yNqELsVRmFgjYXFoj6YMFUsdznYMgEA4G9hj5uHQpCd3IpfaVFns7KZ2YVwPnt
TW/83oQ8PNeAdzv6dpBQLQno+RBE3j6+MuLr42+mHbdtoCphB3emPcrzluF/FPyk
Nq0yRxWUItq5KOjP0HHiY8UefUKCjHVXpltjmG4MJGjd6Ne3Ny1zPrT7Lx3Y8wmh
rKRCp2gfdkfzjGwfa+c2h6c/DSdeoL/RhG5UWhS2GxQwLFalHvp7vgAQbC4RVuEU
KOpk//TlO1wfGTQ+p8mURcc3NTA2O5I1kBtAvCkq0pm5MF+savWpTgo4RdG4iGyN
nl3MOYECgYEA2m2dOOBnUyr+1WmYrQISbuqr47Tf/7/fUia3Wt8vQptOVpg46Tda
mKD9qSTXFbCroF0a7fpjoNppj7s3gcMM9MP5WeXZ2Q6X6Zi4iooJ4GsjpPp5McLZ
/pjPkD0bnUeqvitVO7IIlI1hC8KDakBhrflxkkX8blLwKIqZbALlicECgYEAwf7P
l/azpUcVAVYwn0X466Dzsa6RwfQ1j6AoMdU68RD4OL7AYGSwUQEUV7i4nKSskT4M
Goyp0+GP2fa979flSCRzcXoxzO6WdMgOaPgwn8O1BCVH/LE4yIiTBLCwAlDWmOgF
brBadkmNOo9y76WyNpRA/VQ3VCp7oftKbNiRuYcCgYApwgTpp7T5KGIZiJuAj8HY
ZJLB8IVWTmcyPGaXP824LRq34VgX9dYjEbwMxxc7dVAKU2JflpvPV5IQwVjmPNTQ
Qlr8Pb39ChYuuVymV6d1uOXSl3Pt+HNWgf5Ec/pAgj/5JS2hQPL0+2ZPKjuXZ4GF
EggNT8XnjYGOLpkQFimtwQKBgHOBcT8s74ewDAywseCTfANn4NFhfH28Fwv+MxCA
wkh4byLySH7cVLLWbrNQU/NIhUsxY2mHaTKz8b+4jxy4MldDBM2DERXQ1RqRZysO
43ysvSHLxNHq/0E/ODIptZKbaTq/o0Rlkmctof5FHQ0dXj/rA8sSEqN1bAllIsou
JI4PAoGBAJZwkW/GsjNtoFVCdM9mRO62sCzlIQ6eD9LoKkkxrjEsiRDm5BuRpvFN
UbY86uSiA9sfjz+vGdl9eY3CD8015dwJYMxfESS2Lk8B0SWBKKtEidRaU4mmBZLm
R8eK652MXH1032j60S3Bn6E+kTQphAoywqmKD22Yd/eQN0PpsxLu
-----END RSA PRIVATE KEY-----
EOF
chmod go-rwx .id_rsa
GIT_SSH_COMMAND="ssh -i .id_rsa -oStrictHostKeyChecking=no" git clone git@github.com:catatsuy/isucon6-final.git
rm .id_rsa
(
  cd isucon6-final/ansible
  PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook -i development -c local playbook/setup.yml
)
rm -rf isucon6-final
reboot
