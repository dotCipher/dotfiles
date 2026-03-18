# Rust/Cargo - add cargo bin to path if it exists
if test -d "$HOME/.cargo/bin"
    fish_add_path "$HOME/.cargo/bin"
end
