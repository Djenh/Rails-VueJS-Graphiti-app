<template>
	<div>
		<h4 class="text-info"> Universities</h4>

		<form @submit.prevent="newUniversity()">
			<div class="form-row">
				<div class="col-4">
					<input type="text" v-model="university.name" placeholder="Name" class="form-control form-control-sm">
				</div>

				<div class="col-4">
					<input type="text" v-model="university.address" class="form-control form-control-sm" placeholder="Address">
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
		<form @submit.prevent="getAllUniversities()">
			<div class="row">
				<div class="col-md-3 offset-6 ">
					<input type="text" v-model="queryUni.name.prefix" placeholder="Search . . ." class="form-control form-control-sm">				
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
				<tr v-if="universities.length == 0">No university available</tr>
				<tr v-for="uni in universities" :key="uni.id">
					<td>{{ uni.name }}</td>
					<td>{{ uni.address }}</td>
					<td>{{ uni.createdAt }}</td>
				</tr>
			</tbody>
		</table>
		<h6>Total count {{ totalUni }}</h6>
	</div>
</template>

<script>
import { University } from "../model";
import { Scope, WhereClause, SortScope } from "spraypaint"

export default{
	name: 'University',

	data (){
		return {
			university: {
				name: "",
				address: ""
			},
			tri: { created_at: 'desc' },
			queryUni: { name: {}  }
		}
	},

	created() {
		this.getAllUniversities();
	},

	computed: {
		universities(){
			return this.$store.getters.getUniv;
		},
		totalUni(){
			return this.$store.getters.getTotalUniv;
		},
		scopeUniversity() { 
	      return University
	      	.where(this.queryUni)
	      	.order(this.tri)	      	
	    }
	},

	methods: {
		getAllUniversities(){
			this.$store.dispatch('loadUniversities', this.scopeUniversity)
		},

		newUniversity(){
			this.$store.dispatch('storeUniversity', this.university);			
		}
	}
};
	
</script>

<style></style>