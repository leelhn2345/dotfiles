#######################################
# installs golang-go
#######################################
golang_install() {
  GO_VERSION=1.26.2

  curl -OL https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz

  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz

  rm go${GO_VERSION}.linux-amd64.tar.gz
}

golang_tools() {
  go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
}
