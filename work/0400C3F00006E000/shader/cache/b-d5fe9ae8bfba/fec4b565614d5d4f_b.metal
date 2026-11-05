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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _3222 = false;
    bool _2998 = false;
    bool _2782 = false;
    bool _2566 = false;
    bool _2350 = false;
    bool _2134 = false;
    bool _1918 = false;
    bool _1704 = false;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_36.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_36.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _3267 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3267, float2(0.0), isnan(_3267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3267, float2(0.0), isnan(_3267))).x;
    float _68 = fma(_64, 2.0, -1.0);
    float _70 = fma(_62, 2.0, -1.0);
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _74 = _72 + 1.0;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _78 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _80 = _78 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _84 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _86 = _82 * _76;
    float _88 = _82 * _84;
    float _90 = _82 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _94 = _88 * _92;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _98 = _88 * _96;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _102 = _88 * _100;
    bool _106 = _90 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _108 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[3].x, _94);
    float _110 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[4].x, _98);
    float _112 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[2].x, _102);
    bool _114 = _90 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _116 = -_90;
    float _118 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[3].z, _108);
    float _120 = -_90;
    float _122 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[4].z, _110);
    float _124 = -_90;
    float _126 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[2].z, _112);
    bool _128 = _90 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _130 = _118 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _132 = _122 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _134 = _126 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _136 = !_106;
    int _139 = _136 ? 0 : 1;
    float _141 = _130 * 78.233001708984375;
    float _143 = fma(_132, 12.98980045318603515625, _141);
    float _145 = fma(_134, 12.98980045318603515625, _141);
    float _147 = fma(_134, 45.16400146484375, _143);
    float _149 = fma(_132, 45.16400146484375, _145);
    float _151 = _147 + 94.67299652099609375;
    float _153 = _147 + 568.0379638671875;
    float _155 = _151 * 0.15915493667125701904296875;
    float _157 = _149 + 94.67299652099609375;
    float _159 = _153 * 0.15915493667125701904296875;
    float _161 = _149 + 568.0379638671875;
    float _163 = _157 * 0.15915493667125701904296875;
    float _165 = _147 + 189.3459930419921875;
    float _167 = _161 * 0.15915493667125701904296875;
    float _169 = _147 + 662.71099853515625;
    float _171 = _155 * 6.283185482025146484375;
    float _173 = sin(_171);
    float _175 = _165 * 0.15915493667125701904296875;
    float _177 = _149 + 189.3459930419921875;
    float _179 = _169 * 0.15915493667125701904296875;
    float _181 = _177 * 0.15915493667125701904296875;
    float _183 = _147 + 284.01898193359375;
    float _185 = _163 * 6.283185482025146484375;
    float _187 = sin(_185);
    float _189 = _183 * 0.15915493667125701904296875;
    float _191 = _149 + 284.01898193359375;
    float _193 = _191 * 0.15915493667125701904296875;
    float _195 = _147 + 378.691986083984375;
    float _197 = _181 * 6.283185482025146484375;
    float _199 = sin(_197);
    float _201 = _173 * 43758.546875;
    float _203 = _195 * 0.15915493667125701904296875;
    float _205 = _149 + 378.691986083984375;
    float _207 = _187 * 43758.546875;
    float _209 = _205 * 0.15915493667125701904296875;
    float _211 = _147 + 473.364990234375;
    float _213 = _175 * 6.283185482025146484375;
    float _215 = sin(_213);
    float _217 = _211 * 0.15915493667125701904296875;
    float _219 = _149 + 473.364990234375;
    float _221 = _199 * 43758.546875;
    float _223 = _219 * 0.15915493667125701904296875;
    float _225 = _189 * 6.283185482025146484375;
    float _227 = sin(_225);
    int _229 = 2;
    if (!_106)
    {
        _229 = 1;
    }
    int _231 = _229;
    int _233 = _231;
    if (!_114)
    {
        _233 = _139;
    }
    int _235 = _233;
    float _237 = _215 * 43758.546875;
    int _239 = _235 + 1;
    float _241 = _193 * 6.283185482025146484375;
    float _243 = sin(_241);
    int _245 = _239;
    if (!_128)
    {
        _245 = _235;
    }
    int _247 = _245;
    float _249 = _147 + 757.38397216796875;
    bool _251 = _247 != 1;
    float _253 = _249 * 0.15915493667125701904296875;
    float _255 = _149 + 662.71099853515625;
    float _257 = _179 * 6.283185482025146484375;
    float _259 = sin(_257);
    bool _261 = _247 != 0;
    float _263 = _149 + 757.38397216796875;
    bool _265 = !_251;
    int _267 = _265 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _269 = _227 * 43758.546875;
    bool _271 = !_251;
    int _273 = _271 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    float _275 = _263 * 0.15915493667125701904296875;
    float _277 = _261 ? as_type<float>(_267) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _279 = _253 * 6.283185482025146484375;
    float _281 = sin(_279);
    float _283 = _255 * 0.15915493667125701904296875;
    bool _285 = !_251;
    int _287 = _285 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _289 = _243 * 43758.546875;
    bool _291 = !_251;
    int _293 = _291 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _295 = _261 ? as_type<float>(_273) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _297 = _261 ? as_type<float>(_293) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _299 = _283 * 6.283185482025146484375;
    float _301 = sin(_299);
    bool _303 = !_251;
    int _305 = _303 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    float _307 = _130 * _295;
    float _309 = _130 * _297;
    bool _311 = !_251;
    int _313 = _311 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _315 = _203 * 6.283185482025146484375;
    float _317 = sin(_315);
    float _319 = _261 ? as_type<float>(_305) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    bool _321 = !_251;
    int _323 = _321 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    bool _325 = !_251;
    int _327 = _325 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _329 = _130 * _319;
    bool _331 = !_251;
    int _333 = _331 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _335 = _209 * 6.283185482025146484375;
    float _337 = sin(_335);
    float _339 = _261 ? as_type<float>(_313) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _341 = _261 ? as_type<float>(_323) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _343 = _261 ? as_type<float>(_327) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _345 = _130 * _277;
    float _347 = _261 ? as_type<float>(_287) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _349 = fma(_134, _341, _329);
    float _351 = _261 ? as_type<float>(_333) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _353 = fma(_134, _339, _307);
    float _355 = _130 * _347;
    float _357 = fma(_134, _351, _345);
    float _359 = _217 * 6.283185482025146484375;
    float _361 = sin(_359);
    bool _363 = !_251;
    int _365 = _363 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _367 = _317 * 43758.546875;
    bool _369 = !_251;
    int _371 = _369 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _373 = _337 * 43758.546875;
    bool _375 = !_251;
    int _377 = _375 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _379 = _261 ? as_type<float>(_365) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _381 = _223 * 6.283185482025146484375;
    float _383 = sin(_381);
    float _385 = _261 ? as_type<float>(_371) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _387 = _261 ? as_type<float>(_377) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _389 = fma(_132, _379, _353);
    bool _391 = !_251;
    int _393 = _391 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _395 = fma(_134, _385, _355);
    float _397 = fma(_134, _387, _309);
    float _399 = _159 * 6.283185482025146484375;
    float _401 = sin(_399);
    float _403 = _361 * 43758.546875;
    float _405 = _261 ? as_type<float>(_393) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _407 = _130 * _343;
    bool _409 = !_251;
    int _411 = _409 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    float _413 = _383 * 43758.546875;
    bool _415 = !_251;
    int _417 = _415 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _419 = _130 * _405;
    bool _421 = !_251;
    int _423 = _421 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _425 = _167 * 6.283185482025146484375;
    float _427 = sin(_425);
    float _429 = _261 ? as_type<float>(_411) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _431 = _401 * 43758.546875;
    float _433 = _261 ? as_type<float>(_417) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _435 = _275 * 6.283185482025146484375;
    float _437 = sin(_435);
    float _439 = _261 ? as_type<float>(_423) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _441 = fma(_132, _429, _357);
    bool _443 = !_251;
    int _445 = _443 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _447 = fma(_134, _433, _419);
    bool _449 = !_251;
    int _451 = _449 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _453 = fma(_132, _439, _397);
    float _455 = floor(_207);
    float _457 = _261 ? as_type<float>(_445) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    float _459 = fma(_132, _457, _349);
    float _461 = _261 ? as_type<float>(_451) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _463 = floor(_221);
    bool _465 = !_251;
    int _467 = _465 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    bool _469 = !_251;
    int _471 = _469 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _473 = fma(_134, _461, _407);
    bool _475 = !_251;
    int _477 = _475 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _479 = _261 ? as_type<float>(_467) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _481 = floor(_201);
    bool _483 = !_251;
    int _485 = _483 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _487 = -_455;
    float _489 = _207 + _487;
    float _491 = _261 ? as_type<float>(_471) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _493 = fma(_132, _479, _473);
    float _495 = _261 ? as_type<float>(_477) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _497 = _259 * 43758.546875;
    float _499 = _261 ? as_type<float>(_485) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _501 = fma(_132, _491, _395);
    bool _503 = !_251;
    int _505 = _503 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    float _507 = fma(_132, _495, _447);
    bool _509 = !_251;
    int _511 = _509 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _513 = _499 + _493;
    float _515 = _261 ? as_type<float>(_505) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _517 = _301 * 43758.546875;
    float _519 = _261 ? as_type<float>(_511) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _521 = _427 * 43758.546875;
    float _523 = _515 + _389;
    float _525 = _519 + _459;
    float _527 = _281 * 43758.546875;
    bool _529 = !_251;
    int _531 = _529 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _533 = floor(_237);
    float _535 = -_463;
    float _537 = _221 + _535;
    bool _539 = !_251;
    int _541 = _539 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _543 = -_481;
    float _545 = _201 + _543;
    bool _547 = !_251;
    int _549 = _547 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _551 = fma(_489, 2.0, -1.0);
    float _553 = _261 ? as_type<float>(_531) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _555 = floor(_269);
    bool _557 = !_251;
    int _559 = _557 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _561 = fma(_545, 2.0, -1.0);
    float _563 = _261 ? as_type<float>(_541) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _565 = _261 ? as_type<float>(_549) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _567 = _437 * 43758.546875;
    float _569 = _553 + _501;
    float _571 = _261 ? as_type<float>(_559) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _573 = _563 + _507;
    float _575 = floor(_289);
    float _577 = _565 + _453;
    float _579 = -_533;
    float _581 = _237 + _579;
    float _583 = _571 + _441;
    float _585 = float(_247);
    float _587 = -_555;
    float _589 = _269 + _587;
    float _591 = fma(_537, 2.0, -1.0);
    float _593 = floor(_367);
    float _595 = fma(_581, 2.0, -1.0);
    float _597 = _80 * _591;
    float _599 = floor(_373);
    float _601 = -_575;
    float _603 = _289 + _601;
    bool _605 = !_251;
    int _607 = _605 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _609 = fma(_603, 2.0, -1.0);
    float _611 = _261 ? as_type<float>(_607) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _613 = floor(_403);
    float _615 = -_593;
    float _617 = _367 + _615;
    float _619 = _80 * _551;
    float _621 = _80 * _609;
    float _623 = fma(_617, 2.0, -1.0);
    float _625 = _619 * _619;
    float _627 = floor(_413);
    float _629 = -_599;
    float _631 = _373 + _629;
    float _633 = _80 * _623;
    float _635 = _621 * _621;
    float _637 = fma(_631, 2.0, -1.0);
    float _639 = floor(_431);
    float _641 = -_613;
    float _643 = _403 + _641;
    float _645 = fma(_589, 2.0, -1.0);
    float _647 = _80 * _637;
    float _649 = fma(_643, 2.0, -1.0);
    float _651 = _80 * _645;
    float _653 = floor(_521);
    float _655 = -_627;
    float _657 = _413 + _655;
    float _659 = fma(_651, _651, _635);
    float _661 = _659 + 1.0;
    float _663 = floor(_497);
    float _665 = -_639;
    float _667 = _431 + _665;
    float _669 = fma(_657, 2.0, -1.0);
    float _671 = _80 * _595;
    float _673 = fma(_667, 2.0, -1.0);
    float _675 = floor(_517);
    float _677 = -_653;
    float _679 = _521 + _677;
    float _681 = _80 * _673;
    bool _683 = !_251;
    int _685 = _683 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    float _687 = _261 ? as_type<float>(_685) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _689 = floor(_527);
    float _691 = -_663;
    float _693 = _497 + _691;
    float _695 = fma(_679, 2.0, -1.0);
    float _697 = _80 * _561;
    float _699 = fma(_693, 2.0, -1.0);
    float _701 = _80 * _695;
    float _703 = fma(_697, _697, _625);
    float _705 = floor(_567);
    float _707 = -_675;
    float _709 = _517 + _707;
    float _711 = _80 * _699;
    float _713 = _703 + 1.0;
    bool _715 = !_251;
    int _717 = _715 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _719 = fma(_709, 2.0, -1.0);
    bool _721 = !_251;
    int _723 = _721 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _725 = -_689;
    float _727 = _527 + _725;
    float _729 = rsqrt(_713);
    float _731 = _261 ? as_type<float>(_723) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _733 = fma(_727, 2.0, -1.0);
    float _735 = _80 * _649;
    float _737 = _261 ? as_type<float>(_717) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _739 = -_705;
    float _741 = _567 + _739;
    float _743 = _80 * _669;
    float _745 = _80 * _733;
    float _747 = rsqrt(_661);
    float _749 = fma(_741, 2.0, -1.0);
    float _751 = _80 * _719;
    float _753 = _80 * _749;
    float _755 = _597 * _597;
    bool _757 = !_251;
    int _759 = _757 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _761 = fma(_619, _729, _577);
    float _763 = fma(_697, _729, _569);
    float _765 = fma(_671, _671, _755);
    bool _767 = !_251;
    int _769 = _767 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _771 = _731 * _761;
    bool _773 = !_251;
    int _775 = _773 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _777 = _765 + 1.0;
    bool _779 = !_251;
    int _781 = _779 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    float _783 = _647 * _647;
    float _785 = _261 ? as_type<float>(_775) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _787 = fma(_737, _763, _771);
    float _789 = _261 ? as_type<float>(_781) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _791 = rsqrt(_777);
    float _793 = fma(_633, _633, _783);
    float _795 = _261 ? as_type<float>(_769) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _797 = _785 * _761;
    float _799 = _261 ? as_type<float>(_759) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _801 = _793 + 1.0;
    float _803 = _789 * _761;
    float _805 = -_729;
    float _807 = _573 + _805;
    float _809 = rsqrt(_801);
    float _811 = fma(_795, _763, _803);
    float _813 = fma(_799, _763, _797);
    bool _815 = !_251;
    int _817 = _815 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _819 = fma(_597, _791, _577);
    float _821 = _687 * _761;
    float _823 = fma(_671, _791, _569);
    float _825 = _261 ? as_type<float>(_817) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _827 = _789 * _819;
    float _829 = fma(_611, _763, _821);
    float _831 = fma(_621, _747, _577);
    float _833 = _687 * _819;
    float _835 = _731 * _819;
    float _837 = _785 * _819;
    float _839 = fma(_795, _823, _827);
    float _841 = fma(_611, _823, _833);
    float _843 = fma(_737, _823, _835);
    float _845 = fma(_799, _823, _837);
    float _847 = fma(_651, _747, _569);
    float _849 = fma(_647, _809, _577);
    float _851 = _731 * _831;
    float _853 = _687 * _831;
    float _855 = _789 * _831;
    float _857 = _785 * _831;
    float _859 = fma(_737, _847, _851);
    float _861 = fma(_611, _847, _853);
    float _863 = fma(_795, _847, _855);
    float _865 = fma(_799, _847, _857);
    float _867 = fma(_633, _809, _569);
    float _869 = _731 * _849;
    float _871 = _687 * _849;
    float _873 = _789 * _849;
    float _875 = _785 * _849;
    float _877 = fma(_737, _867, _869);
    float _879 = fma(_611, _867, _871);
    float _881 = fma(_795, _867, _873);
    float _883 = fma(_799, _867, _875);
    float _885 = -_791;
    float _887 = _573 + _885;
    float _889 = 1.0 / _583;
    bool _891 = !_251;
    int _893 = _891 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    bool _895 = !_251;
    int _897 = _895 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _899 = _261 ? as_type<float>(_893) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _901 = rint(_585);
    float _903 = precise::max(_901, 0.0);
    uint _906 = uint(_903);
    uint _908 = clamp(_906, 0u, 65535u);
    float _910 = _261 ? as_type<float>(_897) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    bool _912 = !_251;
    int _914 = _912 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    float _916 = fma(_899, _807, _787);
    float _918 = fma(_910, _807, _811);
    float _920 = _261 ? as_type<float>(_914) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _922 = fma(_825, _807, _813);
    float _924 = -_747;
    float _926 = _573 + _924;
    float _928 = fma(_899, _887, _843);
    float _930 = fma(_910, _887, _839);
    float _932 = fma(_825, _887, _845);
    float _934 = fma(_920, _926, _861);
    float _936 = fma(_899, _926, _859);
    float _938 = fma(_910, _926, _863);
    float _940 = fma(_825, _926, _865);
    bool _942 = !_251;
    int _944 = _942 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _946 = _743 * _743;
    float _948 = fma(_920, _887, _841);
    float _950 = fma(_920, _807, _829);
    float _952 = _261 ? as_type<float>(_944) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _954 = fma(_735, _735, _946);
    float _956 = -_809;
    float _958 = _573 + _956;
    float _960 = _513 * _889;
    float _962 = _523 * _889;
    float _964 = _954 + 1.0;
    float _966 = _952 + _922;
    float _968 = fma(_920, _958, _879);
    float _970 = fma(_825, _958, _883);
    float _972 = rsqrt(_964);
    bool _974 = !_251;
    int _976 = _974 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _978 = fma(_899, _958, _877);
    float _980 = fma(_910, _958, _881);
    bool _982 = !_251;
    int _984 = _982 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _986 = !_251;
    int _988 = _986 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _990 = 1.0 / _966;
    float _992 = _261 ? as_type<float>(_976) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _994 = _261 ? as_type<float>(_984) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _996 = _261 ? as_type<float>(_988) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _998 = _992 + _950;
    float _1000 = _992 + _948;
    float _1002 = _994 + _916;
    float _1004 = fma(_743, _972, _577);
    float _1006 = _996 + _918;
    float _1008 = _996 + _930;
    float _1010 = _994 + _928;
    float _1012 = _687 * _1004;
    float _1014 = _789 * _1004;
    float _1016 = _785 * _1004;
    float _1018 = _998 * _990;
    float _1020 = _1002 * _990;
    float _1022 = _1006 * _990;
    float _1024 = fma(_735, _972, _569);
    float _1026 = _731 * _1004;
    float _1028 = fma(_611, _1024, _1012);
    float _1030 = _701 * _701;
    float _1032 = fma(_737, _1024, _1026);
    float _1034 = fma(_795, _1024, _1014);
    float _1036 = fma(_799, _1024, _1016);
    float _1038 = fma(_681, _681, _1030);
    float _1040 = _952 + _932;
    float _1042 = _1038 + 1.0;
    float _1044 = -_972;
    float _1046 = _573 + _1044;
    float _1048 = 1.0 / _1040;
    float _1050 = fma(_920, _1046, _1028);
    float _1052 = fma(_899, _1046, _1032);
    float _1054 = fma(_910, _1046, _1034);
    float _1056 = fma(_825, _1046, _1036);
    float _1058 = rsqrt(_1042);
    float _1060 = _1000 * _1048;
    float _1062 = _1008 * _1048;
    float _1064 = _525 * _889;
    float _1066 = _1010 * _1048;
    float _1068 = fma(_701, _1058, _577);
    float _1070 = fma(_681, _1058, _569);
    float _1072 = -_1058;
    float _1074 = _573 + _1072;
    float _1076 = _687 * _1068;
    float _1078 = _731 * _1068;
    float _1080 = _789 * _1068;
    float _1082 = _785 * _1068;
    float _1084 = fma(_611, _1070, _1076);
    float _1086 = _751 * _751;
    float _1088 = fma(_737, _1070, _1078);
    float _1090 = fma(_795, _1070, _1080);
    float _1092 = fma(_799, _1070, _1082);
    float _1094 = fma(_711, _711, _1086);
    float _1096 = _753 * _753;
    float _1098 = fma(_899, _1074, _1088);
    float _1100 = fma(_920, _1074, _1084);
    float _1102 = fma(_910, _1074, _1090);
    float _1104 = fma(_745, _745, _1096);
    float _1106 = fma(_825, _1074, _1092);
    float _1108 = _1094 + 1.0;
    float _1110 = _1104 + 1.0;
    float _1112 = rsqrt(_1108);
    float _1114 = rsqrt(_1110);
    float _1116 = fma(_751, _1112, _577);
    float _1118 = fma(_711, _1112, _569);
    float _1120 = -_1112;
    float _1122 = _573 + _1120;
    float _1124 = fma(_753, _1114, _577);
    float _1126 = fma(_745, _1114, _569);
    float _1128 = -_1114;
    float _1130 = _573 + _1128;
    float _1132 = _687 * _1116;
    float _1134 = _687 * _1124;
    float _1136 = _731 * _1116;
    float _1138 = _789 * _1116;
    float _1140 = _785 * _1116;
    float _1142 = _731 * _1124;
    float _1144 = _789 * _1124;
    float _1146 = _785 * _1124;
    float3 _5198 = float3(_962, _1064, float(int(_908)));
    float3 _5202 = select(_5198, float3(0.0), isnan(_5198));
    float _1148 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5202.xy, uint(rint(_5202.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5202.xy, uint(rint(_5202.z))).x;
    float _1150 = fma(_611, _1118, _1132);
    float _1152 = fma(_611, _1126, _1134);
    float _1154 = fma(_737, _1118, _1136);
    float _1156 = fma(_795, _1118, _1138);
    float _1158 = fma(_799, _1118, _1140);
    float _1160 = _952 + _940;
    float _1162 = fma(_799, _1126, _1146);
    float _1164 = fma(_737, _1126, _1142);
    float _1166 = fma(_920, _1130, _1152);
    float _1168 = fma(_920, _1122, _1150);
    float _1170 = fma(_899, _1122, _1154);
    float _1172 = fma(_910, _1122, _1156);
    float _1174 = fma(_825, _1122, _1158);
    float _1176 = fma(_825, _1130, _1162);
    float _1178 = 1.0 / _1160;
    float _1180 = _952 + _1056;
    float _1182 = _952 + _1106;
    float _1184 = _952 + _970;
    float _1186 = _952 + _1174;
    float _1188 = _952 + _1176;
    float _1190 = fma(_795, _1126, _1144);
    float _1192 = fma(_899, _1130, _1164);
    float _1194 = 1.0 / _1184;
    float _1196 = _992 + _934;
    float _1198 = fma(_910, _1130, _1190);
    float _1200 = _992 + _968;
    float _1202 = _992 + _1050;
    float _1204 = _992 + _1100;
    float _1206 = _992 + _1168;
    float _1208 = _994 + _936;
    float _1210 = 1.0 / _1180;
    float _1212 = _992 + _1166;
    float _1214 = _996 + _938;
    float _1216 = _996 + _1102;
    float _1218 = _996 + _1172;
    float _1220 = _1208 * _1178;
    float _1222 = _996 + _980;
    float _1224 = _1196 * _1178;
    float _1226 = 1.0 / _1182;
    float _1228 = _1214 * _1178;
    float _1230 = _994 + _1052;
    float _1232 = _994 + _1098;
    float _1234 = _994 + _1192;
    float _1236 = _996 + _1054;
    float _1238 = _994 + _978;
    float _1240 = 1.0 / _1188;
    float _1242 = _994 + _1170;
    float _1244 = _996 + _1198;
    float _1246 = _1222 * _1194;
    float _1248 = _1200 * _1194;
    float _1250 = _1202 * _1210;
    float _1252 = _1230 * _1210;
    float _1254 = _1236 * _1210;
    float _1256 = 1.0 / _1186;
    float _1258 = _1204 * _1226;
    float _1260 = _1232 * _1226;
    float _1262 = _1238 * _1194;
    float _1264 = _1216 * _1226;
    float _1266 = fma(_1018, 0.5, 0.5);
    float _1268 = fma(_1020, -0.5, 0.5);
    float _1270 = _1234 * _1240;
    float _1272 = _1212 * _1240;
    float _1274 = _1244 * _1240;
    float _1276 = fma(_1022, 0.5, 0.5);
    float _1278 = fma(_1060, 0.5, 0.5);
    float _1280 = fma(_1062, 0.5, 0.5);
    float _1282 = fma(_1220, -0.5, 0.5);
    float _1284 = fma(_1270, -0.5, 0.5);
    float _1286 = _1206 * _1256;
    float _1288 = _1242 * _1256;
    float _1290 = _1218 * _1256;
    float _1292 = fma(_1066, -0.5, 0.5);
    float _1294 = fma(_1224, 0.5, 0.5);
    float _1296 = fma(_1248, 0.5, 0.5);
    float _1298 = fma(_1228, 0.5, 0.5);
    float _1300 = fma(_1262, -0.5, 0.5);
    float _1302 = fma(_1246, 0.5, 0.5);
    float _1304 = fma(_1250, 0.5, 0.5);
    float _1306 = fma(_1252, -0.5, 0.5);
    float _1308 = fma(_1254, 0.5, 0.5);
    float _1310 = fma(_1258, 0.5, 0.5);
    float _1312 = fma(_1260, -0.5, 0.5);
    float _1314 = fma(_1264, 0.5, 0.5);
    float _1316 = fma(_1286, 0.5, 0.5);
    float _1318 = fma(_1288, -0.5, 0.5);
    float _1320 = fma(_1290, 0.5, 0.5);
    float _1322 = fma(_1272, 0.5, 0.5);
    float _1324 = fma(_1274, 0.5, 0.5);
    float _1326 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _1328 = -_1266;
    float _1330 = _962 + _1328;
    float _1332 = -_1268;
    float _1334 = _1064 + _1332;
    float _1336 = -_1276;
    float _1338 = _960 + _1336;
    float _1340 = -_1278;
    float _1342 = _962 + _1340;
    float _1344 = -_1292;
    float _1346 = _1064 + _1344;
    float _1348 = -_1280;
    float _1350 = _960 + _1348;
    float _1352 = _1330 * _1326;
    float _1354 = _1334 * _1326;
    float _1356 = _1338 * _1326;
    float _1358 = _1342 * _1326;
    float _1360 = _1346 * _1326;
    float _1362 = _1350 * _1326;
    float _1364 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _1366 = -_1294;
    float _1368 = _962 + _1366;
    float _1370 = -_1282;
    float _1372 = _1064 + _1370;
    float _1374 = -_1298;
    float _1376 = _960 + _1374;
    float _1378 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _1380 = -_1300;
    float _1382 = _1064 + _1380;
    float _1384 = -_1302;
    float _1386 = _960 + _1384;
    float _1388 = _1368 * _1364;
    float _1390 = _1372 * _1364;
    float _1392 = _1376 * _1364;
    float _1394 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _1396 = -_1304;
    float _1398 = _962 + _1396;
    float _1400 = -_1306;
    float _1402 = _1064 + _1400;
    float _1404 = -_1308;
    float _1406 = _960 + _1404;
    float _1408 = -_1296;
    float _1410 = _962 + _1408;
    float _1412 = _1382 * _1378;
    float _1414 = _1386 * _1378;
    float _1416 = _1398 * _1394;
    float _1418 = _1402 * _1394;
    float _1420 = _1406 * _1394;
    float _1422 = _1410 * _1378;
    float _1424 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _1426 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _1428 = -_1316;
    float _1430 = _962 + _1428;
    float _1432 = -_1318;
    float _1434 = _1064 + _1432;
    float _1436 = -_1320;
    float _1438 = _960 + _1436;
    float _1440 = -_1312;
    float _1442 = _1064 + _1440;
    float _1444 = _1430 * _1426;
    float _1446 = _1434 * _1426;
    float _1448 = _1438 * _1426;
    float _1450 = _1356 * 1.5;
    float _1452 = -_1310;
    float _1454 = _962 + _1452;
    float _1456 = -_1314;
    float _1458 = _960 + _1456;
    float _1460 = _1442 * _1424;
    float _1462 = _1454 * _1424;
    float _1464 = _1458 * _1424;
    float _1466 = -_1322;
    float _1468 = _962 + _1466;
    float _1470 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _1472 = -_1284;
    float _1474 = _1064 + _1472;
    float _1476 = -_1324;
    float _1478 = _960 + _1476;
    float _1480 = _1468 * _1470;
    float _1482 = _1474 * _1470;
    float _1484 = _1478 * _1470;
    float _1486 = -_960;
    float _1488 = _1486 + _1148;
    float _1490 = _1488 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1492 = precise::max(_1490, _1450);
    float _1494 = precise::min(0.0, _1492);
    bool _1496 = _1494 != _1490;
    bool _1498 = isnan(_1494);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan(_1490);
    bool _1504 = _1500 || _1502;
    bool _1506 = !_1504;
    float _1702;
    if (!_1506)
    {
        float _1508 = _1064 + _1354;
        float _1510 = _962 + _1352;
        float3 _5718 = float3(_1510, _1508, float(int(_908)));
        float3 _5720 = select(_5718, float3(0.0), isnan(_5718));
        float _1512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5720.xy, uint(rint(_5720.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5720.xy, uint(rint(_5720.z))).x;
        float _1514 = _960 + _1356;
        float _1516 = _1356 * 3.0;
        float _1518 = -_1514;
        float _1520 = _1518 + _1512;
        float _1522 = _1520 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1524 = precise::max(_1522, _1516);
        float _1526 = precise::min(0.0, _1524);
        bool _1528 = _1526 != _1522;
        bool _1530 = isnan(_1526);
        bool _1532 = _1528 || _1530;
        bool _1534 = isnan(_1522);
        bool _1536 = _1532 || _1534;
        bool _1538 = !_1536;
        if (!_1538)
        {
            float _1540 = fma(_1354, 2.0, _1064);
            float _1542 = fma(_1352, 2.0, _962);
            float3 _5773 = float3(_1542, _1540, float(int(_908)));
            float3 _5775 = select(_5773, float3(0.0), isnan(_5773));
            float _1544 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5775.xy, uint(rint(_5775.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5775.xy, uint(rint(_5775.z))).x;
            float _1546 = fma(_1356, 2.0, _960);
            float _1548 = _1356 * 4.5;
            float _1550 = -_1546;
            float _1552 = _1550 + _1544;
            float _1554 = _1552 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1556 = precise::max(_1554, _1548);
            float _1558 = precise::min(0.0, _1556);
            bool _1560 = _1558 != _1554;
            bool _1562 = isnan(_1558);
            bool _1564 = _1560 || _1562;
            bool _1566 = isnan(_1554);
            bool _1568 = _1564 || _1566;
            bool _1570 = !_1568;
            if (!_1570)
            {
                float _1572 = fma(_1354, 3.0, _1064);
                float _1574 = fma(_1352, 3.0, _962);
                float3 _5828 = float3(_1574, _1572, float(int(_908)));
                float3 _5830 = select(_5828, float3(0.0), isnan(_5828));
                float _1576 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5830.xy, uint(rint(_5830.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5830.xy, uint(rint(_5830.z))).x;
                float _1578 = _960 + _1516;
                float _1580 = _1356 * 6.0;
                float _1582 = -_1578;
                float _1584 = _1582 + _1576;
                float _1586 = _1584 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1588 = precise::max(_1586, _1580);
                float _1590 = precise::min(0.0, _1588);
                bool _1592 = _1590 != _1586;
                bool _1594 = isnan(_1590);
                bool _1596 = _1592 || _1594;
                bool _1598 = isnan(_1586);
                bool _1600 = _1596 || _1598;
                bool _1602 = !_1600;
                if (!_1602)
                {
                    float _1604 = fma(_1354, 4.0, _1064);
                    float _1606 = fma(_1352, 4.0, _962);
                    float3 _5884 = float3(_1606, _1604, float(int(_908)));
                    float3 _5886 = select(_5884, float3(0.0), isnan(_5884));
                    float _1608 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5886.xy, uint(rint(_5886.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5886.xy, uint(rint(_5886.z))).x;
                    float _1610 = fma(_1356, 4.0, _960);
                    float _1612 = _1356 * 7.5;
                    float _1614 = -_1610;
                    float _1616 = _1614 + _1608;
                    float _1618 = _1616 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1620 = precise::max(_1618, _1612);
                    float _1622 = precise::min(0.0, _1620);
                    bool _1624 = _1622 != _1618;
                    bool _1626 = isnan(_1622);
                    bool _1628 = _1624 || _1626;
                    bool _1630 = isnan(_1618);
                    bool _1632 = _1628 || _1630;
                    bool _1634 = !_1632;
                    if (!_1634)
                    {
                        float _1636 = fma(_1354, 5.0, _1064);
                        float _1638 = fma(_1352, 5.0, _962);
                        float3 _5940 = float3(_1638, _1636, float(int(_908)));
                        float3 _5942 = select(_5940, float3(0.0), isnan(_5940));
                        float _1640 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5942.xy, uint(rint(_5942.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5942.xy, uint(rint(_5942.z))).x;
                        float _1642 = fma(_1356, 5.0, _960);
                        float _1644 = fma(_1356, 9.0, -1.0);
                        float _1646 = -_1642;
                        float _1648 = _1646 + _1640;
                        float _1650 = _1648 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1652 = precise::max(_1650, _1644);
                        float _1654 = precise::min(0.0, _1652);
                        bool _1656 = _1654 != _1650;
                        bool _1658 = isnan(_1654);
                        bool _1660 = _1656 || _1658;
                        bool _1662 = isnan(_1650);
                        bool _1664 = _1660 || _1662;
                        bool _1666 = !_1664;
                        if (!_1666)
                        {
                            float _1668 = fma(_1352, 6.0, _962);
                            float _1670 = fma(_1354, 6.0, _1064);
                            float3 _5995 = float3(_1668, _1670, float(int(_908)));
                            float3 _5997 = select(_5995, float3(0.0), isnan(_5995));
                            float _1672 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5997.xy, uint(rint(_5997.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5997.xy, uint(rint(_5997.z))).x;
                            float _1674 = _960 + _1580;
                            float _1676 = fma(_1356, 10.5, -1.0);
                            float _1678 = -_1674;
                            float _1680 = _1678 + _1672;
                            float _1682 = _1680 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1684 = precise::max(_1682, _1676);
                            float _1686 = precise::min(0.0, _1684);
                            bool _1688 = _1686 != _1682;
                            bool _1690 = isnan(_1686);
                            bool _1692 = _1688 || _1690;
                            bool _1694 = isnan(_1682);
                            bool _1696 = _1692 || _1694;
                            float _1698 = _1686;
                            if (_1696)
                            {
                                _1698 = 0.0;
                            }
                            float _1700 = _1698;
                            _1702 = _1700;
                            _1704 = _1696;
                        }
                    }
                }
            }
        }
    }
    if (!_1704)
    {
        _1702 = 1.0;
    }
    _1704 = false;
    float _1706 = _1702;
    float _1708 = _1362 * 1.5;
    float _1710 = precise::max(_1490, _1708);
    float _1712 = precise::min(0.0, _1710);
    bool _1714 = _1712 != _1490;
    bool _1716 = isnan(_1712);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan(_1490);
    bool _1722 = _1718 || _1720;
    bool _1724 = !_1722;
    float _1726 = _1706;
    if (!_1724)
    {
        float _1728 = _1064 + _1360;
        float _1730 = _962 + _1358;
        float3 _6089 = float3(_1730, _1728, float(int(_908)));
        float3 _6091 = select(_6089, float3(0.0), isnan(_6089));
        float _1732 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6091.xy, uint(rint(_6091.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6091.xy, uint(rint(_6091.z))).x;
        float _1734 = _960 + _1362;
        float _1736 = _1362 * 3.0;
        float _1738 = -_1734;
        float _1740 = _1738 + _1732;
        float _1742 = _1740 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1744 = precise::max(_1742, _1736);
        float _1746 = precise::min(0.0, _1744);
        bool _1748 = _1746 != _1742;
        bool _1750 = isnan(_1746);
        bool _1752 = _1748 || _1750;
        bool _1754 = isnan(_1742);
        bool _1756 = _1752 || _1754;
        bool _1758 = !_1756;
        if (!_1758)
        {
            float _1760 = fma(_1360, 2.0, _1064);
            float _1762 = fma(_1358, 2.0, _962);
            float3 _6143 = float3(_1762, _1760, float(int(_908)));
            float3 _6145 = select(_6143, float3(0.0), isnan(_6143));
            float _1764 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6145.xy, uint(rint(_6145.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6145.xy, uint(rint(_6145.z))).x;
            float _1766 = fma(_1362, 2.0, _960);
            float _1768 = _1362 * 4.5;
            float _1770 = -_1766;
            float _1772 = _1770 + _1764;
            float _1774 = _1772 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1776 = precise::max(_1774, _1768);
            float _1778 = precise::min(0.0, _1776);
            bool _1780 = _1778 != _1774;
            bool _1782 = isnan(_1778);
            bool _1784 = _1780 || _1782;
            bool _1786 = isnan(_1774);
            bool _1788 = _1784 || _1786;
            bool _1790 = !_1788;
            if (!_1790)
            {
                float _1792 = fma(_1360, 3.0, _1064);
                float _1794 = fma(_1358, 3.0, _962);
                float3 _6197 = float3(_1794, _1792, float(int(_908)));
                float3 _6199 = select(_6197, float3(0.0), isnan(_6197));
                float _1796 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6199.xy, uint(rint(_6199.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6199.xy, uint(rint(_6199.z))).x;
                float _1798 = _960 + _1736;
                float _1800 = _1362 * 6.0;
                float _1802 = -_1798;
                float _1804 = _1802 + _1796;
                float _1806 = _1804 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1808 = precise::max(_1806, _1800);
                float _1810 = precise::min(0.0, _1808);
                bool _1812 = _1810 != _1806;
                bool _1814 = isnan(_1810);
                bool _1816 = _1812 || _1814;
                bool _1818 = isnan(_1806);
                bool _1820 = _1816 || _1818;
                bool _1822 = !_1820;
                if (!_1822)
                {
                    float _1824 = fma(_1360, 4.0, _1064);
                    float _1826 = fma(_1358, 4.0, _962);
                    float3 _6251 = float3(_1826, _1824, float(int(_908)));
                    float3 _6253 = select(_6251, float3(0.0), isnan(_6251));
                    float _1828 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6253.xy, uint(rint(_6253.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6253.xy, uint(rint(_6253.z))).x;
                    float _1830 = fma(_1362, 4.0, _960);
                    float _1832 = _1362 * 7.5;
                    float _1834 = -_1830;
                    float _1836 = _1834 + _1828;
                    float _1838 = _1836 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1840 = precise::max(_1838, _1832);
                    float _1842 = precise::min(0.0, _1840);
                    bool _1844 = _1842 != _1838;
                    bool _1846 = isnan(_1842);
                    bool _1848 = _1844 || _1846;
                    bool _1850 = isnan(_1838);
                    bool _1852 = _1848 || _1850;
                    bool _1854 = !_1852;
                    if (!_1854)
                    {
                        float _1856 = fma(_1360, 5.0, _1064);
                        float _1858 = fma(_1358, 5.0, _962);
                        float3 _6305 = float3(_1858, _1856, float(int(_908)));
                        float3 _6307 = select(_6305, float3(0.0), isnan(_6305));
                        float _1860 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6307.xy, uint(rint(_6307.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6307.xy, uint(rint(_6307.z))).x;
                        float _1862 = fma(_1362, 5.0, _960);
                        float _1864 = fma(_1362, 9.0, -1.0);
                        float _1866 = -_1862;
                        float _1868 = _1866 + _1860;
                        float _1870 = _1868 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1872 = precise::max(_1870, _1864);
                        float _1874 = precise::min(0.0, _1872);
                        bool _1876 = _1874 != _1870;
                        bool _1878 = isnan(_1874);
                        bool _1880 = _1876 || _1878;
                        bool _1882 = isnan(_1870);
                        bool _1884 = _1880 || _1882;
                        bool _1886 = !_1884;
                        if (!_1886)
                        {
                            float _1888 = fma(_1360, 6.0, _1064);
                            float _1890 = fma(_1358, 6.0, _962);
                            float3 _6359 = float3(_1890, _1888, float(int(_908)));
                            float3 _6361 = select(_6359, float3(0.0), isnan(_6359));
                            float _1892 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6361.xy, uint(rint(_6361.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6361.xy, uint(rint(_6361.z))).x;
                            float _1894 = _960 + _1800;
                            float _1896 = fma(_1362, 10.5, -1.0);
                            float _1898 = -_1894;
                            float _1900 = _1898 + _1892;
                            float _1902 = _1900 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1904 = precise::max(_1902, _1896);
                            float _1906 = precise::min(0.0, _1904);
                            bool _1908 = _1906 != _1902;
                            bool _1910 = isnan(_1906);
                            bool _1912 = _1908 || _1910;
                            bool _1914 = isnan(_1902);
                            bool _1916 = _1912 || _1914;
                            _1918 = _1916;
                        }
                    }
                }
            }
        }
    }
    if (!_1918)
    {
        float _1920 = _1706 + 1.0;
        _1726 = _1920;
    }
    _1918 = false;
    float _1922 = _1726;
    float _1924 = _1392 * 1.5;
    float _1926 = precise::max(_1490, _1924);
    float _1928 = precise::min(0.0, _1926);
    bool _1930 = _1928 != _1490;
    bool _1932 = isnan(_1928);
    bool _1934 = _1930 || _1932;
    bool _1936 = isnan(_1490);
    bool _1938 = _1934 || _1936;
    bool _1940 = !_1938;
    float _1942 = _1922;
    if (!_1940)
    {
        float _1944 = _1064 + _1390;
        float _1946 = _962 + _1388;
        float3 _6449 = float3(_1946, _1944, float(int(_908)));
        float3 _6451 = select(_6449, float3(0.0), isnan(_6449));
        float _1948 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6451.xy, uint(rint(_6451.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6451.xy, uint(rint(_6451.z))).x;
        float _1950 = _960 + _1392;
        float _1952 = _1392 * 3.0;
        float _1954 = -_1950;
        float _1956 = _1954 + _1948;
        float _1958 = _1956 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1960 = precise::max(_1958, _1952);
        float _1962 = precise::min(0.0, _1960);
        bool _1964 = _1962 != _1958;
        bool _1966 = isnan(_1962);
        bool _1968 = _1964 || _1966;
        bool _1970 = isnan(_1958);
        bool _1972 = _1968 || _1970;
        bool _1974 = !_1972;
        if (!_1974)
        {
            float _1976 = fma(_1390, 2.0, _1064);
            float _1978 = fma(_1388, 2.0, _962);
            float3 _6503 = float3(_1978, _1976, float(int(_908)));
            float3 _6505 = select(_6503, float3(0.0), isnan(_6503));
            float _1980 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6505.xy, uint(rint(_6505.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6505.xy, uint(rint(_6505.z))).x;
            float _1982 = fma(_1392, 2.0, _960);
            float _1984 = _1392 * 4.5;
            float _1986 = -_1982;
            float _1988 = _1986 + _1980;
            float _1990 = _1988 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1992 = precise::max(_1990, _1984);
            float _1994 = precise::min(0.0, _1992);
            bool _1996 = _1994 != _1990;
            bool _1998 = isnan(_1994);
            bool _2000 = _1996 || _1998;
            bool _2002 = isnan(_1990);
            bool _2004 = _2000 || _2002;
            bool _2006 = !_2004;
            if (!_2006)
            {
                float _2008 = fma(_1390, 3.0, _1064);
                float _2010 = fma(_1388, 3.0, _962);
                float3 _6557 = float3(_2010, _2008, float(int(_908)));
                float3 _6559 = select(_6557, float3(0.0), isnan(_6557));
                float _2012 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6559.xy, uint(rint(_6559.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6559.xy, uint(rint(_6559.z))).x;
                float _2014 = _960 + _1952;
                float _2016 = _1392 * 6.0;
                float _2018 = -_2014;
                float _2020 = _2018 + _2012;
                float _2022 = _2020 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2024 = precise::max(_2022, _2016);
                float _2026 = precise::min(0.0, _2024);
                bool _2028 = _2026 != _2022;
                bool _2030 = isnan(_2026);
                bool _2032 = _2028 || _2030;
                bool _2034 = isnan(_2022);
                bool _2036 = _2032 || _2034;
                bool _2038 = !_2036;
                if (!_2038)
                {
                    float _2040 = fma(_1390, 4.0, _1064);
                    float _2042 = fma(_1388, 4.0, _962);
                    float3 _6611 = float3(_2042, _2040, float(int(_908)));
                    float3 _6613 = select(_6611, float3(0.0), isnan(_6611));
                    float _2044 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6613.xy, uint(rint(_6613.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6613.xy, uint(rint(_6613.z))).x;
                    float _2046 = fma(_1392, 4.0, _960);
                    float _2048 = _1392 * 7.5;
                    float _2050 = -_2046;
                    float _2052 = _2050 + _2044;
                    float _2054 = _2052 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2056 = precise::max(_2054, _2048);
                    float _2058 = precise::min(0.0, _2056);
                    bool _2060 = _2058 != _2054;
                    bool _2062 = isnan(_2058);
                    bool _2064 = _2060 || _2062;
                    bool _2066 = isnan(_2054);
                    bool _2068 = _2064 || _2066;
                    bool _2070 = !_2068;
                    if (!_2070)
                    {
                        float _2072 = fma(_1390, 5.0, _1064);
                        float _2074 = fma(_1388, 5.0, _962);
                        float3 _6665 = float3(_2074, _2072, float(int(_908)));
                        float3 _6667 = select(_6665, float3(0.0), isnan(_6665));
                        float _2076 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6667.xy, uint(rint(_6667.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6667.xy, uint(rint(_6667.z))).x;
                        float _2078 = fma(_1392, 5.0, _960);
                        float _2080 = fma(_1392, 9.0, -1.0);
                        float _2082 = -_2078;
                        float _2084 = _2082 + _2076;
                        float _2086 = _2084 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2088 = precise::max(_2086, _2080);
                        float _2090 = precise::min(0.0, _2088);
                        bool _2092 = _2090 != _2086;
                        bool _2094 = isnan(_2090);
                        bool _2096 = _2092 || _2094;
                        bool _2098 = isnan(_2086);
                        bool _2100 = _2096 || _2098;
                        bool _2102 = !_2100;
                        if (!_2102)
                        {
                            float _2104 = fma(_1390, 6.0, _1064);
                            float _2106 = fma(_1388, 6.0, _962);
                            float3 _6719 = float3(_2106, _2104, float(int(_908)));
                            float3 _6721 = select(_6719, float3(0.0), isnan(_6719));
                            float _2108 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6721.xy, uint(rint(_6721.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6721.xy, uint(rint(_6721.z))).x;
                            float _2110 = _960 + _2016;
                            float _2112 = fma(_1392, 10.5, -1.0);
                            float _2114 = -_2110;
                            float _2116 = _2114 + _2108;
                            float _2118 = _2116 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2120 = precise::max(_2118, _2112);
                            float _2122 = precise::min(0.0, _2120);
                            bool _2124 = _2122 != _2118;
                            bool _2126 = isnan(_2122);
                            bool _2128 = _2124 || _2126;
                            bool _2130 = isnan(_2118);
                            bool _2132 = _2128 || _2130;
                            _2134 = _2132;
                        }
                    }
                }
            }
        }
    }
    if (!_2134)
    {
        float _2136 = _1922 + 1.0;
        _1942 = _2136;
    }
    _2134 = false;
    float _2138 = _1942;
    float _2140 = _1414 * 1.5;
    float _2142 = precise::max(_1490, _2140);
    float _2144 = precise::min(0.0, _2142);
    bool _2146 = _2144 != _1490;
    bool _2148 = isnan(_2144);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan(_1490);
    bool _2154 = _2150 || _2152;
    bool _2156 = !_2154;
    float _2158 = _2138;
    if (!_2156)
    {
        float _2160 = _1064 + _1412;
        float _2162 = _962 + _1422;
        float3 _6809 = float3(_2162, _2160, float(int(_908)));
        float3 _6811 = select(_6809, float3(0.0), isnan(_6809));
        float _2164 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6811.xy, uint(rint(_6811.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6811.xy, uint(rint(_6811.z))).x;
        float _2166 = _960 + _1414;
        float _2168 = _1414 * 3.0;
        float _2170 = -_2166;
        float _2172 = _2170 + _2164;
        float _2174 = _2172 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2176 = precise::max(_2174, _2168);
        float _2178 = precise::min(0.0, _2176);
        bool _2180 = _2178 != _2174;
        bool _2182 = isnan(_2178);
        bool _2184 = _2180 || _2182;
        bool _2186 = isnan(_2174);
        bool _2188 = _2184 || _2186;
        bool _2190 = !_2188;
        if (!_2190)
        {
            float _2192 = fma(_1412, 2.0, _1064);
            float _2194 = fma(_1422, 2.0, _962);
            float3 _6863 = float3(_2194, _2192, float(int(_908)));
            float3 _6865 = select(_6863, float3(0.0), isnan(_6863));
            float _2196 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6865.xy, uint(rint(_6865.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6865.xy, uint(rint(_6865.z))).x;
            float _2198 = fma(_1414, 2.0, _960);
            float _2200 = _1414 * 4.5;
            float _2202 = -_2198;
            float _2204 = _2202 + _2196;
            float _2206 = _2204 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2208 = precise::max(_2206, _2200);
            float _2210 = precise::min(0.0, _2208);
            bool _2212 = _2210 != _2206;
            bool _2214 = isnan(_2210);
            bool _2216 = _2212 || _2214;
            bool _2218 = isnan(_2206);
            bool _2220 = _2216 || _2218;
            bool _2222 = !_2220;
            if (!_2222)
            {
                float _2224 = fma(_1412, 3.0, _1064);
                float _2226 = fma(_1422, 3.0, _962);
                float3 _6917 = float3(_2226, _2224, float(int(_908)));
                float3 _6919 = select(_6917, float3(0.0), isnan(_6917));
                float _2228 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6919.xy, uint(rint(_6919.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6919.xy, uint(rint(_6919.z))).x;
                float _2230 = _960 + _2168;
                float _2232 = _1414 * 6.0;
                float _2234 = -_2230;
                float _2236 = _2234 + _2228;
                float _2238 = _2236 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2240 = precise::max(_2238, _2232);
                float _2242 = precise::min(0.0, _2240);
                bool _2244 = _2242 != _2238;
                bool _2246 = isnan(_2242);
                bool _2248 = _2244 || _2246;
                bool _2250 = isnan(_2238);
                bool _2252 = _2248 || _2250;
                bool _2254 = !_2252;
                if (!_2254)
                {
                    float _2256 = fma(_1412, 4.0, _1064);
                    float _2258 = fma(_1422, 4.0, _962);
                    float3 _6971 = float3(_2258, _2256, float(int(_908)));
                    float3 _6973 = select(_6971, float3(0.0), isnan(_6971));
                    float _2260 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6973.xy, uint(rint(_6973.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6973.xy, uint(rint(_6973.z))).x;
                    float _2262 = fma(_1414, 4.0, _960);
                    float _2264 = _1414 * 7.5;
                    float _2266 = -_2262;
                    float _2268 = _2266 + _2260;
                    float _2270 = _2268 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2272 = precise::max(_2270, _2264);
                    float _2274 = precise::min(0.0, _2272);
                    bool _2276 = _2274 != _2270;
                    bool _2278 = isnan(_2274);
                    bool _2280 = _2276 || _2278;
                    bool _2282 = isnan(_2270);
                    bool _2284 = _2280 || _2282;
                    bool _2286 = !_2284;
                    if (!_2286)
                    {
                        float _2288 = fma(_1412, 5.0, _1064);
                        float _2290 = fma(_1422, 5.0, _962);
                        float3 _7025 = float3(_2290, _2288, float(int(_908)));
                        float3 _7027 = select(_7025, float3(0.0), isnan(_7025));
                        float _2292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7027.xy, uint(rint(_7027.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7027.xy, uint(rint(_7027.z))).x;
                        float _2294 = fma(_1414, 5.0, _960);
                        float _2296 = fma(_1414, 9.0, -1.0);
                        float _2298 = -_2294;
                        float _2300 = _2298 + _2292;
                        float _2302 = _2300 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2304 = precise::max(_2302, _2296);
                        float _2306 = precise::min(0.0, _2304);
                        bool _2308 = _2306 != _2302;
                        bool _2310 = isnan(_2306);
                        bool _2312 = _2308 || _2310;
                        bool _2314 = isnan(_2302);
                        bool _2316 = _2312 || _2314;
                        bool _2318 = !_2316;
                        if (!_2318)
                        {
                            float _2320 = fma(_1412, 6.0, _1064);
                            float _2322 = fma(_1422, 6.0, _962);
                            float3 _7079 = float3(_2322, _2320, float(int(_908)));
                            float3 _7081 = select(_7079, float3(0.0), isnan(_7079));
                            float _2324 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7081.xy, uint(rint(_7081.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7081.xy, uint(rint(_7081.z))).x;
                            float _2326 = _960 + _2232;
                            float _2328 = fma(_1414, 10.5, -1.0);
                            float _2330 = -_2326;
                            float _2332 = _2330 + _2324;
                            float _2334 = _2332 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2336 = precise::max(_2334, _2328);
                            float _2338 = precise::min(0.0, _2336);
                            bool _2340 = _2338 != _2334;
                            bool _2342 = isnan(_2338);
                            bool _2344 = _2340 || _2342;
                            bool _2346 = isnan(_2334);
                            bool _2348 = _2344 || _2346;
                            _2350 = _2348;
                        }
                    }
                }
            }
        }
    }
    if (!_2350)
    {
        float _2352 = _2138 + 1.0;
        _2158 = _2352;
    }
    _2350 = false;
    float _2354 = _2158;
    float _2356 = _1420 * 1.5;
    float _2358 = precise::max(_1490, _2356);
    float _2360 = precise::min(0.0, _2358);
    bool _2362 = _2360 != _1490;
    bool _2364 = isnan(_2360);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan(_1490);
    bool _2370 = _2366 || _2368;
    bool _2372 = !_2370;
    float _2374 = _2354;
    if (!_2372)
    {
        float _2376 = _1064 + _1418;
        float _2378 = _962 + _1416;
        float3 _7169 = float3(_2378, _2376, float(int(_908)));
        float3 _7171 = select(_7169, float3(0.0), isnan(_7169));
        float _2380 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7171.xy, uint(rint(_7171.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7171.xy, uint(rint(_7171.z))).x;
        float _2382 = _960 + _1420;
        float _2384 = _1420 * 3.0;
        float _2386 = -_2382;
        float _2388 = _2386 + _2380;
        float _2390 = _2388 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2392 = precise::max(_2390, _2384);
        float _2394 = precise::min(0.0, _2392);
        bool _2396 = _2394 != _2390;
        bool _2398 = isnan(_2394);
        bool _2400 = _2396 || _2398;
        bool _2402 = isnan(_2390);
        bool _2404 = _2400 || _2402;
        bool _2406 = !_2404;
        if (!_2406)
        {
            float _2408 = fma(_1418, 2.0, _1064);
            float _2410 = fma(_1416, 2.0, _962);
            float3 _7223 = float3(_2410, _2408, float(int(_908)));
            float3 _7225 = select(_7223, float3(0.0), isnan(_7223));
            float _2412 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7225.xy, uint(rint(_7225.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7225.xy, uint(rint(_7225.z))).x;
            float _2414 = fma(_1420, 2.0, _960);
            float _2416 = _1420 * 4.5;
            float _2418 = -_2414;
            float _2420 = _2418 + _2412;
            float _2422 = _2420 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2424 = precise::max(_2422, _2416);
            float _2426 = precise::min(0.0, _2424);
            bool _2428 = _2426 != _2422;
            bool _2430 = isnan(_2426);
            bool _2432 = _2428 || _2430;
            bool _2434 = isnan(_2422);
            bool _2436 = _2432 || _2434;
            bool _2438 = !_2436;
            if (!_2438)
            {
                float _2440 = fma(_1418, 3.0, _1064);
                float _2442 = fma(_1416, 3.0, _962);
                float3 _7277 = float3(_2442, _2440, float(int(_908)));
                float3 _7279 = select(_7277, float3(0.0), isnan(_7277));
                float _2444 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7279.xy, uint(rint(_7279.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7279.xy, uint(rint(_7279.z))).x;
                float _2446 = _960 + _2384;
                float _2448 = _1420 * 6.0;
                float _2450 = -_2446;
                float _2452 = _2450 + _2444;
                float _2454 = _2452 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2456 = precise::max(_2454, _2448);
                float _2458 = precise::min(0.0, _2456);
                bool _2460 = _2458 != _2454;
                bool _2462 = isnan(_2458);
                bool _2464 = _2460 || _2462;
                bool _2466 = isnan(_2454);
                bool _2468 = _2464 || _2466;
                bool _2470 = !_2468;
                if (!_2470)
                {
                    float _2472 = fma(_1418, 4.0, _1064);
                    float _2474 = fma(_1416, 4.0, _962);
                    float3 _7331 = float3(_2474, _2472, float(int(_908)));
                    float3 _7333 = select(_7331, float3(0.0), isnan(_7331));
                    float _2476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7333.xy, uint(rint(_7333.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7333.xy, uint(rint(_7333.z))).x;
                    float _2478 = fma(_1420, 4.0, _960);
                    float _2480 = _1420 * 7.5;
                    float _2482 = -_2478;
                    float _2484 = _2482 + _2476;
                    float _2486 = _2484 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2488 = precise::max(_2486, _2480);
                    float _2490 = precise::min(0.0, _2488);
                    bool _2492 = _2490 != _2486;
                    bool _2494 = isnan(_2490);
                    bool _2496 = _2492 || _2494;
                    bool _2498 = isnan(_2486);
                    bool _2500 = _2496 || _2498;
                    bool _2502 = !_2500;
                    if (!_2502)
                    {
                        float _2504 = fma(_1418, 5.0, _1064);
                        float _2506 = fma(_1416, 5.0, _962);
                        float3 _7385 = float3(_2506, _2504, float(int(_908)));
                        float3 _7387 = select(_7385, float3(0.0), isnan(_7385));
                        float _2508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7387.xy, uint(rint(_7387.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7387.xy, uint(rint(_7387.z))).x;
                        float _2510 = fma(_1420, 5.0, _960);
                        float _2512 = fma(_1420, 9.0, -1.0);
                        float _2514 = -_2510;
                        float _2516 = _2514 + _2508;
                        float _2518 = _2516 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2520 = precise::max(_2518, _2512);
                        float _2522 = precise::min(0.0, _2520);
                        bool _2524 = _2522 != _2518;
                        bool _2526 = isnan(_2522);
                        bool _2528 = _2524 || _2526;
                        bool _2530 = isnan(_2518);
                        bool _2532 = _2528 || _2530;
                        bool _2534 = !_2532;
                        if (!_2534)
                        {
                            float _2536 = fma(_1418, 6.0, _1064);
                            float _2538 = fma(_1416, 6.0, _962);
                            float3 _7439 = float3(_2538, _2536, float(int(_908)));
                            float3 _7441 = select(_7439, float3(0.0), isnan(_7439));
                            float _2540 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7441.xy, uint(rint(_7441.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7441.xy, uint(rint(_7441.z))).x;
                            float _2542 = _960 + _2448;
                            float _2544 = fma(_1420, 10.5, -1.0);
                            float _2546 = -_2542;
                            float _2548 = _2546 + _2540;
                            float _2550 = _2548 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2552 = precise::max(_2550, _2544);
                            float _2554 = precise::min(0.0, _2552);
                            bool _2556 = _2554 != _2550;
                            bool _2558 = isnan(_2554);
                            bool _2560 = _2556 || _2558;
                            bool _2562 = isnan(_2550);
                            bool _2564 = _2560 || _2562;
                            _2566 = _2564;
                        }
                    }
                }
            }
        }
    }
    if (!_2566)
    {
        float _2568 = _2354 + 1.0;
        _2374 = _2568;
    }
    _2566 = false;
    float _2570 = _2374;
    float _2572 = _1464 * 1.5;
    float _2574 = precise::max(_1490, _2572);
    float _2576 = precise::min(0.0, _2574);
    bool _2578 = _2576 != _1490;
    bool _2580 = isnan(_2576);
    bool _2582 = _2578 || _2580;
    bool _2584 = isnan(_1490);
    bool _2586 = _2582 || _2584;
    bool _2588 = !_2586;
    float _2590 = _2570;
    if (!_2588)
    {
        float _2592 = _1064 + _1460;
        float _2594 = _962 + _1462;
        float3 _7529 = float3(_2594, _2592, float(int(_908)));
        float3 _7531 = select(_7529, float3(0.0), isnan(_7529));
        float _2596 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7531.xy, uint(rint(_7531.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7531.xy, uint(rint(_7531.z))).x;
        float _2598 = _960 + _1464;
        float _2600 = _1464 * 3.0;
        float _2602 = -_2598;
        float _2604 = _2602 + _2596;
        float _2606 = _2604 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2608 = precise::max(_2606, _2600);
        float _2610 = precise::min(0.0, _2608);
        bool _2612 = _2610 != _2606;
        bool _2614 = isnan(_2610);
        bool _2616 = _2612 || _2614;
        bool _2618 = isnan(_2606);
        bool _2620 = _2616 || _2618;
        bool _2622 = !_2620;
        if (!_2622)
        {
            float _2624 = fma(_1460, 2.0, _1064);
            float _2626 = fma(_1462, 2.0, _962);
            float3 _7583 = float3(_2626, _2624, float(int(_908)));
            float3 _7585 = select(_7583, float3(0.0), isnan(_7583));
            float _2628 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7585.xy, uint(rint(_7585.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7585.xy, uint(rint(_7585.z))).x;
            float _2630 = fma(_1464, 2.0, _960);
            float _2632 = _1464 * 4.5;
            float _2634 = -_2630;
            float _2636 = _2634 + _2628;
            float _2638 = _2636 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2640 = precise::max(_2638, _2632);
            float _2642 = precise::min(0.0, _2640);
            bool _2644 = _2642 != _2638;
            bool _2646 = isnan(_2642);
            bool _2648 = _2644 || _2646;
            bool _2650 = isnan(_2638);
            bool _2652 = _2648 || _2650;
            bool _2654 = !_2652;
            if (!_2654)
            {
                float _2656 = fma(_1460, 3.0, _1064);
                float _2658 = fma(_1462, 3.0, _962);
                float3 _7637 = float3(_2658, _2656, float(int(_908)));
                float3 _7639 = select(_7637, float3(0.0), isnan(_7637));
                float _2660 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7639.xy, uint(rint(_7639.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7639.xy, uint(rint(_7639.z))).x;
                float _2662 = _960 + _2600;
                float _2664 = _1464 * 6.0;
                float _2666 = -_2662;
                float _2668 = _2666 + _2660;
                float _2670 = _2668 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2672 = precise::max(_2670, _2664);
                float _2674 = precise::min(0.0, _2672);
                bool _2676 = _2674 != _2670;
                bool _2678 = isnan(_2674);
                bool _2680 = _2676 || _2678;
                bool _2682 = isnan(_2670);
                bool _2684 = _2680 || _2682;
                bool _2686 = !_2684;
                if (!_2686)
                {
                    float _2688 = fma(_1460, 4.0, _1064);
                    float _2690 = fma(_1462, 4.0, _962);
                    float3 _7691 = float3(_2690, _2688, float(int(_908)));
                    float3 _7693 = select(_7691, float3(0.0), isnan(_7691));
                    float _2692 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7693.xy, uint(rint(_7693.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7693.xy, uint(rint(_7693.z))).x;
                    float _2694 = fma(_1464, 4.0, _960);
                    float _2696 = _1464 * 7.5;
                    float _2698 = -_2694;
                    float _2700 = _2698 + _2692;
                    float _2702 = _2700 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2704 = precise::max(_2702, _2696);
                    float _2706 = precise::min(0.0, _2704);
                    bool _2708 = _2706 != _2702;
                    bool _2710 = isnan(_2706);
                    bool _2712 = _2708 || _2710;
                    bool _2714 = isnan(_2702);
                    bool _2716 = _2712 || _2714;
                    bool _2718 = !_2716;
                    if (!_2718)
                    {
                        float _2720 = fma(_1460, 5.0, _1064);
                        float _2722 = fma(_1462, 5.0, _962);
                        float3 _7745 = float3(_2722, _2720, float(int(_908)));
                        float3 _7747 = select(_7745, float3(0.0), isnan(_7745));
                        float _2724 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7747.xy, uint(rint(_7747.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7747.xy, uint(rint(_7747.z))).x;
                        float _2726 = fma(_1464, 5.0, _960);
                        float _2728 = fma(_1464, 9.0, -1.0);
                        float _2730 = -_2726;
                        float _2732 = _2730 + _2724;
                        float _2734 = _2732 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2736 = precise::max(_2734, _2728);
                        float _2738 = precise::min(0.0, _2736);
                        bool _2740 = _2738 != _2734;
                        bool _2742 = isnan(_2738);
                        bool _2744 = _2740 || _2742;
                        bool _2746 = isnan(_2734);
                        bool _2748 = _2744 || _2746;
                        bool _2750 = !_2748;
                        if (!_2750)
                        {
                            float _2752 = fma(_1460, 6.0, _1064);
                            float _2754 = fma(_1462, 6.0, _962);
                            float3 _7799 = float3(_2754, _2752, float(int(_908)));
                            float3 _7801 = select(_7799, float3(0.0), isnan(_7799));
                            float _2756 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7801.xy, uint(rint(_7801.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7801.xy, uint(rint(_7801.z))).x;
                            float _2758 = _960 + _2664;
                            float _2760 = fma(_1464, 10.5, -1.0);
                            float _2762 = -_2758;
                            float _2764 = _2762 + _2756;
                            float _2766 = _2764 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2768 = precise::max(_2766, _2760);
                            float _2770 = precise::min(0.0, _2768);
                            bool _2772 = _2770 != _2766;
                            bool _2774 = isnan(_2770);
                            bool _2776 = _2772 || _2774;
                            bool _2778 = isnan(_2766);
                            bool _2780 = _2776 || _2778;
                            _2782 = _2780;
                        }
                    }
                }
            }
        }
    }
    if (!_2782)
    {
        float _2784 = _2570 + 1.0;
        _2590 = _2784;
    }
    _2782 = false;
    float _2786 = _2590;
    float _2788 = _1448 * 1.5;
    float _2790 = precise::max(_1490, _2788);
    float _2792 = precise::min(0.0, _2790);
    bool _2794 = _2792 != _1490;
    bool _2796 = isnan(_2792);
    bool _2798 = _2794 || _2796;
    bool _2800 = isnan(_1490);
    bool _2802 = _2798 || _2800;
    bool _2804 = !_2802;
    float _2806 = _2786;
    if (!_2804)
    {
        float _2808 = _1064 + _1446;
        float _2810 = _962 + _1444;
        float3 _7889 = float3(_2810, _2808, float(int(_908)));
        float3 _7891 = select(_7889, float3(0.0), isnan(_7889));
        float _2812 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7891.xy, uint(rint(_7891.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7891.xy, uint(rint(_7891.z))).x;
        float _2814 = _960 + _1448;
        float _2816 = _1448 * 3.0;
        float _2818 = -_2814;
        float _2820 = _2818 + _2812;
        float _2822 = _2820 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2824 = precise::max(_2822, _2816);
        float _2826 = precise::min(0.0, _2824);
        bool _2828 = _2826 != _2822;
        bool _2830 = isnan(_2826);
        bool _2832 = _2828 || _2830;
        bool _2834 = isnan(_2822);
        bool _2836 = _2832 || _2834;
        bool _2838 = !_2836;
        if (!_2838)
        {
            float _2840 = fma(_1446, 2.0, _1064);
            float _2842 = fma(_1444, 2.0, _962);
            float3 _7943 = float3(_2842, _2840, float(int(_908)));
            float3 _7945 = select(_7943, float3(0.0), isnan(_7943));
            float _2844 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7945.xy, uint(rint(_7945.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7945.xy, uint(rint(_7945.z))).x;
            float _2846 = fma(_1448, 2.0, _960);
            float _2848 = _1448 * 4.5;
            float _2850 = -_2846;
            float _2852 = _2850 + _2844;
            float _2854 = _2852 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2856 = precise::max(_2854, _2848);
            float _2858 = precise::min(0.0, _2856);
            bool _2860 = _2858 != _2854;
            bool _2862 = isnan(_2858);
            bool _2864 = _2860 || _2862;
            bool _2866 = isnan(_2854);
            bool _2868 = _2864 || _2866;
            bool _2870 = !_2868;
            if (!_2870)
            {
                float _2872 = fma(_1446, 3.0, _1064);
                float _2874 = fma(_1444, 3.0, _962);
                float3 _7997 = float3(_2874, _2872, float(int(_908)));
                float3 _7999 = select(_7997, float3(0.0), isnan(_7997));
                float _2876 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7999.xy, uint(rint(_7999.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7999.xy, uint(rint(_7999.z))).x;
                float _2878 = _960 + _2816;
                float _2880 = _1448 * 6.0;
                float _2882 = -_2878;
                float _2884 = _2882 + _2876;
                float _2886 = _2884 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2888 = precise::max(_2886, _2880);
                float _2890 = precise::min(0.0, _2888);
                bool _2892 = _2890 != _2886;
                bool _2894 = isnan(_2890);
                bool _2896 = _2892 || _2894;
                bool _2898 = isnan(_2886);
                bool _2900 = _2896 || _2898;
                bool _2902 = !_2900;
                if (!_2902)
                {
                    float _2904 = fma(_1446, 4.0, _1064);
                    float _2906 = fma(_1444, 4.0, _962);
                    float3 _8051 = float3(_2906, _2904, float(int(_908)));
                    float3 _8053 = select(_8051, float3(0.0), isnan(_8051));
                    float _2908 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8053.xy, uint(rint(_8053.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8053.xy, uint(rint(_8053.z))).x;
                    float _2910 = fma(_1448, 4.0, _960);
                    float _2912 = _1448 * 7.5;
                    float _2914 = -_2910;
                    float _2916 = _2914 + _2908;
                    float _2918 = _2916 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2920 = precise::max(_2918, _2912);
                    float _2922 = precise::min(0.0, _2920);
                    bool _2924 = _2922 != _2918;
                    bool _2926 = isnan(_2922);
                    bool _2928 = _2924 || _2926;
                    bool _2930 = isnan(_2918);
                    bool _2932 = _2928 || _2930;
                    bool _2934 = !_2932;
                    if (!_2934)
                    {
                        float _2936 = fma(_1446, 5.0, _1064);
                        float _2938 = fma(_1444, 5.0, _962);
                        float3 _8105 = float3(_2938, _2936, float(int(_908)));
                        float3 _8107 = select(_8105, float3(0.0), isnan(_8105));
                        float _2940 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8107.xy, uint(rint(_8107.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8107.xy, uint(rint(_8107.z))).x;
                        float _2942 = fma(_1448, 5.0, _960);
                        float _2944 = fma(_1448, 9.0, -1.0);
                        float _2946 = -_2942;
                        float _2948 = _2946 + _2940;
                        float _2950 = _2948 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2952 = precise::max(_2950, _2944);
                        float _2954 = precise::min(0.0, _2952);
                        bool _2956 = _2954 != _2950;
                        bool _2958 = isnan(_2954);
                        bool _2960 = _2956 || _2958;
                        bool _2962 = isnan(_2950);
                        bool _2964 = _2960 || _2962;
                        bool _2966 = !_2964;
                        if (!_2966)
                        {
                            float _2968 = fma(_1446, 6.0, _1064);
                            float _2970 = fma(_1444, 6.0, _962);
                            float3 _8159 = float3(_2970, _2968, float(int(_908)));
                            float3 _8161 = select(_8159, float3(0.0), isnan(_8159));
                            float _2972 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8161.xy, uint(rint(_8161.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8161.xy, uint(rint(_8161.z))).x;
                            float _2974 = _960 + _2880;
                            float _2976 = fma(_1448, 10.5, -1.0);
                            float _2978 = -_2974;
                            float _2980 = _2978 + _2972;
                            float _2982 = _2980 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2984 = precise::max(_2982, _2976);
                            float _2986 = precise::min(0.0, _2984);
                            bool _2988 = _2986 != _2982;
                            bool _2990 = isnan(_2986);
                            bool _2992 = _2988 || _2990;
                            bool _2994 = isnan(_2982);
                            bool _2996 = _2992 || _2994;
                            _2998 = _2996;
                        }
                    }
                }
            }
        }
    }
    if (!_2998)
    {
        float _3000 = _2786 + 1.0;
        _2806 = _3000;
    }
    _2998 = false;
    float _3002 = _2806;
    float _3004 = _1484 * 1.5;
    float _3006 = precise::max(_1490, _3004);
    float _3008 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _3010 = 1.0 + _3008;
    float _3012 = precise::min(0.0, _3006);
    float _3014 = fma(_3010, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    bool _3016 = _3012 != _1490;
    bool _3018 = isnan(_3012);
    bool _3020 = _3016 || _3018;
    bool _3022 = isnan(_1490);
    bool _3024 = _3020 || _3022;
    float _3026 = _3014 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _3028 = !_3024;
    float _3030 = _3002;
    if (!_3028)
    {
        float _3032 = _1064 + _1482;
        float _3034 = _962 + _1480;
        float3 _8264 = float3(_3034, _3032, float(int(_908)));
        float3 _8266 = select(_8264, float3(0.0), isnan(_8264));
        float _3036 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8266.xy, uint(rint(_8266.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8266.xy, uint(rint(_8266.z))).x;
        float _3038 = _960 + _1484;
        float _3040 = _1484 * 3.0;
        float _3042 = -_3038;
        float _3044 = _3042 + _3036;
        float _3046 = _3044 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3048 = precise::max(_3046, _3040);
        float _3050 = precise::min(0.0, _3048);
        bool _3052 = _3050 != _3046;
        bool _3054 = isnan(_3050);
        bool _3056 = _3052 || _3054;
        bool _3058 = isnan(_3046);
        bool _3060 = _3056 || _3058;
        bool _3062 = !_3060;
        if (!_3062)
        {
            float _3064 = fma(_1482, 2.0, _1064);
            float _3066 = fma(_1480, 2.0, _962);
            float3 _8318 = float3(_3066, _3064, float(int(_908)));
            float3 _8320 = select(_8318, float3(0.0), isnan(_8318));
            float _3068 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8320.xy, uint(rint(_8320.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8320.xy, uint(rint(_8320.z))).x;
            float _3070 = fma(_1484, 2.0, _960);
            float _3072 = _1484 * 4.5;
            float _3074 = -_3070;
            float _3076 = _3074 + _3068;
            float _3078 = _3076 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3080 = precise::max(_3078, _3072);
            float _3082 = precise::min(0.0, _3080);
            bool _3084 = _3082 != _3078;
            bool _3086 = isnan(_3082);
            bool _3088 = _3084 || _3086;
            bool _3090 = isnan(_3078);
            bool _3092 = _3088 || _3090;
            bool _3094 = !_3092;
            if (!_3094)
            {
                float _3096 = fma(_1482, 3.0, _1064);
                float _3098 = fma(_1480, 3.0, _962);
                float3 _8372 = float3(_3098, _3096, float(int(_908)));
                float3 _8374 = select(_8372, float3(0.0), isnan(_8372));
                float _3100 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8374.xy, uint(rint(_8374.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8374.xy, uint(rint(_8374.z))).x;
                float _3102 = _960 + _3040;
                float _3104 = _1484 * 6.0;
                float _3106 = -_3102;
                float _3108 = _3106 + _3100;
                float _3110 = _3108 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3112 = precise::max(_3110, _3104);
                float _3114 = precise::min(0.0, _3112);
                bool _3116 = _3114 != _3110;
                bool _3118 = isnan(_3114);
                bool _3120 = _3116 || _3118;
                bool _3122 = isnan(_3110);
                bool _3124 = _3120 || _3122;
                bool _3126 = !_3124;
                if (!_3126)
                {
                    float _3128 = fma(_1482, 4.0, _1064);
                    float _3130 = fma(_1480, 4.0, _962);
                    float3 _8426 = float3(_3130, _3128, float(int(_908)));
                    float3 _8428 = select(_8426, float3(0.0), isnan(_8426));
                    float _3132 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8428.xy, uint(rint(_8428.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8428.xy, uint(rint(_8428.z))).x;
                    float _3134 = fma(_1484, 4.0, _960);
                    float _3136 = _1484 * 7.5;
                    float _3138 = -_3134;
                    float _3140 = _3138 + _3132;
                    float _3142 = _3140 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3144 = precise::max(_3142, _3136);
                    float _3146 = precise::min(0.0, _3144);
                    bool _3148 = _3146 != _3142;
                    bool _3150 = isnan(_3146);
                    bool _3152 = _3148 || _3150;
                    bool _3154 = isnan(_3142);
                    bool _3156 = _3152 || _3154;
                    bool _3158 = !_3156;
                    if (!_3158)
                    {
                        float _3160 = fma(_1482, 5.0, _1064);
                        float _3162 = fma(_1480, 5.0, _962);
                        float3 _8480 = float3(_3162, _3160, float(int(_908)));
                        float3 _8482 = select(_8480, float3(0.0), isnan(_8480));
                        float _3164 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8482.xy, uint(rint(_8482.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8482.xy, uint(rint(_8482.z))).x;
                        float _3166 = fma(_1484, 5.0, _960);
                        float _3168 = fma(_1484, 9.0, -1.0);
                        float _3170 = -_3166;
                        float _3172 = _3170 + _3164;
                        float _3174 = _3172 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3176 = precise::max(_3174, _3168);
                        float _3178 = precise::min(0.0, _3176);
                        bool _3180 = _3178 != _3174;
                        bool _3182 = isnan(_3178);
                        bool _3184 = _3180 || _3182;
                        bool _3186 = isnan(_3174);
                        bool _3188 = _3184 || _3186;
                        bool _3190 = !_3188;
                        if (!_3190)
                        {
                            float _3192 = fma(_1482, 6.0, _1064);
                            float _3194 = fma(_1480, 6.0, _962);
                            float3 _8534 = float3(_3194, _3192, float(int(_908)));
                            float3 _8536 = select(_8534, float3(0.0), isnan(_8534));
                            float _3196 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8536.xy, uint(rint(_8536.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8536.xy, uint(rint(_8536.z))).x;
                            float _3198 = _960 + _3104;
                            float _3200 = fma(_1484, 10.5, -1.0);
                            float _3202 = -_3198;
                            float _3204 = _3202 + _3196;
                            float _3206 = _3204 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3208 = precise::max(_3206, _3200);
                            float _3210 = precise::min(0.0, _3208);
                            bool _3212 = _3210 != _3206;
                            bool _3214 = isnan(_3210);
                            bool _3216 = _3212 || _3214;
                            bool _3218 = isnan(_3206);
                            bool _3220 = _3216 || _3218;
                            _3222 = _3220;
                        }
                    }
                }
            }
        }
    }
    if (!_3222)
    {
        float _3224 = _3002 + 1.0;
        _3030 = _3224;
    }
    _3222 = false;
    float _3226 = _3030;
    float _3228 = _3226 * 0.125;
    float _3230 = -_3228;
    float _3232 = fma(_3230, _3026, 1.0);
    out.m_39.x = _3232;
    return out;
}

