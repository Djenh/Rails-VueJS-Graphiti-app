<template>
	<div>
		<h4 class="text-info"> Libraries</h4>

		<form @submit.prevent="newLibrary()">
			<div class="form-row">
				<div class="col-4">
					<input type="text" v-model="library.name" placeholder="Name" class="form-control form-control-sm">
				</div>

				<div class="col-4">
					<input type="text" v-model="library.address" class="form-control form-control-sm" placeholder="Address">
				</div>

				<div class="col-2">
					<button type="submit" class="btn btn-outline-success btn-sm btn-block">+</button>
				</div>

				<div class="col-2">
					<button type="reset" class="btn btn-outline-danger btn-sm btn-block">-</button>
				</div>
			</div>
		</form>
		<hr>
		<form @submit.prevent="getAllLibraries()">
		<div class="form-row">			
			<div class="col-3 offset-6">
				<input type="search" v-model="queryLib.name.prefix" placeholder="Search . . ." class="form-control form-control-sm">				
			</div>
			<div class="col-3">
				<button class="btn btn-outline-warning btn-sm" type="submit">Search</button>
			</div>			
		</div>
		</form>
		<br>
		<table class="table table-border table-hover table-striped">
			<thead>
				<th>Name</th>
				<th>Address</th>
				<th>Created at</th>
			</thead>

			<tbody>
				<tr v-if="libraries.length == 0">No library available</tr>
				<tr v-for="lib in libraries" :key="lib.id">
					<td>{{ lib.name }}</td>
					<td>{{ lib.address }}</td>
					<td>{{ lib.createdAt }}</td>
				</tr>
			</tbody>
		</table>
		<h6>Total count {{ totalLib }}</h6>
		<br>
		<br>
	</div>
</template>

<script>
import { Library } from "../model";
import { Scope, WhereClause, SortScope } from "spraypaint"

export default{	
	name: 'Library',

	data () {
		return {
			library: {
				name: "",
				address: ""
			},
			tri: { created_at: 'desc' },
			queryLib: { name: {}  }
		}
	},

	created() {
		this.getAllLibraries();
	},

	computed: {
		libraries (){
			return this.$store.getters.getLib
		},
		totalLib () {
	    	return this.$store.getters.getTotalLib
	    },
	    scopeLibrary() { 
	      return Library
	      	.where(this.queryLib)
	      	.order(this.tri)	      	
	    }
	},

	methods: {
		getAllLibraries(){
			this.$store.dispatch("loadLibraries", this.scopeLibrary);
		},

		newLibrary(){
			this.$store.dispatch("storeLibrary", this.library);
		}
	}
};
	
</script>

<style></style>