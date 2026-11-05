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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _657 = float2(_90, _92);
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_657, float2(0.0), isnan(_657))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_657, float2(0.0), isnan(_657))).w;
    float _96 = in.m_42.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_46.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_48.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _88 * _100;
    float _122 = _88 * _106;
    float _124 = _88 * _112;
    float _126 = in.m_40.z;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = -_120;
    float _134 = fma(_94, _122, _132);
    float _136 = _88 * _118;
    float _138 = _124 * _134;
    float _140 = 0.0 + _138;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _142 * _136;
    bool _147 = _144 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _149 = isnan(_144);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _155 = _151 || _153;
    float _157 = in.m_40.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    if (!_155)
    {
        discard_fragment();
    }
    float _163 = _88 * _130;
    float _165 = _88 * _161;
    float2 _767 = float2(_163, _165);
    float3 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_767, float2(0.0), isnan(_767))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_767, float2(0.0), isnan(_767))).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    float _177 = in.m_42.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_42.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_46.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_42.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_46.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_46.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_44.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_44.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_44.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = _88 * _181;
    float _233 = _88 * _187;
    float _235 = _88 * _193;
    float _237 = _88 * _199;
    float _239 = _88 * _205;
    float _241 = _88 * _211;
    float _243 = -_235;
    float _245 = _233 + _243;
    float _247 = -_239;
    float _249 = _237 + _247;
    float _251 = -_241;
    float _253 = _231 + _251;
    float _255 = _171 * _171;
    float _257 = _173 * _173;
    float _259 = _175 * _175;
    float _261 = fma(_255, _245, _235);
    float _263 = fma(_257, _249, _239);
    float _265 = fma(_259, _253, _241);
    float _267 = _88 * _217;
    float _269 = _88 * _223;
    float _271 = _88 * _229;
    float _273 = _261 * _267;
    float _275 = _263 * _269;
    float _277 = _265 * _271;
    if (!_155)
    {
        out.m_51.x = _273;
        out.m_51.y = _275;
        out.m_51.z = _277;
        out.m_51.w = _138;
        return out;
    }
    float _279 = in.m_53.w;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = _88 * _283;
    bool _287 = _285 != 1.0;
    bool _289 = isnan(_285);
    bool _291 = _287 || _289;
    bool _293 = isnan(1.0);
    bool _295 = _291 || _293;
    bool _297 = !_295;
    if (!_297)
    {
        float _299 = gl_FragCoord.x;
        float _301 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _303 = _299 / _301;
        float _305 = gl_FragCoord.y;
        float _307 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _309 = _305 / _307;
        float _311 = _285 * 256.0;
        float _313 = trunc(_311);
        int _316 = int(_313);
        uint _319 = uint(int(uint(_316) >> uint(7)));
        int _321 = int(_319) + _316;
        float _323 = trunc(_303);
        int _325 = int(_323);
        float _327 = trunc(_309);
        int _329 = int(_327);
        int _331 = _325 + 2;
        int _333 = _331 >> 1;
        uint _335 = uint(int(uint(_329) >> uint(1)));
        int _337 = _333 ^ int(_335);
        int _339 = _337 << 16;
        int _341 = _339 ^ _333;
        int _343 = 983055 & _341;
        int _345 = _343 << 6;
        int _347 = _345 + _343;
        int _349 = _347 & 13369548;
        uint _351 = uint(int(uint(_349) >> uint(3)));
        int _353 = _349 | int(_351);
        int _355 = _353 & 5570560;
        int _357 = _353 & 85;
        uint _359 = uint(int(uint(_355) >> uint(15)));
        int _361 = int(_359) + _357;
        bool _363 = uint(_321) > uint(_361);
        if (!_363)
        {
            discard_fragment();
        }
        if (!_363)
        {
            out.m_51.x = _273;
            out.m_51.y = _275;
            out.m_51.z = _277;
            out.m_51.w = _144;
            return out;
        }
    }
    float _365 = in.m_55.y;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _373 = in.m_55.x;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_55.z;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_53.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = _88 * _369;
    bool _393 = as_type<int>(_371) != 0;
    float _395 = _88 * _377;
    bool _397 = !_393;
    float _399 = -_391;
    float _401 = _397 ? _399 : _391;
    float _403 = _88 * _383;
    bool _405 = !_393;
    float _407 = -_395;
    float _409 = _405 ? _407 : _395;
    float _411 = _401 * _401;
    bool _413 = !_393;
    float _415 = -_403;
    float _417 = _413 ? _415 : _403;
    float _419 = fma(_409, _409, _411);
    float _421 = fma(_417, _417, _419);
    float _423 = rsqrt(_421);
    float _425 = _409 * _423;
    float _427 = _401 * _423;
    float _429 = _417 * _423;
    float _431 = _88 * _389;
    float _433 = abs(_425);
    float _435 = abs(_427);
    float _437 = precise::max(_433, _435);
    float _439 = abs(_429);
    float _441 = precise::max(_439, _437);
    float _443 = 1.0 / _441;
    float _445 = _425 * _443;
    float _447 = -_443;
    float _449 = _429 * _447;
    float _451 = precise::min(_431, 1.0);
    float _453 = _427 * _443;
    float3 _1186 = float3(_445, _453, _449);
    float3 _455 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1186, float3(0.0), isnan(_1186)), level(_451)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1186, float3(0.0), isnan(_1186)), level(_451)).xyz;
    float _457 = _455.x;
    float _459 = _455.y;
    float _461 = _455.z;
    float _463 = in.m_61.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_61.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_61.x;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_63.z;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_63.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_63.y;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_65.x;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_65.w;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_65.y;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_65.z;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = _88 * _467;
    float _525 = _88 * _473;
    float _527 = _88 * _479;
    bool _529 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _531 = _88 * _509;
    float _533 = fma(_461, 0.20999999344348907470703125, _525);
    float _535 = fma(_457, 0.20999999344348907470703125, _527);
    float _537 = _88 * _485;
    float _539 = fma(_459, 0.20999999344348907470703125, _523);
    float _541 = _88 * _491;
    float _543 = _88 * _497;
    float _545 = _533 + _537;
    float _547 = _535 + _541;
    float _549 = _539 + _543;
    float _551 = _277 * _545;
    float _553 = 0.0 + _144;
    float _555 = precise::clamp(_553, 0.0, 1.0);
    float _557 = _273 * _547;
    float _559 = _88 * _503;
    float _561 = _275 * _549;
    float _563 = _88 * _515;
    float _565 = _88 * _521;
    float _567 = fma(_557, _531, _559);
    float _569 = _559;
    if (!_529)
    {
        _569 = _555;
    }
    float _571 = _569;
    float _573 = fma(_561, _531, _563);
    float _575 = fma(_551, _531, _565);
    bool _577 = !_529;
    float _579 = _571;
    if (!_577)
    {
        float _581 = in.m_67.w;
        float _583 = gl_FragCoord.w;
        float _585 = _581 * _583;
        float _587 = in.m_67.z;
        float _589 = gl_FragCoord.w;
        float _591 = _587 * _589;
        float _593 = _88 * _585;
        float _595 = _88 * _591;
        float _597 = 1.0 / _593;
        float _599 = _595 * _597;
        float _601 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _603 = fma(_599, (*spvDescriptorSet0.fp_c8)._m0[30].w, _601);
        float _605 = 1.0 / _603;
        float _607 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _609 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _611 = fma(_605, _607, _609);
        float _613 = _611 * 8.0;
        float _615 = precise::clamp(_613, 0.0, 1.0);
        float _617 = _555 * _615;
        _579 = _617;
    }
    float _619 = _579;
    float _621 = 0.0 + _619;
    float _623 = precise::clamp(_621, 0.0, 1.0);
    out.m_51.x = _567;
    out.m_51.y = _573;
    out.m_51.z = _575;
    out.m_51.w = _623;
    return out;
}

