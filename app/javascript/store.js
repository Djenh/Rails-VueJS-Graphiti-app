import Vue from "vue";
import Vuex from "vuex";

import { Library, University, Author, Book } from "./model";
import { Scope, WhereClause, SortScope } from "spraypaint"

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    libraries: [],
    universities: [],
    authors: [],    
    totalLib: 0,
    totalUni: 0,
    totalAut: 0, 
  },

  getters: {
    getLib: state => {
      return state.libraries;
    },
    getTotalLib: state => {
        return state.totalLib;
    },
    getUniv: state => { return state.universities; },
    getTotalUniv: state => { return state.totalUni; },

    getAuthor: state => { return state.authors; },
    getTotalAut: state => { return state.totalAut; },
  },

  mutations: {
  	setLibraries(state, list){
      state.libraries = list;
    },
    addOneLibrary(state, lib){
        state.libraries.unshift(lib);
        state.totalLib = state.totalLib + 1;
    },
    setTotalLib(state, count){
      state.totalLib = count;
    },

    setUni(state, list){ state.universities = list; },
    addOneUniversity(state, uni){ state.universities.unshift(uni); state.totalUni = state.totalUni + 1; },
    setTotalUni(state, count){ state.totalUni = count; },

    setAut(state, list){ state.authors = list; },
    addOneAuthor(state, aut){ state.authors.unshift(aut); state.totalAut = state.totalAut + 1; },
    setTotalAut(state, count){ state.totalAut = count; },
  },

  actions: {
    //--------------------- Library -----------------
    loadLibraries({ commit }, payload) {
        payload
            .stats({ total: "count" })
            .all()
            .then(response => {
                commit("setLibraries", response.data);
                commit("setTotalLib", response.meta.stats.total.count);
            })
            .catch(err => console.log("Library error ", err));
    },
    storeLibrary({ commit }, payload) {
        let lib = new Library(payload);
        lib.save()
            .then(success => {
                if(success){
                    commit("addOneLibrary", payload);
                }else{
                    console.log("Error while adding new library ", success) 
                }                
        });         
    },

    //---------------------- University----------------------
    loadUniversities({ commit }, payload) {
        payload
            .stats({ total: "count" })
            .all()
            .then(response => {
                commit("setUni", response.data);
                commit("setTotalUni", response.meta.stats.total.count);
            })
            .catch(err => console.log("University error ", err));
    },

    storeUniversity({ commit }, payload) {
        let uni = new University(payload);
        uni.save()
            .then(success => {
                if(success){
                    commit("addOneUniversity", payload);
                }else{
                    console.log("Error while adding new university ", success) 
                }                
        });         
    },

    //---------------------- Author ----------------------
    loadAuthors({ commit }, payload) {
        payload
            .stats({ total: "count" })
            .all()
            .then(response => {
                commit("setAut", response.data);
                commit("setTotalAut", response.meta.stats.total.count);
            })
            .catch(err => console.log("Author error ", err));
    },

    storeAuthor({ commit }, payload) {
        let aut = new Author(payload);
        aut.save()
            .then(success => {
                if(success){
                    commit("addOneAuthor", payload);
                }else{
                    console.log("Error while adding new author ", aut.errors) 
                }                
        });         
    },   
  	
  }
});


