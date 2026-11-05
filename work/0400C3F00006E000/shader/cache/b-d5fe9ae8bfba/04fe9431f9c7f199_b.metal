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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _520 = float2(_65, _67);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_520, float2(0.0), isnan(_520))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_520, float2(0.0), isnan(_520))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    bool _81 = _77 > 0.0;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    if (!_89)
    {
        discard_fragment();
    }
    if (!_89)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _91 = in.m_38.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_38.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_40.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _63 * _95;
    float _111 = _63 * _101;
    float _113 = fma(_109, 1.5, -0.25);
    float _115 = fma(_111, 0.866025388240814208984375, -0.4330126941204071044921875);
    float _117 = _109 + (-0.5);
    float _119 = fma(_111, 1.5, -0.25);
    float _121 = _113 + (*spvDescriptorSet0.fp_c3)._m0[20].x;
    float _123 = fma(_117, 0.5, _115);
    float _125 = _119 + (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _127 = fma(_109, 0.866025388240814208984375, -0.4330126941204071044921875);
    float _129 = fma(_111, 0.5, -0.25);
    float _131 = fma(_109, -0.17364819347858428955078125, 0.086824096739292144775390625);
    float _133 = _123 + 0.5;
    float _135 = floor(_121);
    float _137 = -_129;
    float _139 = _127 + _137;
    float _141 = fma(_111, 0.9848077297210693359375, -0.49240386486053466796875);
    float _143 = fma(_111, -0.17364819347858428955078125, 0.086824096739292144775390625);
    float _145 = in.m_40.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _133 + (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _153 = -_141;
    float _155 = _131 + _153;
    float _157 = fma(_117, 0.9848077297210693359375, _143);
    float _159 = _63 * _107;
    float _161 = _139 + 0.5;
    float _163 = fma(_155, 2.0, 0.5);
    float _165 = fma(_157, 2.0, 0.5);
    float _167 = floor(_151);
    float _169 = _161 + (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _171 = _163 + (*spvDescriptorSet0.fp_c3)._m0[21].x;
    float _173 = _165 + (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _175 = -_135;
    float _177 = _121 + _175;
    float _179 = floor(_171);
    float _181 = floor(_125);
    float _183 = -_167;
    float _185 = _151 + _183;
    float _187 = _63 * _149;
    float _189 = floor(_173);
    float _191 = -_179;
    float _193 = _171 + _191;
    float2 _709 = float2(_187, _159);
    float2 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_709, float2(0.0), isnan(_709))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_709, float2(0.0), isnan(_709))).xz;
    float _199 = _197.x;
    float _201 = _197.y;
    float _203 = -_181;
    float _205 = _125 + _203;
    float _207 = floor(_169);
    float _209 = -_189;
    float _211 = _173 + _209;
    float _213 = -_207;
    float _215 = _169 + _213;
    float2 _738 = float2(_177, _205);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_738, float2(0.0), isnan(_738))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_738, float2(0.0), isnan(_738))).y;
    float2 _746 = float2(_193, _211);
    float _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_746, float2(0.0), isnan(_746))).z;
    float2 _754 = float2(_215, _185);
    float _221 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_754, float2(0.0), isnan(_754))).x;
    float _223 = abs(_75);
    float _225 = log2(_223);
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _229 = _227 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _231 = in.m_42.z;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_42.w;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = fma(_67, _229, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _245 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _247 = _245 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _249 = _225 * 2.2000000476837158203125;
    float _251 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _253 = _251 + (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _255 = exp2(_249);
    float _257 = -_255;
    float _259 = _257 + 1.0;
    float _261 = fma(_255, _259, _255);
    float _263 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _265 = _263 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _267 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _269 = _267 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _271 = -_261;
    float _273 = _271 + 1.0;
    float _275 = fma(_67, _265, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _277 = fma(_67, _269, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _279 = in.m_42.y;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = _273 * _77;
    float _287 = fma(_77, _273, _261);
    float _289 = _275 * _285;
    float _291 = _277 * _285;
    float _293 = _243 * _285;
    float _295 = _63 * _235;
    float _297 = in.m_42.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = 1.0 / _287;
    float _305 = _63 * _301;
    float _307 = _63 * _283;
    float _309 = abs(_201);
    float _311 = log2(_309);
    float _313 = _311 * 0.4545449912548065185546875;
    float _315 = exp2(_313);
    float _317 = precise::min(_219, _217);
    float _319 = precise::min(_199, _317);
    float _321 = -_221;
    float _323 = _321 + 1.0;
    float _325 = _319 * 0.7799999713897705078125;
    float _327 = precise::max(_315, 0.5);
    float _329 = precise::max(0.0, _315);
    float _331 = precise::min(_327, 1.0);
    float _333 = _63 * _241;
    float _335 = fma(_331, 2.0, -1.0);
    float _337 = -(*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _339 = _337 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _341 = precise::min(_329, 0.5);
    float _343 = fma(_335, _247, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _345 = fma(_335, _253, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _347 = fma(_335, _339, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _349 = _73 * 0.7799999713897705078125;
    float _351 = _341 * 2.0;
    float _353 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _355 = _343 + _353;
    float _357 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _359 = _347 + _357;
    float _361 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _363 = _345 + _361;
    float _365 = fma(_351, _355, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _367 = fma(_351, _359, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _369 = fma(_351, _363, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    bool _371 = _365 >= 0.5;
    bool _373 = isnan(_365);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.5);
    bool _379 = _375 || _377;
    float _381 = _365 * 2.0;
    bool _383 = _367 >= 0.5;
    bool _385 = isnan(_367);
    bool _387 = _383 || _385;
    bool _389 = isnan(0.5);
    bool _391 = _387 || _389;
    float _393 = _367 * 2.0;
    bool _395 = _369 >= 0.5;
    bool _397 = isnan(_369);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.5);
    bool _403 = _399 || _401;
    float _405 = _369 * 2.0;
    float _407 = -_381;
    float _409 = _407 + 2.0;
    float _411 = -_393;
    float _413 = _411 + 2.0;
    float _415 = _221 * _393;
    float _417 = -_405;
    float _419 = _417 + 2.0;
    float _421 = _221 * _381;
    float _423 = _221 * _405;
    float _425 = -_325;
    float _427 = _425 + 1.0;
    float _429 = _421;
    float _431 = _415;
    float _433 = _423;
    if (_379)
    {
        float _435 = -_409;
        float _437 = fma(_323, _435, 1.0);
        _429 = _437;
    }
    float _439 = _429;
    if (_391)
    {
        float _441 = -_413;
        float _443 = fma(_441, _323, 1.0);
        _431 = _443;
    }
    float _445 = _431;
    float _447 = fma(_287, _427, _325);
    if (_403)
    {
        float _449 = -_419;
        float _451 = fma(_323, _449, 1.0);
        _433 = _451;
    }
    float _453 = _433;
    float _455 = -_349;
    float _457 = _455 + 1.0;
    float _459 = fma(_261, _445, _289);
    float _461 = fma(_261, _439, _291);
    float _463 = fma(_261, _453, _293);
    float _465 = fma(_447, _457, _349);
    float _467 = fma(_459, _303, _325);
    float _469 = fma(_461, _303, _325);
    float _471 = fma(_463, _303, _325);
    float _473 = _333 * _465;
    float _475 = precise::clamp(_473, 0.0, 1.0);
    float _477 = fma(_305, _349, _467);
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = fma(_307, _349, _469);
    float _483 = precise::clamp(_481, 0.0, 1.0);
    float _485 = fma(_295, _349, _471);
    float _487 = precise::clamp(_485, 0.0, 1.0);
    out.m_36.x = _479;
    out.m_36.y = _483;
    out.m_36.z = _487;
    out.m_36.w = _475;
    return out;
}

