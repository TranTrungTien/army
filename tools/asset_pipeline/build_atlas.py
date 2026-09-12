#!/usr/bin/env python3
"""Deterministic legacy PNG atlas packer. Fails on missing/duplicate inputs."""
from pathlib import Path
import argparse,json,hashlib
from PIL import Image

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--input',required=True);ap.add_argument('--output-image',required=True);ap.add_argument('--output-json',required=True);ap.add_argument('--atlas-id',required=True);ap.add_argument('--max-width',type=int,default=2048);a=ap.parse_args()
 files=sorted(Path(a.input).glob('*.png')); 
 if not files: raise SystemExit('No PNG inputs')
 names=[p.stem for p in files]
 if len(names)!=len(set(names)): raise SystemExit('Duplicate frame names')
 images=[(p,Image.open(p).convert('RGBA')) for p in files]
 x=y=row_h=width=0; placed=[]
 for p,img in images:
  if x and x+img.width>a.max_width: y+=row_h;x=0;row_h=0
  placed.append((p,img,x,y));x+=img.width;row_h=max(row_h,img.height);width=max(width,x)
 height=y+row_h;atlas=Image.new('RGBA',(width,height),(0,0,0,0))
 frames=[]
 for p,img,x,y in placed:atlas.paste(img,(x,y),img);frames.append({'name':p.stem,'x':x,'y':y,'width':img.width,'height':img.height,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
 Path(a.output_image).parent.mkdir(parents=True,exist_ok=True);atlas.save(a.output_image,optimize=False)
 Path(a.output_json).write_text(json.dumps({'schemaVersion':1,'id':a.atlas_id,'imagePath':a.output_image,'width':width,'height':height,'frames':frames},indent=2))
if __name__=='__main__':main()
