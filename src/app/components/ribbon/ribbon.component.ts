import { Component, Input, OnInit } from '@angular/core';
import { RibbonLocation } from 'src/app/common/enum/ribbon-location.enum';
import { RibbonType } from 'src/app/common/enum/ribbon-type.enum';

@Component({
  selector: 'app-ribbon',
  templateUrl: './ribbon.component.html',
  styleUrls: ['./ribbon.component.css']
})
export class RibbonComponent implements OnInit {
  @Input() public content = "";
  @Input() public location: RibbonLocation = RibbonLocation.TopLeft;
  @Input() public type: RibbonType = RibbonType.Success;

  constructor() { }

  ngOnInit(): void {
    
  }

}
