import axios from "axios";
import qs from 'qs';

export default axios.create({

  withCredentials: true,
  baseURL: process.env.VUE_APP_DOMAIN + process.env.VUE_APP_CUSTOMER+process.env.VUE_APP_BACKEND_SUFFIX,
  paramsSerializer(params) {
    let retVal = ''
    let rangesStrings = []
    removeEmpty(params)
    if(params.hasOwnProperty('filters')){
      let ranges = params.ranges
      delete params.ranges
      for(var propertyName in ranges) {
        if(propertyName.endsWith("Start")) {
          rangesStrings.push(`ranges[${propertyName.slice(0, -5)}|smallEquals]=${ranges[propertyName]}`)
        }
        if(propertyName.endsWith("End")) {
          rangesStrings.push(`ranges[${propertyName.slice(0, -3)}|bigEquals]=${ranges[propertyName]}`)
        }
     }
    }
    retVal = qs.stringify(params, {arrayFormat: 'repeat'})
    rangesStrings.forEach((value)=>{
      let prefix = retVal.length ? '&' : '?'
      retVal += prefix + encodeURI(value)
    })
    return retVal
  }
})
// https://stackoverflow.com/a/38340730 - Remove blank attributes from an Object in Javascript
const removeEmpty = obj => {
  Object.keys(obj).forEach(key => {
    if (obj[key] && typeof obj[key] === "object") removeEmpty(obj[key]); // recurse
    else if (obj[key] == null || obj[key] == '') delete obj[key]; // delete
  });
};



