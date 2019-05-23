<template>
	<div>
		<h4 class="text-info"> Authors</h4>

		<form @submit.prevent="newAuthor()">
			<div class="form-row">
				<div class="col-4">
					<input type="text" v-model="author.fullName" placeholder="Full name" class="form-control form-control-sm">
				</div>

				<div class="col-4">
					<input type="email" v-model="author.email" class="form-control form-control-sm" placeholder="Email address">
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
		<form @submit.prevent="fetchAllAuthors()">
			<div class="form-row">
				<div class="col-3 offset-6">
					<input type="text" v-model="query.full_name.prefix" placeholder="Search . . ." class="form-control form-control-sm">				
				</div>
				<div class="col-3">
					<button class="btn btn-outline-warning btn-sm">Search</button>
				</div>
			</div>
		</form>
		
		<br>
		<table class="table table-border table-hover table-striped">
			<thead>
				<th>Full name</th>
				<th>Email</th>
				<th>Created at</th>
			</thead>

			<tbody>
				<tr v-if="authors.length == 0">No author available</tr>
				<tr v-for="author in authors" :key="author.id">
					<td>{{ author.fullName }}</td>
					<td>{{ author.email }}</td>
					<td>{{ author.createdAt }}</td>
				</tr>
			</tbody>
		</table>
		<h6>Total count {{ totalAut }}</h6>
	</div>
</template>

<script>
import { Author } from "../model";
import { Scope, WhereClause, SortScope } from "spraypaint"

export default{
	name: 'Author',

	data (){
		return {
			author: {
				fullName: "",
				email: "",
			},
			tri: { created_at: 'desc' },
		    query: {
		        full_name: {}
		      },
		}
	},

	created() {
		this.fetchAllAuthors();
	},

	computed: {
		authors(){
			return this.$store.getters.getAuthor;
		},
		totalAut(){
			return this.$store.getters.getTotalAut;
		},
		scopeAuthor() { 
	      return Author
	      	.where(this.query)
	      	.order(this.tri)	      	
	    }
	},

	methods: {
		fetchAllAuthors() {
			this.$store.dispatch('loadAuthors', this.scopeAuthor);
		},
		newAuthor(){
			this.$store.dispatch('storeAuthor', this.author);
		}
	}
};
	
</script>

<style></style>