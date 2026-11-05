#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_E [[id(1)]];
    sampler fp_t_tcb_ESmplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _45 = in.m_33.x;
    float _47 = in.m_33.y;
    float _49 = _45 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float2 _477 = float2(_45, _47);
    float2 _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_477, float2(0.0), isnan(_477))).xy;
    float _55 = _53.x;
    float _57 = _53.y;
    float2 _492 = float2(_45, _47);
    float2 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_492, float2(0.0), isnan(_492))).xy;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _67 = _45 + _65;
    float2 _510 = float2(_49, _47);
    float2 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_510, float2(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_510, float2(0.0), isnan(_510))).xy;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _47 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _79 = _47 + _77;
    float2 _533 = float2(_67, _47);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_533, float2(0.0), isnan(_533))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_533, float2(0.0), isnan(_533))).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float2 _545 = float2(_45, _75);
    float2 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_545, float2(0.0), isnan(_545))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_545, float2(0.0), isnan(_545))).xy;
    float _89 = _87.x;
    float _91 = _87.y;
    float2 _557 = float2(_45, _79);
    float2 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_557, float2(0.0), isnan(_557))).xy;
    float _95 = _93.x;
    float _97 = _93.y;
    float2 _569 = float2(_49, _75);
    float2 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_569, float2(0.0), isnan(_569))).xy;
    float _101 = _99.x;
    float _103 = _99.y;
    float2 _581 = float2(_67, _75);
    float2 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_581, float2(0.0), isnan(_581))).xy;
    float _107 = _105.x;
    float _109 = _105.y;
    float2 _593 = float2(_49, _79);
    float2 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_593, float2(0.0), isnan(_593))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_593, float2(0.0), isnan(_593))).xy;
    float _113 = _111.x;
    float _115 = _111.y;
    float2 _605 = float2(_67, _79);
    float2 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_605, float2(0.0), isnan(_605))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_605, float2(0.0), isnan(_605))).xy;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _57 + (-0.5);
    float _125 = _63 + (-0.5);
    float _127 = _61 + (-0.5);
    float _129 = _55 + (-0.5);
    float _131 = _125 * _125;
    float _133 = _123 * _125;
    float _135 = _73 + (-0.5);
    float _137 = _71 + (-0.5);
    float _139 = fma(_127, _127, _131);
    float _141 = fma(_129, _127, _133);
    float _143 = _135 * _135;
    float _145 = _123 * _135;
    float _147 = _85 + (-0.5);
    float _149 = _83 + (-0.5);
    float _151 = fma(_137, _137, _143);
    float _153 = _139 + 1.0;
    float _155 = _147 * _147;
    float _157 = fma(_129, _137, _145);
    float _159 = _151 + 1.0;
    float _161 = rsqrt(_153);
    float _163 = fma(_149, _149, _155);
    float _165 = _141 + 1.0;
    float _167 = _157 + 1.0;
    float _169 = _163 + 1.0;
    float _171 = rsqrt(_159);
    float _173 = _123 * _147;
    float _175 = fma(_129, _149, _173);
    float _177 = rsqrt(_169);
    float _179 = _161 * _165;
    float _181 = _175 + 1.0;
    float _183 = _171 * _167;
    float _185 = _91 + (-0.5);
    float _187 = _89 + (-0.5);
    float _189 = _185 * _185;
    bool _193 = _183 > _179;
    float _195 = _177 * _181;
    float _197 = -_179;
    float _199 = -_183;
    float _201 = precise::min(_197, _199);
    float _203 = fma(_187, _187, _189);
    float _205 = -_195;
    bool _207 = _201 > _205;
    float _209 = _203 + 1.0;
    float _211 = -_195;
    float _213 = precise::min(_201, _211);
    float _215 = _123 * _185;
    float _217 = _97 + (-0.5);
    float _219 = _95 + (-0.5);
    float _221 = _103 + (-0.5);
    float _223 = rsqrt(_209);
    float _225 = _217 * _217;
    float _227 = fma(_129, _187, _215);
    float _229 = _101 + (-0.5);
    float _231 = _221 * _221;
    float _233 = fma(_219, _219, _225);
    float _235 = _123 * _217;
    float _237 = _227 + 1.0;
    float _239 = fma(_229, _229, _231);
    float _241 = _233 + 1.0;
    float _243 = fma(_129, _219, _235);
    float _245 = _239 + 1.0;
    float _247 = rsqrt(_241);
    float _249 = _223 * _237;
    float _251 = _109 + (-0.5);
    float _253 = _243 + 1.0;
    float _255 = _107 + (-0.5);
    float _257 = -_249;
    bool _259 = _213 > _257;
    float _261 = _251 * _251;
    float _263 = rsqrt(_245);
    float _265 = -_249;
    float _267 = precise::min(_213, _265);
    float _269 = _123 * _221;
    float _271 = fma(_255, _255, _261);
    float _273 = fma(_129, _229, _269);
    float _275 = _121 + (-0.5);
    float _277 = _247 * _253;
    float _279 = _115 + (-0.5);
    float _281 = _113 + (-0.5);
    float _283 = _273 + 1.0;
    float _285 = _271 + 1.0;
    float _287 = _279 * _279;
    float _289 = _123 * _251;
    float _291 = _123 * _279;
    float _293 = _263 * _283;
    float _295 = fma(_281, _281, _287);
    float _297 = _119 + (-0.5);
    float _299 = _275 * _275;
    float _301 = rsqrt(_285);
    float _303 = _295 + 1.0;
    float _305 = fma(_129, _255, _289);
    float _307 = fma(_297, _297, _299);
    float _309 = -_277;
    bool _311 = _267 > _309;
    float _313 = fma(_129, _281, _291);
    float _315 = -_277;
    float _317 = precise::min(_267, _315);
    float _319 = _307 + 1.0;
    float _321 = rsqrt(_303);
    bool _323 = !_193;
    int _326 = _323 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _328 = _305 + 1.0;
    float _330 = _123 * _275;
    float _332 = -_293;
    bool _334 = _317 > _332;
    float _336 = _313 + 1.0;
    bool _338 = !_207;
    float _340 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _342 = _338 ? _326 : as_type<int>(_340);
    float _344 = fma(_129, _297, _330);
    float _346 = rsqrt(_319);
    float _348 = _301 * _328;
    bool _350 = !_259;
    int _352 = _350 ? _342 : 0;
    float _354 = _344 + 1.0;
    float _356 = -_293;
    float _358 = precise::min(_317, _356);
    bool _360 = !_259;
    int _362 = _360 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _364 = !_311;
    int _366 = _364 ? _352 : int(0x80000000);
    float _368 = _321 * _336;
    float _370 = -_348;
    bool _372 = _358 > _370;
    bool _374 = _372 || _334;
    float _376 = -_348;
    bool _378 = _358 > _376;
    float _380 = -_348;
    float _382 = precise::min(_358, _380);
    bool _384 = !_334;
    int _386 = _384 ? _366 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _388 = _346 * _354;
    bool _390 = !_311;
    float _392 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    int _394 = _390 ? _362 : as_type<int>(_392);
    float _396 = -_368;
    bool _398 = _382 > _396;
    float _400 = -_368;
    float _402 = precise::min(_382, _400);
    bool _404 = !_378;
    float _406 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _408 = _404 ? _386 : as_type<int>(_406);
    bool _410 = !_374;
    int _412 = _410 ? _394 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _414 = -_388;
    bool _416 = _402 > _414;
    bool _418 = !_398;
    int _420 = _418 ? _408 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _422 = !_398;
    float _424 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    int _426 = _422 ? _412 : as_type<int>(_424);
    bool _428 = !_416;
    float _430 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _432 = _428 ? as_type<float>(_420) : _430;
    bool _434 = !_416;
    float _436 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _438 = _434 ? as_type<float>(_426) : _436;
    float _440 = _45 + _432;
    float _442 = _47 + _438;
    float2 _1065 = float2(_440, _442);
    float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1065, float2(0.0), isnan(_1065))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1065, float2(0.0), isnan(_1065))).xyz;
    float _448 = _446.x;
    float _450 = _446.y;
    float _452 = _446.z;
    float2 _1079 = float2(_440, _442);
    float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1079, float2(0.0), isnan(_1079))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1079, float2(0.0), isnan(_1079))).xyz;
    float _456 = _454.x;
    float _458 = _454.y;
    float _460 = _454.z;
    out.m_36.x = _448;
    out.m_36.y = _450;
    out.m_36.z = _452;
    out.m_38.x = _456;
    out.m_38.y = _458;
    out.m_38.z = _460;
    return out;
}

