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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _41 = in.m_31.x;
    float _43 = in.m_31.y;
    float _45 = _41 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float2 _465 = float2(_41, _43);
    float2 _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_465, float2(0.0), isnan(_465))).xy;
    float _51 = _49.x;
    float _53 = _49.y;
    float2 _480 = float2(_41, _43);
    float2 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_480, float2(0.0), isnan(_480))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_480, float2(0.0), isnan(_480))).xy;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _63 = _41 + _61;
    float2 _498 = float2(_45, _43);
    float2 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_498, float2(0.0), isnan(_498))).xy;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _43 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _75 = _43 + _73;
    float2 _521 = float2(_63, _43);
    float2 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_521, float2(0.0), isnan(_521))).xy;
    float _79 = _77.x;
    float _81 = _77.y;
    float2 _533 = float2(_41, _71);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_533, float2(0.0), isnan(_533))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_533, float2(0.0), isnan(_533))).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float2 _545 = float2(_41, _75);
    float2 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_545, float2(0.0), isnan(_545))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_545, float2(0.0), isnan(_545))).xy;
    float _91 = _89.x;
    float _93 = _89.y;
    float2 _557 = float2(_45, _71);
    float2 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_557, float2(0.0), isnan(_557))).xy;
    float _97 = _95.x;
    float _99 = _95.y;
    float2 _569 = float2(_63, _71);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_569, float2(0.0), isnan(_569))).xy;
    float _103 = _101.x;
    float _105 = _101.y;
    float2 _581 = float2(_45, _75);
    float2 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_581, float2(0.0), isnan(_581))).xy;
    float _109 = _107.x;
    float _111 = _107.y;
    float2 _593 = float2(_63, _75);
    float2 _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_593, float2(0.0), isnan(_593))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_593, float2(0.0), isnan(_593))).xy;
    float _115 = _113.x;
    float _117 = _113.y;
    float _119 = _53 + (-0.5);
    float _121 = _59 + (-0.5);
    float _123 = _57 + (-0.5);
    float _125 = _51 + (-0.5);
    float _127 = _121 * _121;
    float _129 = _119 * _121;
    float _131 = _69 + (-0.5);
    float _133 = _67 + (-0.5);
    float _135 = fma(_123, _123, _127);
    float _137 = fma(_125, _123, _129);
    float _139 = _131 * _131;
    float _141 = _119 * _131;
    float _143 = _81 + (-0.5);
    float _145 = _79 + (-0.5);
    float _147 = fma(_133, _133, _139);
    float _149 = _135 + 1.0;
    float _151 = _143 * _143;
    float _153 = fma(_125, _133, _141);
    float _155 = _147 + 1.0;
    float _157 = rsqrt(_149);
    float _159 = fma(_145, _145, _151);
    float _161 = _137 + 1.0;
    float _163 = _153 + 1.0;
    float _165 = _159 + 1.0;
    float _167 = rsqrt(_155);
    float _169 = _119 * _143;
    float _171 = fma(_125, _145, _169);
    float _173 = rsqrt(_165);
    float _175 = _157 * _161;
    float _177 = _171 + 1.0;
    float _179 = _167 * _163;
    float _181 = _87 + (-0.5);
    float _183 = _85 + (-0.5);
    float _185 = _181 * _181;
    bool _189 = _179 > _175;
    float _191 = _173 * _177;
    float _193 = -_175;
    float _195 = -_179;
    float _197 = precise::min(_193, _195);
    float _199 = fma(_183, _183, _185);
    float _201 = -_191;
    bool _203 = _197 > _201;
    float _205 = _199 + 1.0;
    float _207 = -_191;
    float _209 = precise::min(_197, _207);
    float _211 = _119 * _181;
    float _213 = _93 + (-0.5);
    float _215 = _91 + (-0.5);
    float _217 = _99 + (-0.5);
    float _219 = rsqrt(_205);
    float _221 = _213 * _213;
    float _223 = fma(_125, _183, _211);
    float _225 = _97 + (-0.5);
    float _227 = _217 * _217;
    float _229 = fma(_215, _215, _221);
    float _231 = _119 * _213;
    float _233 = _223 + 1.0;
    float _235 = fma(_225, _225, _227);
    float _237 = _229 + 1.0;
    float _239 = fma(_125, _215, _231);
    float _241 = _235 + 1.0;
    float _243 = rsqrt(_237);
    float _245 = _219 * _233;
    float _247 = _105 + (-0.5);
    float _249 = _239 + 1.0;
    float _251 = _103 + (-0.5);
    float _253 = -_245;
    bool _255 = _209 > _253;
    float _257 = _247 * _247;
    float _259 = rsqrt(_241);
    float _261 = -_245;
    float _263 = precise::min(_209, _261);
    float _265 = _119 * _217;
    float _267 = fma(_251, _251, _257);
    float _269 = fma(_125, _225, _265);
    float _271 = _117 + (-0.5);
    float _273 = _243 * _249;
    float _275 = _111 + (-0.5);
    float _277 = _109 + (-0.5);
    float _279 = _269 + 1.0;
    float _281 = _267 + 1.0;
    float _283 = _275 * _275;
    float _285 = _119 * _247;
    float _287 = _119 * _275;
    float _289 = _259 * _279;
    float _291 = fma(_277, _277, _283);
    float _293 = _115 + (-0.5);
    float _295 = _271 * _271;
    float _297 = rsqrt(_281);
    float _299 = _291 + 1.0;
    float _301 = fma(_125, _251, _285);
    float _303 = fma(_293, _293, _295);
    float _305 = -_273;
    bool _307 = _263 > _305;
    float _309 = fma(_125, _277, _287);
    float _311 = -_273;
    float _313 = precise::min(_263, _311);
    float _315 = _303 + 1.0;
    float _317 = rsqrt(_299);
    bool _319 = !_189;
    int _322 = _319 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _324 = _301 + 1.0;
    float _326 = _119 * _271;
    float _328 = -_289;
    bool _330 = _313 > _328;
    float _332 = _309 + 1.0;
    bool _334 = !_203;
    float _336 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _338 = _334 ? _322 : as_type<int>(_336);
    float _340 = fma(_125, _293, _326);
    float _342 = rsqrt(_315);
    float _344 = _297 * _324;
    bool _346 = !_255;
    int _348 = _346 ? _338 : 0;
    float _350 = _340 + 1.0;
    float _352 = -_289;
    float _354 = precise::min(_313, _352);
    bool _356 = !_307;
    int _358 = _356 ? _348 : int(0x80000000);
    float _360 = _317 * _332;
    bool _362 = !_255;
    int _364 = _362 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _366 = -_344;
    bool _368 = _354 > _366;
    bool _370 = _368 || _330;
    float _372 = -_344;
    bool _374 = _354 > _372;
    float _376 = -_344;
    float _378 = precise::min(_354, _376);
    float _380 = _342 * _350;
    bool _382 = !_330;
    int _384 = _382 ? _358 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _386 = !_307;
    float _388 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    int _390 = _386 ? _364 : as_type<int>(_388);
    float _392 = -_360;
    bool _394 = _378 > _392;
    float _396 = -_360;
    float _398 = precise::min(_378, _396);
    bool _400 = !_374;
    float _402 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _404 = _400 ? _384 : as_type<int>(_402);
    bool _406 = !_370;
    int _408 = _406 ? _390 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _410 = -_380;
    bool _412 = _398 > _410;
    bool _414 = !_394;
    int _416 = _414 ? _404 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _418 = !_394;
    float _420 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    int _422 = _418 ? _408 : as_type<int>(_420);
    bool _424 = !_412;
    float _426 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _428 = _424 ? as_type<float>(_416) : _426;
    bool _430 = !_412;
    float _432 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _434 = _430 ? as_type<float>(_422) : _432;
    float _436 = _41 + _428;
    float _438 = _43 + _434;
    float2 _1053 = float2(_436, _438);
    float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1053, float2(0.0), isnan(_1053))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1053, float2(0.0), isnan(_1053))).xyz;
    float _444 = _442.x;
    float _446 = _442.y;
    float _448 = _442.z;
    out.m_34.x = _444;
    out.m_34.y = _446;
    out.m_34.z = _448;
    return out;
}

