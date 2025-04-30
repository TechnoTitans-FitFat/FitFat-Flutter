import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/features/chat/data/chat_bot_cubit/chat_bot_state.dart';
import 'package:fitfat/features/chat/data/models/chat_bot_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  final ApiConsumer apiConsumer;
  final List<ChatMessageModel> _messageHistory = [];
  
  List<ChatMessageModel> get messageHistory => _messageHistory;

  ChatBotCubit(this.apiConsumer) : super(ChatBotInitial());
  
  Future<void> sendMessage({required String userId, required String message}) async {
    emit(ChatBotLoading(messageHistory: List.from(_messageHistory)));
    
    try {
      _messageHistory.add(ChatMessageModel(
        message: message,
        isUser: true,
      ));
      
      final response = await apiConsumer.post(
        EndPoint.chatBot,
        data: {
          ApiKey.userId: userId,
          'query': message,
        },
      );
      print(' Response from /recommend: $response');
      final mealId = response['recommended_meal_id'];
      
      if (mealId != null) {
        final mealDetailsResponse = await apiConsumer.get('${EndPoint.meal_details}$mealId');
        final meal = ChatBotModel.fromJson(mealDetailsResponse);
        
        _messageHistory.add(ChatMessageModel(
          meal: meal,
          isUser: false,
        ));
        
        emit(ChatBotSuccess(meal: meal, messageHistory: _messageHistory));
      } else {
        
        _messageHistory.add(ChatMessageModel(
          message: "there is no meal suitable for you",
          isUser: false,
        ));
        
        emit(ChatBotNoMealFound(messageHistory: _messageHistory));
      }
    } catch (e) {
      
      _messageHistory.add(ChatMessageModel(
        message: "there is an error",
        isUser: false,
      ));
      
      emit(ChatBotFailure(errMessage: e.toString(), messageHistory: _messageHistory));
    }
  }
  
 /* void clearChatHistory() {
    _messageHistory.clear();
    emit(ChatBotInitial());
  }
  */
}