<template>
<div>
	<h4 class="text-info"> Books</h4>
	
	<div class="card shadow">
		<div class="card-body">
			<form @submit.prevent="newBook()">
				<div class="form-row">
					<div class="col-5">
						<input type="text" v-model="book.title" placeholder="Title" class="form-control form-control-sm">
					</div>

					<div class="col-5">
						<input type="text" v-model="book.isbn" class="form-control form-control-sm" placeholder="ISBN">
					</div>				

					<div class="col-2">
						<button type="reset" class="btn btn-outline-danger btn-sm btn-block">-</button>
					</div>
				</div>
				<br>
				<div class="form-row">
					<div class="col-5">
						<select v-model="book.author_id" class="custom-select custom-select-sm">
							<option selected>Choose an author</option>	
							<option v-for="aut in authors" :key="aut.id" :value="aut.id">{{ aut.fullName }}</option>					
						</select>
					</div>

					<div class="col-5">
						<select v-model="book.owner" class="custom-select custom-select-sm" name="" id="">
							<option selected>Choose an owner</option>
							<option v-for="owner in owners" :key="owner.id" :value="owner">{{ owner.name }}</option>
						</select>
					</div>

					<div class="col-2">
						<button type="submit" class="btn btn-outline-success btn-sm btn-block">+</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<br>

	<table class="table table-border table-hover table-striped">
		<thead>
			<th>Title</th>
			<th>ISBN</th>
			<th>Author</th>
			<th>Owner type</th>
			<th>Owner</th>
			<th>Created at</th>
		</thead>

		<tbody>
			<tr>
				
			</tr>
		</tbody>
	</table>
	<h6>Total count </h6>
</div>
</template>

<script>
import { Book, Author, Library, University } from "../model";
import { Scope, WhereClause, SortScope } from "spraypaint"

export default{
	name: 'Book',

	data (){
		return {
			book: {
				title: "",
				isbn: "",
				author_id: 0,
				owner: {}
			},
			tri: { created_at: 'desc'},						
		}
	},

	created(){
		this.$store.dispatch('loadLibraries', this.listLib);
		this.$store.dispatch('loadUniversities', this.listUniv);
		// this.fetchAllBooks();
	},

	computed: {
		listLib(){
			return Library;
		},
		listUniv(){
			return University;
		},
		authors(){
			return this.$store.getters.getAuthor;
		},
		owners(){
			let libs = this.$store.getters.getLib;
			let univ = this.$store.getters.getUniv;
			let tab = libs;
			// let tab = libs.concat(univ);
			// console.log("Owners ", tab);
			return tab; 
		},
		scopeBook(){
			return Book.order(this.tri).includes(["author", "owner"])
		}
	},

	methods: {
		fetchAllBooks(){
			this.$store.dispatch("loadBooks", this.scopeBook)
		},

		newBook(){
			this.$store.dispatch("storeBook", this.book)
		}
	}
};
	
</script>

<style></style>