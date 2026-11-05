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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_43 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_35 [[user(locn6)]];
    float4 m_39 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _81 = 1.0 / _53;
    float _83 = _81 * _59;
    float _85 = _81 * _65;
    float _87 = _81 * _71;
    float _89 = _81 * _77;
    float _91 = in.m_35.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = -_85;
    float _99 = _83 + _97;
    float _101 = in.m_35.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = -_89;
    float _109 = _87 + _107;
    float _111 = _99 * _79;
    float _113 = _109 * _79;
    float _115 = _111 * _111;
    float _117 = fma(_113, _113, _115);
    float _119 = abs(_117);
    float _121 = log2(_119);
    float _123 = _81 * _95;
    float _125 = _121 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _127 = _81 * _105;
    float _129 = -_127;
    float _131 = _87 + _129;
    float _133 = exp2(_125);
    float _135 = _133 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _137 = fma(_113, _135, _87);
    float _139 = fma(_111, _135, _83);
    float _141 = -_123;
    float _143 = _83 + _141;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _147 = fma(_131, _145, _137);
    float _149 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _153 = fma(_143, _151, _139);
    float _155 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _157 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _159 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _161 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _163 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _165 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _167 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float2 _644 = float2(_155, _149);
    float2 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_644, float2(0.0), isnan(_644))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_644, float2(0.0), isnan(_644))).xw;
    float _173 = _171.x;
    float _175 = _171.y;
    float2 _659 = float2(_161, _157);
    float2 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_659, float2(0.0), isnan(_659))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_659, float2(0.0), isnan(_659))).xw;
    float _179 = _177.x;
    float _181 = _177.y;
    float2 _671 = float2(_159, _163);
    float2 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_671, float2(0.0), isnan(_671))).xw;
    float _185 = _183.x;
    float _187 = _183.y;
    float2 _683 = float2(_165, _167);
    float2 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_683, float2(0.0), isnan(_683))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_683, float2(0.0), isnan(_683))).xw;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = in.m_37.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = sqrt(_117);
    float _203 = in.m_37.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_37.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = (*spvDescriptorSet0.fp_c3)._m0[2].y + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _217 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[26].w;
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _221 = _201 + _219;
    float _223 = 1.0 / _215;
    float _225 = _221 * _217;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[27].x, 1.0);
    float _231 = _81 * _199;
    float _233 = _229 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _235 = 1.0 / _231;
    float _237 = _173 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _239 = _175 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _241 = _179 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _243 = _181 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _245 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[2].y, _237);
    float _247 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[2].y, _239);
    float _249 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[2].y, _241);
    float _251 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[2].y, _243);
    float _253 = fma(_245, _223, -0.5);
    float _255 = fma(_247, _223, -0.5);
    float _257 = fma(_249, _223, -0.5);
    float _259 = fma(_251, _223, -0.5);
    float _261 = _81 * _207;
    float _263 = _81 * _213;
    float _265 = fma(_257, _233, _147);
    float _267 = fma(_259, _233, _153);
    float _269 = fma(_255, _233, _139);
    float _271 = fma(_253, _233, _137);
    float _273 = _261 * _235;
    float _275 = _263 * _235;
    float2 _831 = float2(_265, _267);
    float _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_831, float2(0.0), isnan(_831))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_831, float2(0.0), isnan(_831))).x;
    float2 _839 = float2(_271, _269);
    float _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_839, float2(0.0), isnan(_839))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_839, float2(0.0), isnan(_839))).x;
    float2 _847 = float2(_273, _275);
    float _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_847, float2(0.0), isnan(_847))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_847, float2(0.0), isnan(_847))).x;
    float _283 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _285 = in.m_39.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_41.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _299 = _201 + _297;
    float _301 = _143 * _143;
    float _303 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _305 = _201 + _303;
    float _307 = (*spvDescriptorSet0.fp_c3)._m0[44].w + (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _309 = fma(_131, _131, _301);
    float _311 = 1.0 / _307;
    float _313 = _299 * _283;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = _315 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _319 = sqrt(_309);
    float _321 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, -4.0, _317);
    float _323 = in.m_43.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = _321 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _331 = _81 * _289;
    float _333 = -(*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _335 = _331 + _333;
    float _337 = _317 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _339 = -_319;
    float _341 = _339 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _343 = _335 * _311;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = precise::max(0.0, _341);
    float _349 = -_345;
    float _351 = _349 + 1.0;
    float _353 = precise::min(_347, 0.5);
    float _355 = _353 * _353;
    float _357 = _355 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _359 = _277 + _329;
    float _361 = _81 * _295;
    float _363 = _279 + _337;
    float _365 = _281 * (*spvDescriptorSet0.fp_c3)._m0[46].x;
    float _367 = _81 * _327;
    float _369 = _361 * _359;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = _363 * _361;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    bool _379 = _231 > _365;
    float _381 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _383 = _371 + _381;
    float _385 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _387 = _375 + _385;
    float _389 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _391 = precise::max(0.0, _383);
    float _393 = _387 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = precise::min(_391, 0.949999988079071044921875);
    float _399 = _397 * 0.20000000298023223876953125;
    float _401 = fma(_399, (*spvDescriptorSet0.fp_c3)._m0[4].y, _395);
    float _403 = _395;
    float _405 = _401;
    if (_379)
    {
        float _407 = -_365;
        float _409 = _231 + _407;
        _403 = _409;
    }
    float _411 = _403;
    float _413 = _305 * _389;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = _401 * _357;
    float _419 = _411;
    if (_379)
    {
        float _421 = 1.0 / _411;
        _419 = _421;
    }
    float _423 = _419;
    float _425 = fma(_417, 6.0, _401);
    float _427 = fma(_415, (*spvDescriptorSet0.fp_c3)._m0[8].w, _425);
    float _429 = fma(_351, (*spvDescriptorSet0.fp_c3)._m0[45].x, _427);
    float _431 = _429 + _367;
    float _433 = precise::clamp(_431, 0.0, 1.0);
    int _436 = as_type<int>(_433);
    if (_379)
    {
        float _438 = _423 * (*spvDescriptorSet0.fp_c3)._m0[46].y;
        float _440 = precise::clamp(_438, 0.0, 1.0);
        _405 = _440;
    }
    float _442 = _405;
    if (_379)
    {
        float _444 = _433 * _442;
        _436 = as_type<int>(_444);
    }
    int _446 = _436;
    out.m_46.x = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_46.y = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_46.z = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_46.w = as_type<float>(_446);
    return out;
}


struct main0_out_u
{
    uint4 m_46 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _81 = 1.0 / _53;
    float _83 = _81 * _59;
    float _85 = _81 * _65;
    float _87 = _81 * _71;
    float _89 = _81 * _77;
    float _91 = in.m_35.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = -_85;
    float _99 = _83 + _97;
    float _101 = in.m_35.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = -_89;
    float _109 = _87 + _107;
    float _111 = _99 * _79;
    float _113 = _109 * _79;
    float _115 = _111 * _111;
    float _117 = fma(_113, _113, _115);
    float _119 = abs(_117);
    float _121 = log2(_119);
    float _123 = _81 * _95;
    float _125 = _121 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _127 = _81 * _105;
    float _129 = -_127;
    float _131 = _87 + _129;
    float _133 = exp2(_125);
    float _135 = _133 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _137 = fma(_113, _135, _87);
    float _139 = fma(_111, _135, _83);
    float _141 = -_123;
    float _143 = _83 + _141;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _147 = fma(_131, _145, _137);
    float _149 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _153 = fma(_143, _151, _139);
    float _155 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _157 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _159 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _161 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _163 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _165 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _167 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float2 _644 = float2(_155, _149);
    float2 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_644, float2(0.0), isnan(_644))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_644, float2(0.0), isnan(_644))).xw;
    float _173 = _171.x;
    float _175 = _171.y;
    float2 _659 = float2(_161, _157);
    float2 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_659, float2(0.0), isnan(_659))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_659, float2(0.0), isnan(_659))).xw;
    float _179 = _177.x;
    float _181 = _177.y;
    float2 _671 = float2(_159, _163);
    float2 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_671, float2(0.0), isnan(_671))).xw;
    float _185 = _183.x;
    float _187 = _183.y;
    float2 _683 = float2(_165, _167);
    float2 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_683, float2(0.0), isnan(_683))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_683, float2(0.0), isnan(_683))).xw;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = in.m_37.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = sqrt(_117);
    float _203 = in.m_37.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_37.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = (*spvDescriptorSet0.fp_c3)._m0[2].y + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _217 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[26].w;
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _221 = _201 + _219;
    float _223 = 1.0 / _215;
    float _225 = _221 * _217;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[27].x, 1.0);
    float _231 = _81 * _199;
    float _233 = _229 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _235 = 1.0 / _231;
    float _237 = _173 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _239 = _175 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _241 = _179 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _243 = _181 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _245 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[2].y, _237);
    float _247 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[2].y, _239);
    float _249 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[2].y, _241);
    float _251 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[2].y, _243);
    float _253 = fma(_245, _223, -0.5);
    float _255 = fma(_247, _223, -0.5);
    float _257 = fma(_249, _223, -0.5);
    float _259 = fma(_251, _223, -0.5);
    float _261 = _81 * _207;
    float _263 = _81 * _213;
    float _265 = fma(_257, _233, _147);
    float _267 = fma(_259, _233, _153);
    float _269 = fma(_255, _233, _139);
    float _271 = fma(_253, _233, _137);
    float _273 = _261 * _235;
    float _275 = _263 * _235;
    float2 _831 = float2(_265, _267);
    float _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_831, float2(0.0), isnan(_831))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_831, float2(0.0), isnan(_831))).x;
    float2 _839 = float2(_271, _269);
    float _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_839, float2(0.0), isnan(_839))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_839, float2(0.0), isnan(_839))).x;
    float2 _847 = float2(_273, _275);
    float _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_847, float2(0.0), isnan(_847))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_847, float2(0.0), isnan(_847))).x;
    float _283 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _285 = in.m_39.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_41.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _299 = _201 + _297;
    float _301 = _143 * _143;
    float _303 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _305 = _201 + _303;
    float _307 = (*spvDescriptorSet0.fp_c3)._m0[44].w + (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _309 = fma(_131, _131, _301);
    float _311 = 1.0 / _307;
    float _313 = _299 * _283;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = _315 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _319 = sqrt(_309);
    float _321 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, -4.0, _317);
    float _323 = in.m_43.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = _321 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _331 = _81 * _289;
    float _333 = -(*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _335 = _331 + _333;
    float _337 = _317 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _339 = -_319;
    float _341 = _339 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _343 = _335 * _311;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = precise::max(0.0, _341);
    float _349 = -_345;
    float _351 = _349 + 1.0;
    float _353 = precise::min(_347, 0.5);
    float _355 = _353 * _353;
    float _357 = _355 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _359 = _277 + _329;
    float _361 = _81 * _295;
    float _363 = _279 + _337;
    float _365 = _281 * (*spvDescriptorSet0.fp_c3)._m0[46].x;
    float _367 = _81 * _327;
    float _369 = _361 * _359;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = _363 * _361;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    bool _379 = _231 > _365;
    float _381 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _383 = _371 + _381;
    float _385 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _387 = _375 + _385;
    float _389 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _391 = precise::max(0.0, _383);
    float _393 = _387 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = precise::min(_391, 0.949999988079071044921875);
    float _399 = _397 * 0.20000000298023223876953125;
    float _401 = fma(_399, (*spvDescriptorSet0.fp_c3)._m0[4].y, _395);
    float _403 = _395;
    float _405 = _401;
    if (_379)
    {
        float _407 = -_365;
        float _409 = _231 + _407;
        _403 = _409;
    }
    float _411 = _403;
    float _413 = _305 * _389;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = _401 * _357;
    float _419 = _411;
    if (_379)
    {
        float _421 = 1.0 / _411;
        _419 = _421;
    }
    float _423 = _419;
    float _425 = fma(_417, 6.0, _401);
    float _427 = fma(_415, (*spvDescriptorSet0.fp_c3)._m0[8].w, _425);
    float _429 = fma(_351, (*spvDescriptorSet0.fp_c3)._m0[45].x, _427);
    float _431 = _429 + _367;
    float _433 = precise::clamp(_431, 0.0, 1.0);
    int _436 = as_type<int>(_433);
    if (_379)
    {
        float _438 = _423 * (*spvDescriptorSet0.fp_c3)._m0[46].y;
        float _440 = precise::clamp(_438, 0.0, 1.0);
        _405 = _440;
    }
    float _442 = _405;
    if (_379)
    {
        float _444 = _433 * _442;
        _436 = as_type<int>(_444);
    }
    int _446 = _436;
    out.m_46.x = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_46.y = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_46.z = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_46.w = as_type<float>(_446);
    return main0_out_u{as_type<uint4>(out.m_46)};
}

