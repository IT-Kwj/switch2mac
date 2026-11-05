#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c11 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_12Smplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    sampler fp_t_tcb_14Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_39.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_39.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.75;
    float _73 = _71 * (*spvDescriptorSet0.fp_c11)._m0[40].z;
    float _75 = _73 * 0.5;
    float _77 = 1.0 / _57;
    float _79 = _77 * _63;
    float _81 = _77 * _69;
    float _83 = -_73;
    float _85 = fma(_79, 0.5, _83);
    float _87 = _81 * 0.75;
    float _89 = -_75;
    float _91 = fma(_79, 0.375, _89);
    float2 _485 = float2(_81, _85);
    float2 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_485, float2(0.0), isnan(_485))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_485, float2(0.0), isnan(_485))).xy;
    float _97 = _95.x;
    float _99 = _95.y;
    float2 _500 = float2(_87, _91);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_500, float2(0.0), isnan(_500))).xy;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = in.m_41.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_41.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_43.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_43.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_41.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_43.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_45.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_45.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_45.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _77 * _111;
    float _163 = _77 * _117;
    float _165 = _77 * _123;
    float _167 = _77 * _129;
    float _169 = _161 * _161;
    float _171 = _77 * _135;
    float _173 = _165 * _165;
    float _175 = _77 * _141;
    float _177 = fma(_163, _163, _169);
    float _179 = _77 * _153;
    float _181 = fma(_167, _167, _173);
    float _183 = _77 * _159;
    float _185 = fma(_171, _171, _177);
    float _187 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _189 = _179 + _187;
    float _191 = in.m_43.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = fma(_175, _175, _181);
    float _199 = _77 * _147;
    float _201 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _203 = _183 + _201;
    float _205 = rsqrt(_185);
    float _207 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _209 = _199 + _207;
    float _211 = _209 * _209;
    float _213 = rsqrt(_197);
    float _215 = fma(_189, _189, _211);
    float _217 = fma(_203, _203, _215);
    float _219 = _163 * _205;
    float _221 = _171 * _205;
    float _223 = _161 * _205;
    float _225 = sqrt(_217);
    float _227 = _175 * _213;
    float _229 = _167 * _213;
    float _231 = _165 * _213;
    float _233 = _219 * _227;
    float _235 = _77 * _195;
    float _237 = _221 * _231;
    float _239 = -_233;
    float _241 = fma(_221, _229, _239);
    float _243 = _223 * _229;
    float _245 = -_237;
    float _247 = fma(_223, _227, _245);
    float _249 = _235 * _241;
    float _251 = -_243;
    float _253 = fma(_219, _231, _251);
    float _255 = _235 * _247;
    float _257 = spvFAdd(_225, 9.9999997473787516355514526367188e-06);
    float _259 = _249 * _249;
    float _261 = _235 * _253;
    float _263 = fma(_255, _255, _259);
    float _265 = 1.0 / _257;
    float _267 = fma(_261, _261, _263);
    float _269 = rsqrt(_267);
    float _271 = _209 * _265;
    float _273 = _189 * _265;
    float _275 = _203 * _265;
    float _277 = _229 * _273;
    float _279 = _249 * _269;
    float _281 = _255 * _269;
    float _283 = -_271;
    float _285 = -_277;
    float _287 = fma(_231, _283, _285);
    float _289 = _271 * _279;
    float _291 = _261 * _269;
    float _293 = -_275;
    float _295 = fma(_227, _293, _287);
    float _297 = fma(_273, _281, _289);
    float _299 = _295 * (-0.125);
    float _301 = fma(_275, _291, _297);
    float _303 = fma(_81, 0.787499964237213134765625, _299);
    float _305 = _301 * (-0.125);
    float _307 = fma(_91, 1.0499999523162841796875, _305);
    bool _311 = _97 >= 0.5;
    bool _313 = isnan(_97);
    bool _315 = _311 || _313;
    bool _317 = isnan(0.5);
    bool _319 = _315 || _317;
    bool _321 = _99 >= 0.5;
    bool _323 = isnan(_99);
    bool _325 = _321 || _323;
    bool _327 = isnan(0.5);
    bool _329 = _325 || _327;
    float _331 = _97 * _103;
    float _333 = _331 * 2.0;
    float _335 = -_97;
    float _337 = _335 + 1.0;
    float _339 = -_103;
    float _341 = _339 + 1.0;
    float _343 = -_99;
    float _345 = _343 + 1.0;
    float _347 = -_105;
    float _349 = _347 + 1.0;
    float _351 = _99 * _105;
    float _353 = _351 * 2.0;
    float _355 = _337 * _341;
    float _357 = _345 * _349;
    float _359 = _333;
    float _361 = _353;
    if (_319)
    {
        float _363 = fma(_355, -2.0, 1.0);
        _359 = _363;
    }
    float _365 = _359;
    if (_329)
    {
        float _367 = fma(_357, -2.0, 1.0);
        _361 = _367;
    }
    float _369 = _361;
    float _371 = fma(_365, 2.0, -1.0);
    float _373 = fma(_369, 2.0, -1.0);
    float _375 = _371 * (-0.20000000298023223876953125);
    float _377 = _373 * 0.20000000298023223876953125;
    float _379 = fma(_81, 1.0499999523162841796875, _375);
    float _381 = _303 + _375;
    float _383 = fma(_85, 1.0499999523162841796875, _377);
    float _385 = _307 + _377;
    float2 _898 = float2(_379, _383);
    float _387 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_898, float2(0.0), isnan(_898))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_898, float2(0.0), isnan(_898))).x;
    float2 _906 = float2(_381, _385);
    float _389 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_906, float2(0.0), isnan(_906))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_906, float2(0.0), isnan(_906))).x;
    float _391 = in.m_47.x;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = _77 * _395;
    float _399 = _397 + (-1.0);
    float _401 = _387 + _389;
    float _403 = _401 * 0.5;
    float _405 = sqrt(_403);
    float _407 = _405 + _399;
    float _409 = _397 * _407;
    float _411 = _409 * 4.0;
    float _413 = precise::clamp(_411, 0.0, 1.0);
    bool _415 = _413 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _417 = isnan(_413);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _423 = _419 || _421;
    if (!_423)
    {
        discard_fragment();
    }
    if (!_423)
    {
        out.m_50.x = 0.0;
        out.m_50.y = 0.0;
        out.m_50.z = 0.0;
        out.m_50.w = 0.0;
        return out;
    }
    out.m_50.x = 1.0;
    out.m_50.y = 1.0;
    out.m_50.z = 1.0;
    out.m_50.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_50 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_39.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_39.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.75;
    float _73 = _71 * (*spvDescriptorSet0.fp_c11)._m0[40].z;
    float _75 = _73 * 0.5;
    float _77 = 1.0 / _57;
    float _79 = _77 * _63;
    float _81 = _77 * _69;
    float _83 = -_73;
    float _85 = fma(_79, 0.5, _83);
    float _87 = _81 * 0.75;
    float _89 = -_75;
    float _91 = fma(_79, 0.375, _89);
    float2 _485 = float2(_81, _85);
    float2 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_485, float2(0.0), isnan(_485))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_485, float2(0.0), isnan(_485))).xy;
    float _97 = _95.x;
    float _99 = _95.y;
    float2 _500 = float2(_87, _91);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_500, float2(0.0), isnan(_500))).xy;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = in.m_41.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_41.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_43.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_43.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_41.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_43.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_45.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_45.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_45.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _77 * _111;
    float _163 = _77 * _117;
    float _165 = _77 * _123;
    float _167 = _77 * _129;
    float _169 = _161 * _161;
    float _171 = _77 * _135;
    float _173 = _165 * _165;
    float _175 = _77 * _141;
    float _177 = fma(_163, _163, _169);
    float _179 = _77 * _153;
    float _181 = fma(_167, _167, _173);
    float _183 = _77 * _159;
    float _185 = fma(_171, _171, _177);
    float _187 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _189 = _179 + _187;
    float _191 = in.m_43.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = fma(_175, _175, _181);
    float _199 = _77 * _147;
    float _201 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _203 = _183 + _201;
    float _205 = rsqrt(_185);
    float _207 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _209 = _199 + _207;
    float _211 = _209 * _209;
    float _213 = rsqrt(_197);
    float _215 = fma(_189, _189, _211);
    float _217 = fma(_203, _203, _215);
    float _219 = _163 * _205;
    float _221 = _171 * _205;
    float _223 = _161 * _205;
    float _225 = sqrt(_217);
    float _227 = _175 * _213;
    float _229 = _167 * _213;
    float _231 = _165 * _213;
    float _233 = _219 * _227;
    float _235 = _77 * _195;
    float _237 = _221 * _231;
    float _239 = -_233;
    float _241 = fma(_221, _229, _239);
    float _243 = _223 * _229;
    float _245 = -_237;
    float _247 = fma(_223, _227, _245);
    float _249 = _235 * _241;
    float _251 = -_243;
    float _253 = fma(_219, _231, _251);
    float _255 = _235 * _247;
    float _257 = spvFAdd(_225, 9.9999997473787516355514526367188e-06);
    float _259 = _249 * _249;
    float _261 = _235 * _253;
    float _263 = fma(_255, _255, _259);
    float _265 = 1.0 / _257;
    float _267 = fma(_261, _261, _263);
    float _269 = rsqrt(_267);
    float _271 = _209 * _265;
    float _273 = _189 * _265;
    float _275 = _203 * _265;
    float _277 = _229 * _273;
    float _279 = _249 * _269;
    float _281 = _255 * _269;
    float _283 = -_271;
    float _285 = -_277;
    float _287 = fma(_231, _283, _285);
    float _289 = _271 * _279;
    float _291 = _261 * _269;
    float _293 = -_275;
    float _295 = fma(_227, _293, _287);
    float _297 = fma(_273, _281, _289);
    float _299 = _295 * (-0.125);
    float _301 = fma(_275, _291, _297);
    float _303 = fma(_81, 0.787499964237213134765625, _299);
    float _305 = _301 * (-0.125);
    float _307 = fma(_91, 1.0499999523162841796875, _305);
    bool _311 = _97 >= 0.5;
    bool _313 = isnan(_97);
    bool _315 = _311 || _313;
    bool _317 = isnan(0.5);
    bool _319 = _315 || _317;
    bool _321 = _99 >= 0.5;
    bool _323 = isnan(_99);
    bool _325 = _321 || _323;
    bool _327 = isnan(0.5);
    bool _329 = _325 || _327;
    float _331 = _97 * _103;
    float _333 = _331 * 2.0;
    float _335 = -_97;
    float _337 = _335 + 1.0;
    float _339 = -_103;
    float _341 = _339 + 1.0;
    float _343 = -_99;
    float _345 = _343 + 1.0;
    float _347 = -_105;
    float _349 = _347 + 1.0;
    float _351 = _99 * _105;
    float _353 = _351 * 2.0;
    float _355 = _337 * _341;
    float _357 = _345 * _349;
    float _359 = _333;
    float _361 = _353;
    if (_319)
    {
        float _363 = fma(_355, -2.0, 1.0);
        _359 = _363;
    }
    float _365 = _359;
    if (_329)
    {
        float _367 = fma(_357, -2.0, 1.0);
        _361 = _367;
    }
    float _369 = _361;
    float _371 = fma(_365, 2.0, -1.0);
    float _373 = fma(_369, 2.0, -1.0);
    float _375 = _371 * (-0.20000000298023223876953125);
    float _377 = _373 * 0.20000000298023223876953125;
    float _379 = fma(_81, 1.0499999523162841796875, _375);
    float _381 = _303 + _375;
    float _383 = fma(_85, 1.0499999523162841796875, _377);
    float _385 = _307 + _377;
    float2 _898 = float2(_379, _383);
    float _387 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_898, float2(0.0), isnan(_898))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_898, float2(0.0), isnan(_898))).x;
    float2 _906 = float2(_381, _385);
    float _389 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_906, float2(0.0), isnan(_906))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_906, float2(0.0), isnan(_906))).x;
    float _391 = in.m_47.x;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = _77 * _395;
    float _399 = _397 + (-1.0);
    float _401 = _387 + _389;
    float _403 = _401 * 0.5;
    float _405 = sqrt(_403);
    float _407 = _405 + _399;
    float _409 = _397 * _407;
    float _411 = _409 * 4.0;
    float _413 = precise::clamp(_411, 0.0, 1.0);
    bool _415 = _413 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _417 = isnan(_413);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _423 = _419 || _421;
    if (!_423)
    {
        discard_fragment();
    }
    if (!_423)
    {
        out.m_50.x = 0.0;
        out.m_50.y = 0.0;
        out.m_50.z = 0.0;
        out.m_50.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_50)};
    }
    out.m_50.x = 1.0;
    out.m_50.y = 1.0;
    out.m_50.z = 1.0;
    out.m_50.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_50)};
}

