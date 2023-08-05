<script setup>
import BaseLayout from "@/layouts/default/BaseLayout";
</script>

<template>
  <BaseLayout>
    <v-container fluid>
      <v-row justify="center">
        <v-form v-model="valid">
          <v-card>
            <v-toolbar flat color="blue-grey" dark>
              <v-toolbar-title>Send a Message</v-toolbar-title>
            </v-toolbar>

            <v-card-text>
              <v-item-group multiple selected-class="bg-blue">
                <div class="text-caption mb-2">Tags</div>
                <v-item
                  v-for="(tag, index) in tags"
                  :key="index"
                  v-slot="{ selectedClass, toggle }"
                >
                  <v-chip :class="selectedClass" @click="toggle">
                    {{ tag }}
                  </v-chip>
                </v-item>
              </v-item-group>

              <v-divider class="my-2"></v-divider>

              <v-text-field
                v-model="email"
                label="Your E-Mail"
                :rules="emailRules"
                required
              >
              </v-text-field>

              <v-text-field variant="filled" label="Subject"></v-text-field>

              <v-textarea
                variant="filled"
                label="Project Description"
                required
              ></v-textarea>
            </v-card-text>

            <v-divider></v-divider>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn> Send </v-btn>
            </v-card-actions>
          </v-card>
        </v-form>
      </v-row>
    </v-container>
  </BaseLayout>
</template>

<script>
export default {
  data() {
    return {
      tags: [
        "NLP",
        "Computer Vision",
        "Chatbot",
        "Information Extraction",
        "Information Retrieval",
        "LangChain",
        "OpenAI",
        "MLOps",
        "Concept",
      ],
      email: "",
      emailRules: [
        (value) => {
          if (value) return true;

          return "E-mail is requred.";
        },
        (value) => {
          if (/.+@.+\..+/.test(value)) return true;

          return "E-mail must be valid.";
        },
      ],
      valid: false,
    };
  },
};
</script>
