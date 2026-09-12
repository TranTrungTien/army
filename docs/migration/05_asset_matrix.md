# 05 Asset Matrix

## Evidence

Asset references were extracted from string literals in the embedded Java source bodies. The full machine-readable evidence is in `05_asset_matrix.csv`.

- Total references/templates: **270**
- Images: **227**
- Tiles: **3**
- Maps: **33**
- Fonts: **1**
- Audio: **6**

## Legacy naming rules confirmed

- `mImage.replaceImg` maps `.img` to `.png`.
- Root resource prefix is `res`; zoom-dependent resources use `/x<zoom>/...` in several loaders.
- Tile sets follow `/Tile/tile<ID>/tile<ID>_<NN>.png` and miniature tiles follow `/Tile/tile_small<ID>/tile_small<ID>_<NN>.png`.
- `ManagerTile.totalTile` defines counts for 15 tile-set IDs.
- Assets may be local, bundled, dynamically downloaded, or reconstructed from server/file-pack payloads.

## Target layout

```text
assets/manifests/
assets/sprites/
assets/maps/
assets/audio/
assets/fonts/
```

## Status

All discovered references have a record. Binary content is not present in the supplied Markdown, so rows remain `BLOCKED_ASSET_MISSING`. No synthetic replacement is treated as a real migrated asset.
