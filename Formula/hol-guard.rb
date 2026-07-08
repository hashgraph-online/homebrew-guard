class HolGuard < Formula
  include Language::Python::Virtualenv

  desc "Local-first security harness for AI coding agents (Codex, Claude, Cursor, Gemini, Hermes, more)"
  homepage "https://hol.org/guard"
  url "https://files.pythonhosted.org/packages/89/f3/b946d9ed85e8714efe5d35319179debd923d322e17812ad270b51ca712b2/hol_guard-2.0.1004.tar.gz"
  sha256 "7fbf72846748701c48ecabb117e9a07b7204ea7e5392c83e3104308e2164bf35"
  license "Apache-2.0"
  head "https://github.com/hashgraph-online/hol-guard.git", branch: "main"

  livecheck do
    url "https://pypi.org/pypi/hol-guard/json"
    strategy :json do |json|
      json["info"]["version"]
    end
  end

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, all: "0d06d509ec34f56a67a55602b9d4cf9ce011df09e78a8b0e75a1e735a686e8e8"
  end

  depends_on "python@3.13"

  resource "cisco-ai-skill-scanner" do
    url "https://files.pythonhosted.org/packages/dd/f8/d5d92a1a77f0d381243783f89b3435541c125c0e9cfc3327a9592b9d6611/cisco_ai_skill_scanner-2.0.12.tar.gz"
    sha256 "ebc98db3de689f820d1db365a2d783cfbacd9ed226723a399970bedd250c3672"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/1f/99/d1c90d6041656cc6ee229dc99cd67fd0cd5aec3c5f7d72fffc27cc750054/cryptography-49.0.0.tar.gz"
    sha256 "f89660a348f4f78a92366240a61404e337586ef7f5909a2fef59ca88ef505493"
  end

  resource "keyring" do
    url "https://files.pythonhosted.org/packages/43/4b/674af6ef2f97d56f0ab5153bf0bfa28ccb6c3ed4d1babf4305449668807b/keyring-25.7.0.tar.gz"
    sha256 "fe01bd85eb3f8fb3dd0405defdeac9a5b4f6f0439edbb3149577f244a2e8245b"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/d7/f1/e7a6dd94a8d4a5626c03e4e99c87f241ba9e350cd9e6d75123f992427270/packaging-26.2.tar.gz"
    sha256 "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf/requests-2.34.2.tar.gz"
    sha256 "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  def install
    virtualenv_create(libexec, "python3.13")
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hol-guard --version")
  end
end
