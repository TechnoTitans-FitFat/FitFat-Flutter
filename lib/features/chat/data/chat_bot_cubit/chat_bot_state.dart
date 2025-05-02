import 'package:equatable/equatable.dart';
import 'package:fitfat/features/chat/data/models/chat_bot_model.dart';
import 'package:flutter/widgets.dart';

@immutable abstract class ChatBotState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatBotInitial extends ChatBotState {}

class ChatBotLoading extends ChatBotState {
  final List<ChatMessageModel> messageHistory;

  ChatBotLoading({required this.messageHistory});

  @override
  List<Object> get props => [messageHistory];
}

class ChatBotSuccess extends ChatBotState {
  final ChatBotModel meal;
  final List<ChatMessageModel> messageHistory;
  
  ChatBotSuccess({required this.meal, required this.messageHistory});
  
  @override
  List<Object> get props => [meal, messageHistory];
}

class ChatBotNoMealFound extends ChatBotState {
  final List<ChatMessageModel> messageHistory;
  
  ChatBotNoMealFound({required this.messageHistory});
  
  @override
  List<Object> get props => [messageHistory];
}

class ChatBotFailure extends ChatBotState {
  final String errMessage;
  final List<ChatMessageModel> messageHistory;
  
  ChatBotFailure({required this.errMessage, required this.messageHistory});
  
  @override
  List<Object> get props => [errMessage, messageHistory];
}