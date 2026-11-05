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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texturecube<float> fp_t_tcb_1E [[id(6)]];
    sampler fp_t_tcb_1ESmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_1ESmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_38 [[user(locn2)]];
    float4 m_36 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_47 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_36.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _618 = float2(_86, _88);
    float _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_618, float2(0.0), isnan(_618))).w;
    float _92 = in.m_38.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_40.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_42.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = _84 * _96;
    float _112 = _84 * _102;
    float _114 = in.m_36.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _84 * _118;
    float _122 = _90 * _110;
    float _124 = _84 * _108;
    float _126 = _112 * _122;
    float _128 = 0.0 + _126;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = _130 * _124;
    bool _135 = _132 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _137 = isnan(_132);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _143 = _139 || _141;
    float _145 = in.m_36.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    if (!_143)
    {
        discard_fragment();
    }
    float _151 = _84 * _149;
    float2 _715 = float2(_151, _120);
    float2 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_715, float2(0.0), isnan(_715))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_715, float2(0.0), isnan(_715))).xy;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = in.m_40.x;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_40.y;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_40.z;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _84 * _165;
    float _181 = _84 * _171;
    float _183 = _84 * _177;
    if (!_143)
    {
        out.m_45.x = _179;
        out.m_45.y = _181;
        out.m_45.z = _183;
        out.m_45.w = _126;
        return out;
    }
    float _185 = in.m_47.w;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = _84 * _189;
    bool _193 = _191 != 1.0;
    bool _195 = isnan(_191);
    bool _197 = _193 || _195;
    bool _199 = isnan(1.0);
    bool _201 = _197 || _199;
    bool _203 = !_201;
    if (!_203)
    {
        float _205 = gl_FragCoord.x;
        float _207 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _209 = _205 / _207;
        float _211 = gl_FragCoord.y;
        float _213 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _215 = _211 / _213;
        float _217 = _191 * 256.0;
        float _219 = trunc(_217);
        int _222 = int(_219);
        uint _225 = uint(int(uint(_222) >> uint(7)));
        int _227 = int(_225) + _222;
        float _229 = trunc(_209);
        int _231 = int(_229);
        float _233 = trunc(_215);
        int _235 = int(_233);
        int _237 = _231 + 2;
        int _239 = _237 >> 1;
        uint _241 = uint(int(uint(_235) >> uint(1)));
        int _243 = _239 ^ int(_241);
        int _245 = _243 << 16;
        int _247 = _245 ^ _239;
        int _249 = 983055 & _247;
        int _251 = _249 << 6;
        int _253 = _251 + _249;
        int _255 = _253 & 13369548;
        uint _257 = uint(int(uint(_255) >> uint(3)));
        int _259 = _255 | int(_257);
        int _261 = _259 & 5570560;
        int _263 = _259 & 85;
        uint _265 = uint(int(uint(_261) >> uint(15)));
        int _267 = int(_265) + _263;
        bool _269 = uint(_227) > uint(_267);
        if (!_269)
        {
            discard_fragment();
        }
        if (!_269)
        {
            out.m_45.x = _179;
            out.m_45.y = _181;
            out.m_45.z = _183;
            out.m_45.w = _132;
            return out;
        }
    }
    float _271 = in.m_49.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_51.z;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_49.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_51.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_49.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_51.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_53.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_53.x;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_53.z;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = _159 * _159;
    float _327 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _329 = fma(_157, _157, _325);
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = -_331;
    float _335 = _333 + 1.0;
    float _337 = sqrt(_335);
    float _339 = _84 * _275;
    float _341 = _84 * _281;
    float _343 = _84 * _287;
    float _345 = _84 * _293;
    float _347 = _339 * _339;
    float _349 = _84 * _299;
    float _351 = _84 * _305;
    float _353 = _345 * _345;
    float _355 = fma(_343, _343, _347);
    float _357 = _84 * _311;
    float _359 = _84 * _317;
    float _361 = fma(_351, _351, _353);
    float _363 = fma(_349, _349, _355);
    float _365 = _357 * _357;
    float _367 = _84 * _323;
    float _369 = fma(_341, _341, _361);
    bool _371 = as_type<int>(_327) != 0;
    float _373 = fma(_359, _359, _365);
    float _375 = rsqrt(_363);
    float _377 = fma(_367, _367, _373);
    float _379 = rsqrt(_369);
    float _381 = rsqrt(_377);
    float _383 = _375 * _159;
    float _385 = _339 * _383;
    float _387 = _379 * _157;
    float _389 = _343 * _383;
    float _391 = fma(_345, _387, _385);
    float _393 = fma(_351, _387, _389);
    float _395 = _381 * _337;
    float _397 = _349 * _383;
    float _399 = fma(_357, _395, _391);
    float _401 = fma(_341, _387, _397);
    float _403 = fma(_359, _395, _393);
    float _405 = in.m_47.x;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    bool _411 = !_371;
    float _413 = -_399;
    float _415 = _411 ? _413 : _399;
    float _417 = fma(_367, _395, _401);
    bool _419 = !_371;
    float _421 = -_403;
    float _423 = _419 ? _421 : _403;
    float _425 = _415 * _415;
    bool _427 = !_371;
    float _429 = -_417;
    float _431 = _427 ? _429 : _417;
    float _433 = fma(_423, _423, _425);
    float _435 = fma(_431, _431, _433);
    float _437 = rsqrt(_435);
    float _439 = _423 * _437;
    float _441 = _415 * _437;
    float _443 = _431 * _437;
    float _445 = abs(_439);
    float _447 = abs(_441);
    float _449 = precise::max(_445, _447);
    float _451 = abs(_443);
    float _453 = precise::max(_451, _449);
    float _455 = _84 * _409;
    float _457 = 1.0 / _453;
    float _459 = precise::min(_455, 1.0);
    float _461 = _439 * _457;
    float _463 = _441 * _457;
    float _465 = -_457;
    float _467 = _443 * _465;
    float3 _1183 = float3(_461, _463, _467);
    float3 _471 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1183, float3(0.0), isnan(_1183)), level(_459)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1183, float3(0.0), isnan(_1183)), level(_459)).xyz;
    float _473 = _471.x;
    float _475 = _471.y;
    float _477 = _471.z;
    float _479 = in.m_59.x;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_59.y;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = in.m_59.z;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = in.m_61.x;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = in.m_61.y;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = in.m_61.z;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_63.x;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = in.m_63.w;
    float _523 = gl_FragCoord.w;
    float _525 = _521 * _523;
    float _527 = in.m_63.y;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = in.m_63.z;
    float _535 = gl_FragCoord.w;
    float _537 = _533 * _535;
    float _539 = _84 * _483;
    float _541 = _84 * _489;
    float _543 = _84 * _495;
    float _545 = fma(_473, 0.20999999344348907470703125, _539);
    float _547 = fma(_475, 0.20999999344348907470703125, _541);
    float _549 = fma(_477, 0.20999999344348907470703125, _543);
    float _551 = _84 * _501;
    float _553 = _84 * _507;
    float _555 = _84 * _513;
    float _557 = _545 + _551;
    float _559 = _547 + _553;
    float _561 = _549 + _555;
    float _563 = _84 * _519;
    float _565 = _84 * _525;
    float _567 = _179 * _557;
    float _569 = _84 * _531;
    float _571 = _84 * _537;
    float _573 = _181 * _559;
    float _575 = _183 * _561;
    float _577 = fma(_567, _565, _563);
    float _579 = 0.0 + _132;
    float _581 = precise::clamp(_579, 0.0, 1.0);
    float _583 = fma(_573, _565, _569);
    float _585 = fma(_575, _565, _571);
    out.m_45.x = _577;
    out.m_45.y = _583;
    out.m_45.z = _585;
    out.m_45.w = _581;
    return out;
}

